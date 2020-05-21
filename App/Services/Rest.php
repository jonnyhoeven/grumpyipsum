<?php
/**
 * Created by PhpStorm.
 * User: Jonny
 * Date: 29/03/2019
 * Time: 21:01
 */
namespace App\Services;

use Delight\Auth\EmailNotVerifiedException;
use Delight\Auth\InvalidEmailException;
use Delight\Auth\InvalidPasswordException;
use Delight\Auth\TooManyRequestsException;
use Illuminate\Database\Capsule\Manager as DB;
use Delight\Auth\Auth;
use App\Models\Sentence;
use App\Models\Vote;

class Rest
{
    private $request;

    private $auth;

    private $sentenceSubmitRateLimitDuration;

    private $passwordBlacklist;

    public function __construct($postData)
    {
        new Database();
        $this->auth = new Auth(DB::connection()->getPdo());

        // setup settings @todo move to db settings
        $this->sentenceSubmitRateLimitDuration = '-10 minute'; // time from now since last sentence submission
        $this->passwordBlacklist = ['password1', '123456', 'qwerty'];

        $this->request = json_decode(json_encode($postData));
    }

    public function retData()
    {
        $ret = new \stdClass;
        $ret->result = false;
        $ret->message = 'Unknown error';

        if (!$this->request->action) {
            $ret->result = false;
            $ret->message = 'No action';
            return $ret;
        }

        switch ($this->request->action) {
            case 'sentences':
                return $this->fetchSentences();
                break;
            case 'submissions':
                return $this->fetchSubmissions();
                break;
            case 'detail':
                return $this->fetchDetail();
                break;
            case 'register':
                return $this->register();
                break;
            case 'login':
                return $this->login();
                break;
            case 'logout':
                return $this->logout();
                break;
            case 'vote':
                return $this->submitVote();
                break;
            case 'submitSentence':
                return $this->submitSentence();
                break;
            case 'acceptSubmission':
                return $this->acceptSubmission();
                break;
            case 'deleteSubmission':
                return $this->deleteSubmission();
        }

        $ret->result = false;
        $ret->message = 'Unknown action';
        return $ret;
    }

    // data fetchers

    private function fetchSentences()
    {
        $ret = new \stdClass;
        $ret->result = false;
        $ret->message = 'Unknown error';

        $amount = (int)$this->request->count;

        if ($amount < 1 || $amount > 50) {
            $amount = 20;
        }

        $ret->collection = Sentence::inRandomOrder()
                                   ->where('accepted', '=', 1)
                                   ->where('text', '!=', '')
                                   ->take($amount)
                                   ->pluck('text', 'id')
                                   ->all();

        if ($ret->collection) {
            $ret->result = true;
            $ret->message = 'Retrieved ' . $amount . ' sentence(s)';
        }

        return $ret;
    }

    private function fetchSubmissions()
    {
        $ret = new \stdClass;
        $ret->collection = null;
        $ret->result = false;
        $ret->message = 'Unknown error';

        if (!$this->auth->isLoggedIn()) {
            $ret->result = false;
            $ret->message = 'Not logged in';
            return $ret;
        }

        $ret->collection = Sentence::where('accepted', '=', 0)->get()->makeVisible(['ip'])->toArray();

        if($ret->collection) {
            $ret->result = true;
            $ret->message = 'Retrieved submissions';
        }

        return $ret;
    }

    private function fetchDetail()
    {
        $ret = new \stdClass;
        $ret->sentence = null;
        $ret->result = false;
        $ret->message = 'Unknown error';

        $sentenceID = (int)$this->request->sentenceID;

        if (is_numeric($sentenceID) && $sentenceID > 0) {
            $ret->sentence = Sentence::where('id', $sentenceID)
                                     ->where('accepted', '=', 1)
                                     ->where('text', '!=', '')
                                     ->firstOrFail();
            $ret->result = true;
            $ret->message = 'Retrieved sentence details';
        } else {
            $ret->sentence = Sentence::inRandomOrder()
                                     ->where('accepted', '=', 1)
                                     ->where('text', '!=', '')
                                     ->firstOrFail();
            $ret->result = true;
            $ret->message = 'Retrieved random sentence';
        }


        if ($ret->sentence->rating) {
            $ret->sentence->rating->first();
        }

        return $ret;
    }

    // actions

    private function login()
    {
        $ret = new \stdClass;
        $ret->result = false;
        $ret->message = 'Unknown error';

        $authEmail = Helper::xssafe($this->request->authEmail);
        $password = Helper::xssafe($this->request->password);
        // $ip = Helper::getClientRequestIP();
        // $userId = $this->auth->admin()->createUser('jonnyhoeven@gmail.com','test', 'test');


        try {
            $this->auth->login($authEmail, $password);
        } catch (InvalidEmailException $e) {
            $ret->result = false;
            $ret->message = 'Wrong email address';
            return $ret;
        } catch (InvalidPasswordException $e) {
            $ret->result = false;
            $ret->message = 'Wrong password';
            return $ret;
        } catch (EmailNotVerifiedException $e) {
            $ret->result = false;
            $ret->message = 'Email not verified';
            return $ret;
        } catch (TooManyRequestsException $e) {
            $ret->result = false;
            $ret->message = 'Too many requests';
            return $ret;
        }

        $ret->result = true;
        $ret->message = 'Logged in' . $this->auth->isLoggedIn() . $this->auth->getUserId();
        return $ret;
    }

