<template>
    <div>
        <Hello/>
        <div class="clearFloat"></div>

        <Contribution/>
    </div>
</template>

<script>
    import Hello from '../components/Hello.vue'
    import Contribution from '../components/Contribution.vue'

    export default {
        name: 'contribute',
        components: {
            Contribution,
            Hello,
        }
    }
</script>
