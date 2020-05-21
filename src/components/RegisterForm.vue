<template>
    <div v-if="loginResult" class="floatLeft w4 well">
        <div class="w12 floatLeft">
            <h1>Register new user</h1>
        </div>

        <div class="floatLeft labelContainer w4">
            <div>
                <label for="registerUsername">Username:</label>
            </div>
        </div>
        <div class="floatLeft formContainer w8">
            <input class="w12" v-model="username" type="text" id="registerUsername"
                   placeholder="Username"/>
        </div>


        <div class="floatLeft labelContainer w4">
            <div>
                <label for="registerEmail">E-mail adres:</label>
            </div>
        </div>
        <div class="floatLeft formContainer w8">
            <input class="w12" v-model="authEmail" type="email" id="registerEmail" placeholder="E-mail"/>
        </div>

        <div class="floatLeft labelContainer w4">
            <div>
                <label for="registerPassword">Password:</label>
            </div>
        </div>

        <div class="floatLeft formContainer w8">
            <input type="password" v-model="password" id="registerPassword" class="w12"
                   placeholder="Password"/>
        </div>

        <button type="submit" v-on:click="submitRegister()" class="w3 floatRight">Register</button>
        <div class="w8 floatRight" v-if="result !== null">{{ message }}</div>
    </div>
</template>

<script>
    export default {
        name: "RegisterForm",
        methods: {
            submitRegister() {
                this.$store.dispatch('submitRegister').then(() => {
                    //console.log('RETsubmitRegister');
                });
            },
        },
        computed: {
            result: function () {
                return this.$store.state.register.result;
            },
            message: function () {
                return this.$store.state.register.message;
            },
            loginResult: function () {
                return this.$store.state.login.result;
            },
            username: {
                //getter
                get: function () {
                    return this.$store.state.register.username;
                },
                //setter
                set: function (newValue) {
                    this.$store.state.register.username = newValue;
                }
            },
            authEmail: {
                //getter
                get: function () {
                    return this.$store.state.register.authEmail;
                },
                //setter
                set: function (newValue) {
                    this.$store.state.register.authEmail = newValue;
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
                    this.$store.state.register.password = newValue;
                }
            },
        }
    }
</script>

