<template>
    <div>
        <Hello/>
        <div class="clearFloat"></div>

        <div class="floatLeft w1"></div>

        <LogoutForm/>
    </div>
</template>

<script>
    import Hello from '../components/Hello.vue'
    import LogoutForm from '../components/LogoutForm.vue'

    export default {
        name: 'Logout',
        components: {
            LogoutForm,
            Hello,
        },
        mounted: function () {
            this.$store.dispatch('submitLogout').then(() => {
                this.$router.push('/')
            });
        }
    }
</script>
