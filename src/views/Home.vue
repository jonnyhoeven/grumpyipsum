<template>
    <div>
        <Hello/>
        <div class="clearFloat"></div>

        <LorumIpsum/>
    </div>
</template>

<script>
    import Hello from '../components/Hello.vue'
    import LorumIpsum from '../components/LorumIpsum.vue'

    export default {
        name: 'home',
        components: {
            LorumIpsum,
            Hello,
        }
    }
</script>
