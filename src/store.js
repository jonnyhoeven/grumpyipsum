import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex);

export default new Vuex.Store({
    state: {
        settings: {
            paragraphs: 3,
            sentences: 20,
        },
        sentences: {
            collection: [],
            result: null,
            message: null,
        },
        submissions: {
            collection: [],
            result: null,
            message: null,
        },
        detail: {
            sentence: {
                id: null,
                text: null,
                name: null,
                email: null,
                created_at: null,
                rating: {
                    avg: null,
                    count: 0
                },
            },
            result: null,
            message: null
        },
        submitSentence: {
            name: null,
            email: null,
            text: null,
            result: null,
            message: null,
        },
        register: {
            username: null,
            authEmail: null,
            password: null,
            result: null,
            message: null,
        },
        login: {
            authEmail: 'jonnyhoeven@gmail.com',
            password: 'test',
            result: null,
            message: null,
        },
        logout: {
            result: null,
            message: null,
        },
        rate: {
            result: null,
            message: null,
        },
    },
    mutations: {
        updateSentenceDetail(state, payload) {
            state.detail.sentence = payload.sentence;
            state.detail.result = payload.result;
            state.detail.message = payload.message;
        },
        updateSentences(state, payload) {
            state.sentences.result = payload.result;
            state.sentences.message = payload.message;
            if(payload.result) {
                state.sentences.collection = payload.collection;
            }
        },
        updateSubmissions(state, payload) {
            //console.log(payload);
            state.submissions.result = payload.result;
            state.submissions.message = payload.message;
            if(payload.result) {
                state.submissions.collection = payload.collection;
            }
        },
        updateSubmitSentence(state, payload) {
            state.submitSentence.result = payload.result;
            state.submitSentence.message = payload.message;
            if (payload.result === true) { // reset form data
                state.submitSentence.name = null;
                state.submitSentence.email = null;
                state.submitSentence.text = null;
            }
        },
        updateVoteSentence: function (state, payload) {
            state.detail.sentence.rating = payload.rating;
            state.rate.result = payload.result;
        },
        updateRegister: function (state, payload) {
            state.register.result = payload.result;
            state.register.message = payload.message;
            if (payload.result) {
                state.register.username = null;
                state.register.authEmail = null;
                state.register.password = null;

            }
        },
        updateLogin: function (state, payload) {
            state.login.result = payload.result;
            state.login.message = payload.message;
            if (payload.result) {
                state.login.password = null;
                state.login.authEmail = null;
            }
        },
        updateLogout: function (state, payload) {
            state.logout.result = payload.result;
            state.logout.message = payload.message;

            if (payload.result) {
                state.login.result = null;
                state.login.message = null;
            }
        },
        updateAcceptSubmission: function (state, payload) {
            let sentenceID = payload.sentenceID;
            state.submissions.result = parseInt(payload.result);
            state.submissions.message = payload.message;

            if (payload.result) {
                let acceptedSubmission = state.submissions.collection.filter( function(submission) {
                    return (submission.id !== sentenceID);
                });

                state.submissions.collection = acceptedSubmission;
            }
        },
        updateDeleteSubmission: function (state, payload) {
            let sentenceID = payload.sentenceID;
            state.submissions.result = parseInt(payload.result);
            state.submissions.message = payload.message;

            if (payload.result) {
                let acceptedSubmission = state.submissions.collection.filter( function(submission) {
                    return (submission.id !== sentenceID);
                });

                state.submissions.collection = acceptedSubmission;
            }
        }

    },
    actions: {
        fetchSentenceDetail(context, payload) {
            let data = {
                action: 'detail',
                sentenceID: payload,
            };

            this.state.detail.result = null;
            this.state.detail.message = null;

            return new Promise((resolve) => {
                Vue.axios({data: data}).then((response) => {
                    context.commit('updateSentenceDetail', response.data);
                    resolve();
                })
            });
        },
        fetchVoteSentence(context, payload) {
            if (payload.sentenceID < 1) {
                return null;
            }
            if (payload.rating < 1 || payload.rating > 5) {
                return null;
            }

            let data = {
                action: 'vote',
                sentenceID: payload.sentenceID,
                rating: payload.rating,
            };
            return new Promise((resolve) => {
                Vue.axios({data: data}).then((response) => {
                    context.commit('updateVoteSentence', response.data);
                    resolve();
                })
            });
        },
        fetchSentences(context) {
            let data = {
                action: 'sentences',
                count: this.state.settings.sentences
            };
            //console.log(data);

            return new Promise((resolve) => {
                Vue.axios({data: data}).then((response) => {
                    context.commit('updateSentences', response.data);
                    resolve();
                })
            });
        },
        fetchSubmissions(context) {
            let data = {
                action: 'submissions',
            };

            return new Promise((resolve) => {
                Vue.axios({data: data}).then((response) => {
                    context.commit('updateSubmissions', response.data);
                    resolve();
                })
            });
        },
        submitSentence(context) {
            let data = {
                action: 'submitSentence',
                settings: this.state.submitSentence,
            };

            return new Promise((resolve) => {
                Vue.axios({data: data}).then((response) => {
                    context.commit('updateSubmitSentence', response.data);
                    resolve();
                })
            });
        },
        acceptSubmission(context, payload) {
            this.state.submissions.result = null;
            this.state.submissions.message = null;
            let data = {
                action: 'acceptSubmission',
                sentenceID: payload,
            };

            return new Promise((resolve) => {
                Vue.axios({data: data}).then((response) => {
                    context.commit('updateAcceptSubmission', response.data);
                    resolve();
                })
            });
        },
        deleteSubmission(context, payload) {
            this.state.submissions.result = null;
            this.state.submissions.message = null;
            let data = {
                action: 'deleteSubmission',
                sentenceID: payload,
            };

            return new Promise((resolve) => {
                Vue.axios({data: data}).then((response) => {
                    context.commit('updateDeleteSubmission', response.data);
                    resolve();
                })
            });
        },
        submitRegister(context) {
            let data = {
                action: 'register',
                username: this.state.register.username,
                authEmail: this.state.register.authEmail,
                password: this.state.register.password,
            };

            return new Promise((resolve) => {
                Vue.axios({data: data}).then((response) => {
                    context.commit('updateRegister', response.data);
                    resolve();
                })
            });
        },
        submitLogin(context) {
            let data = {
                action: 'login',
                authEmail: this.state.login.authEmail,
                password: this.state.login.password,
            };

            return new Promise((resolve) => {
                Vue.axios({withCredentials: true, data: data}).then((response) => {
                    context.commit('updateLogin', response.data);
                    resolve();
                })
            });
        },
        submitLogout(context) {
            let data = {
                action: 'logout',
            };

            return new Promise((resolve) => {
                Vue.axios({data: data}).then((response) => {
                    context.commit('updateLogout', response.data);
                    resolve();
                })
            });
        },
    }
})
