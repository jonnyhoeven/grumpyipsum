<template>
    <div>
        <Hello/>

        <div class="clearFloat"></div>

        <div class="floatLeft w1"></div>

        <LoginForm/>

        <LogoutForm/>

        <div class="floatLeft w1"></div>
    </div>
</template>

<script>
    import Hello from '../components/Hello.vue'
    import LoginForm from '../components/LoginForm.vue'
    import LogoutForm from '../components/LogoutForm.vue'

    export default {
        name: 'Login',
        components: {
            Hello,
            LoginForm,
            LogoutForm,
        }
    }
</script>
