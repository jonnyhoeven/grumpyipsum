<template>
    <div class="noHeaderContainer">
        <div class="clearFloat"></div>

        <div class="floatLeft w1"></div>

        <Submissions/>

        <div class="floatLeft w1"></div>

        <RegisterForm/>

    </div>
</template>

<script>
    import RegisterForm from '../components/RegisterForm.vue'
    import Submissions from '../components/Submissions.vue'
    export default {
        name: 'Admin',
        components: {
            RegisterForm,
            Submissions,
        }
    }
</script>

<style scoped>
</style>

