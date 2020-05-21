<template>
    <div v-if="!result" class="floatLeft w4 well">
        <div class="w12 floatLeft">
            <h1>Login</h1>
        </div>

        <div class="floatLeft labelContainer w4">
            <div>
                <label for="loginEmail">E-mail:</label>
            </div>
        </div>
        <div class="floatLeft formContainer w8">
            <input class="w12" v-model="authEmail" type="email" id="loginEmail" placeholder="E-mail"/>
        </div>

        <div class="floatLeft labelContainer w4">
            <div>
                <label for="loginPassword">Password</label>
            </div>
        </div>

        <div class="floatLeft formContainer w8">
            <input class="w12" v-model="password" type="password" id="loginPassword" placeholder="Password"/>
        </div>

        <button type="submit" v-on:click="submitLogin()" class="w3 floatRight">Login</button>

        <div class="w9 floatRight" v-if="result !== null">{{ message }}</div>
    </div>
</template>

<script>
    export default {
        name: "loginForm",
        methods: {
            submitLogin() {
                this.$store.dispatch('submitLogin').then(() => {
                    this.$router.push('/admin')
                });
            },
        },
        computed: {
            result: function () {
                return this.$store.state.login.result;
            },
            message: function () {
                return this.$store.state.login.message;
            },
            authEmail: {
                //getter
                get: function () {
                    return this.$store.state.login.authEmail;
                },
                //setter
                set: function (newValue) {
                    this.$store.state.login.authEmail = newValue;
                }
            },
            password: {
                //getter
                get: function () {
                    //return this.$store.state.login.password;
                    // do not repopulate
                    return null;
                },
                //setter
                set: function (newValue) {
                    this.$store.state.login.password = newValue;
                }
            },
        }
    }
</script>