    private function logout()
    {
        $ret = new \stdClass;
        $ret->result = false;
        $ret->message = 'Unknown error';

        try {
            $this->auth->logOutEverywhere();
        } catch (\Delight\Auth\NotLoggedInException $e) {
            $ret->result = false;
            $ret->message = 'Not logged in';
            return $ret;
        }

        $ret->result = true;
        $ret->message = 'Logged out';
        return $ret;
    }

    private function register()
    {
        $ret = new \stdClass;
        $ret->result = false;
        $ret->message = 'Unknown error';

        $authEmail = Helper::xssafe($this->request->authEmail);
        $username = Helper::xssafe($this->request->username);
        $password = Helper::xssafe($this->request->password);

        if (!$this->auth->isLoggedIn()) {
            $ret->result = false;
            $ret->message = 'Not logged in';
            return $ret;
        }

        if (strlen($password) < 8) {
            $ret->result = false;
            $ret->message = 'Password too short';
            return $ret;
        }

        if (in_array($password, $this->passwordBlacklist, false)) {
            $ret->result = false;
            $ret->message = 'Password not allowed';
            return $ret;
        }

        try {
            $this->auth->register($authEmail, $password, $username);
        } catch (InvalidEmailException $e) {
            $ret->result = false;
            $ret->message = 'Invalid email address';
            return $ret;
        } catch (InvalidPasswordException $e) {

            $ret->message = 'Invalid password';
            return $ret;

        } catch (\Delight\Auth\UserAlreadyExistsException $e) {
            $ret->result = false;
            $ret->message = 'User already exists';
            return $ret;
        } catch (TooManyRequestsException $e) {
            $ret->result = false;
            $ret->message = 'Too many requests';
            return $ret;
        }

        $ret->result = true;
        $ret->message = 'Registration completed';
        return $ret;
    }

    private function submitVote()
    {
        $result = false;
        $resultRating = 0;

        // get inputs
        $sentenceID = (int)$this->request->sentenceID;
        $rating = (int)$this->request->rating;
        $ip = Helper::getClientRequestIP();

        if ($rating >= 1 && $rating <= 5 && $sentenceID > 0) {

            $sentence = Sentence::find($sentenceID);

            if ($sentence) {
                $vote = Vote::firstOrNew(['sentence_id' => $sentenceID], ['ip' => $ip]);

                if ($vote->rating !== $rating) {
                    $vote->rating = $rating;
                    $result = $vote->save();
                }

                if ($sentence->rating) {
                    $sentence->rating->first();
                }
                $resultRating = $sentence->rating;
            }
        }

        return ['rating' => $resultRating, 'result' => $result];
    }

    private function submitSentence()
    {
        $ret = new \stdClass;
        $ret->result = false;
        $ret->message = 'Unknown error';

        $name = Helper::xssafe($this->request->settings->name);
        $email = Helper::xssafe($this->request->settings->email);
        $text = Helper::xssafe($this->request->settings->text);
        $ip = Helper::getClientRequestIP();

        if ($name === '' || $email === '' || $text === '') {
            $ret->message = 'Name, email or sentence missing.';
            return $ret;
        }

        // determine min date since last submission
        $minLastSubmissionDate = new \DateTime($this->sentenceSubmitRateLimitDuration);
        $minLastSQLStr = $minLastSubmissionDate->format('Y-m-d H:i:s');

        // check if a submission was submitted too soon
        $submitToSoon = Sentence::where('ip', '=', $ip)
                                ->where('created_at', '>=', $minLastSQLStr)
                                ->exists();
        if ($submitToSoon) {
            $ret->message = 'Your submission rate reflects your lacking personality.';
            $ret->result = true; // We'll set this to true so the input will reset and submit button disappears.
            return $ret;
        }

        $sentence = new Sentence;
        $sentence->name = $name;
        $sentence->email = $email;
        $sentence->text = $text;
        $sentence->ip = $ip;


        if (!$sentence->save()) {
            $ret->message = 'You broke it, like everything you touch.';
            $ret->result = false;
            return $ret;
        }

        $ret->message = 'Thank you, your submission has been recorded and will be reviewed before publication.';
        $ret->result = true;
        return $ret;
    }

    private function acceptSubmission()
    {
        $ret = new \stdClass;
        $ret->result = false;
        $ret->message = 'Unknown error';
        $ret->sentenceID = (int) $this->request->sentenceID;

        if (!$this->auth->isLoggedIn()) {
            $ret->result = false;
            $ret->message = 'Not logged in';
            return $ret;
        }

        $sentence = Sentence::where('id', $ret->sentenceID)->first();
        if(!$sentence) {
            $ret->result = false;
            $ret->message = 'Not Found';
            return $ret;
        }

        $sentence->accepted = true;

        if (!$sentence->save()) {
            $ret->message = 'Cannot save';
            $ret->result = false;
            return $ret;
        }

        $ret->message = 'Accepted';
        $ret->result = true;
        return $ret;
    }

    private function deleteSubmission()
    {
        $ret = new \stdClass;
        $ret->result = false;
        $ret->message = 'Unknown error';
        $ret->sentenceID = (int) $this->request->sentenceID;

        if(!Sentence::destroy($ret->sentenceID)) {
            $ret->result = false;
            $ret->message = 'Not Found';
            return $ret;
        }

        $ret->message = 'Deleted';
        $ret->result = true;
        return $ret;
    }

}