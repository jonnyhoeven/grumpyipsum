<template>
    <div v-if="loginResult" class="floatLeft w5 well">
        <div class="w12 floatLeft">
            <h1>Submissions</h1>
        </div>

        <Submission v-for="submission in submissionCollection"
                    v-bind:key="submission.id"
                    v-bind:submission="submission"/>

        <div v-if="submissionCollection === undefined || submissionCollection.length === 0" style="text-align:center;" >
            No Submissions...
        </div>
    </div>
</template>

<script>
    import Submission from '../components/Submission.vue'

    export default {
        name: "Submissions",
        components: {
            Submission,
        },
        methods: {
            fetchSubmissions() {
                this.$store.dispatch('fetchSubmissions').then(() => {
                    //console.log('RETSubmissions');
                });
            },
        },
        computed: {
            result: function () {
                return this.$store.state.submissions.result;
            },
            message: function () {
                return this.$store.state.submissions.message;
            },
            loginResult: function () {
                return this.$store.state.login.result;
            },
            submissionCollection: function () {
                return this.$store.state.submissions.collection;
            },
        },
        mounted: function () {
            if (!this.loginResult) {
                this.$router.push('/login');
            } else {
                this.fetchSubmissions();
            }
        }
    }
</script>
