<template>
    <div v-if="loginResult" class="floatLeft w4 well">
        <div class="w12 floatLeft">
            <h1>Logout</h1>
        </div>

        <button type="submit" v-if="result !==true" v-on:click="submitLogout()" class="w3 floatRight">Logout</button>

        <div class="w9 floatRight" v-if="result !== null">{{ message }}</div>
    </div>
</template>

<script>
    export default {
        name: "LogoutForm",
        methods: {
            submitLogout() {
                this.$store.dispatch('submitLogout').then(() => {
                    this.$router.push('/')
                });
            },
        },
        computed: {
            loginResult: function () {
                return this.$store.state.login.result;
            },
            result: function () {
                return this.$store.state.logout.result;
            },
            message: function () {
                return this.$store.state.logout.message;
            },
        },
    }
</script>
