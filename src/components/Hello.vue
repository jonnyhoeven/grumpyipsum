<template>
    <div class="headerContainer hand" v-on:click="fetchSentenceDetail">
        <div class="repeatBackground">
            <img alt="Un-impressed grumpy on a beach with a speech balloon"
                 width="365" height="365" src="../assets/im-not-impressed.jpg">

            <transition name="fade">
                <div v-if="result" class="fadeIn"
                     v-bind:class="{ fadeIn: result, fadeOut: !result }">
                    <h1>{{ sentence.text }}</h1>
                </div>
            </transition>

        </div>
    </div>
</template>

<script>
    export default {
        name: "Hello",
        methods: {
            fetchSentenceDetail() {
                this.$store.dispatch('fetchSentenceDetail').then(() => {
                    //console.log('Refreshed detail random')
                });
            },
        },
        computed: {
            sentence: function () {
                return this.$store.state.detail.sentence;
            },
            result: function () {
                return this.$store.state.detail.result;
            },
        },
        mounted: function () {
            if (!this.result) { this.fetchSentenceDetail(); }
        }
    }
</script>

<style scoped>
    .repeatBackground {
        background-image: url("../assets/im-not-impressed-repeat.jpg");
        width: 100%;
        background-repeat: repeat-x;
        height: 365px;
        position: relative;
    }

    .repeatBackground > img {
        position: relative;
        left: -55pt;
    }

    .repeatBackground > div {
        position: absolute;
        top: 15pt;
        margin-left: 5%;
        margin-right: 5%;
    }

    .repeatBackground > div > h1 {
        text-align: justify-all;
        font-family: 'Indie Flower', cursive;
        padding: 20pt;
        max-width: 75%;
        line-height: 0.95;
        font-weight: normal;
        color: #1d5863;
        background-color: #FFFFFF88;
        box-shadow: 1pt 1pt 3pt #0a0a0a66;
        border-radius: 8pt;
    }


</style>