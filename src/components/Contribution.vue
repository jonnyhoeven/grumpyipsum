<template>
    <div>

        <div class="floatLeft w2">

        </div>

        <div class="floatLeft w8 well">

            <div class="floatLeft w12">
                <h1>Share your negativity</h1>

                <div class="floatLeft w6">
                    <p>
                        Contribute to society,
                    </p>
                    <p>
                        Finally the ability to channel that negativity into something more productive.
                        Target humanities worst: Designers, Marketeers and Office workers in general.
                        Anonymously and without confrontation.
                    </p>
                    <p>Take control now! Stop unearned, unrealistic positivity in it's tracks. Tell them they what they need to know.
                        That their ideas sucks...</p>
                </div>

                <div class="floatLeft w6">

                    <div class="floatLeft w12">
                        <p>Horrible people, need to be made aware of their shortcomings.</p>
                    </div>

                    <div class="floatLeft w12">
                        <blockquote>
                            <small>
                                <p>
                                    My colleagues sure knew what I thought about their new project,
                                    Mike even got the personalised hints about his wife.
                                    4 out of 5, would get fired again.
                                </p>
                                <div>
                                    <img src="../assets/paw-dark.png" class="floatRight">
                                    <img src="../assets/paw.png" class="floatRight">
                                    <img src="../assets/paw.png" class="floatRight">
                                    <img src="../assets/paw.png" class="floatRight">
                                    <img src="../assets/paw.png" class="floatRight">
                                    <p class="floatRight" style="margin-top:2pt;"><i>John Whiskers</i></p>
                                </div>
                            </small>
                        </blockquote>
                    </div>
                    <div class="floatLeft w12">
                        <p>
                            Don't hesitate, tell them what you feel and share your hate to
                            the Grumpy Ipsum collection. Afterwards, pat yourself on the back.
                            Knowing the world is a darker and more desolate place, thanks to you!
                        </p>
                    </div>
                </div>

            </div>

            <div class="clearFloat"></div>

            <div class="floatLeft labelContainer w4">
                <div>
                    <label for="name">Your Name:</label>
                </div>
            </div>
            <div class="floatLeft formContainer w8">
                <input type="text" id="name" class="w12" v-model="name"
                       placeholder="Negative Nancy"
                       minlength="3"
                       maxlength="50"/>
            </div>

            <div class="floatLeft labelContainer w4">
                <div>
                    <label for="email">Your E-mail adres:</label>
                </div>
            </div>
            <div class="floatLeft formContainer w8">
                <input type="email" id="email" class="w12" v-model="email"
                       placeholder="NegativeNancy@SomeMail.com"
                       minlength="5"
                       maxlength="150"/>
            </div>

            <div class="floatLeft labelContainer w4">
                <div><label for="sentence">Your Contribution to society:</label></div>
            </div>
            <div class="floatLeft formContainer w8">
                <textarea v-model="text" id="sentence" class="w12"
                          placeholder="Yes, let the hate flow through you..."
                          minlength="10"
                          maxlength="300"></textarea>
            </div>


            <div v-if="result === true" class="floatRight labelContainer w12">
                <div>{{message}}</div>
            </div>

            <div v-else-if="result !== null" class="floatRight labelContainer w12">
                <div>{{message}}</div>
            </div>

            <div class="floatRight w3">
                <button v-if="result !== true" v-on:click="submitSentence()" class="w12">
                    <span v-if="result === false">Retry</span>
                    <span v-else>Submit</span>
                </button>
            </div>
        </div>

        <div class="clearFloat"></div>


    </div>
</template>

<script>
    export default {
        name: "Contribution",
        methods: {
            submitSentence() {
                this.$store.dispatch('submitSentence').then(() => {
                    //console.log('RETsubmitSentence');
                });
            },
        },
        computed: {
            result: function () {
                return this.$store.state.submitSentence.result;
            },
            message: function () {
                return this.$store.state.submitSentence.message;
            },
            name: {
                //getter
                get: function () {
                    return this.$store.state.submitSentence.name;
                },
                //setter
                set: function (newValue) {
                    this.$store.state.submitSentence.name = newValue;
                }
            },
            email: {
                //getter
                get: function () {
                    return this.$store.state.submitSentence.email;
                },
                //setter
                set: function (newValue) {
                    this.$store.state.submitSentence.email = newValue;
                }
            },
            text: {
                //getter
                get: function () {
                    return this.$store.state.submitSentence.text;
                },
                //setter
                set: function (newValue) {
                    this.$store.state.submitSentence.text = newValue;
                }
            }

        }
    }
</script>

<style scoped>

    .labelContainer {

    }

    .formContainer {

    }

    .formContainer input, select {

    }

    .formContainer textarea {
        height: 70pt;
    }

</style>