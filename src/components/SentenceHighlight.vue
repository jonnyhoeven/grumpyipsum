<template>
    <transition name="fade">
        <div v-if="highlightedSentence">

            <div class="wellHighlight floatLeft w4">
                <div class="floatLeft w12">
                    <div class="floatLeft">
                        <b>{{ highlightedSentence.name }}</b>
                    </div>


                    <div class="floatRight w3" style="min-width:80px;">
                        <div v-on:click="fetchVoteSentence(1, highlightedSentence.id)"
                             v-bind:class="pawClassRated(1)"
                             class="floatLeft hand"></div>
                        <div v-on:click="fetchVoteSentence(2, highlightedSentence.id)"
                             v-bind:class="pawClassRated(2)"
                             class="floatLeft hand"></div>
                        <div v-on:click="fetchVoteSentence(3, highlightedSentence.id)"
                             v-bind:class="pawClassRated(3)"
                             class="floatLeft hand"></div>
                        <div v-on:click="fetchVoteSentence(4, highlightedSentence.id)"
                             v-bind:class="pawClassRated(4)"
                             class="floatLeft hand"></div>
                        <div v-on:click="fetchVoteSentence(5, highlightedSentence.id)"
                             v-bind:class="pawClassRated(5)"
                             class="floatLeft hand"></div>
                    </div>
                </div>

                <div class="floatLeft w12">

                    <div class="floatLeft w8">
                        <small>&lt;{{highlightedSentence.email}}&gt;</small>
                    </div>

                    <div class="floatRight">
                        <small>Votes: {{ highlightedRatingCount }}</small>
                    </div>


                    <div class="floatLeft highlightedDateFooter w12" style="text-align:center;margin-bottom:-8pt">
                        <small>
                            Added:
                            <span style="color: #ff667c;">
                                {{ this.$moment(highlightedSentence.updated_at).format("MMMM Do YYYY") }}
                            </span>
                        </small>
                    </div>

                </div>
            </div>

            <div class="floatLeft w1"></div>

            <div class="wellHighlight floatLeft w7">
                <div class="floatLeft w12 highlightedSentence">
                    <span>{{ highlightedSentence.text }}</span>
                </div>
            </div>

            <div class="clearFloat"></div>
        </div>
    </transition>
</template>

<script>
    export default {
        name: "SentenceHighlight",
        methods: {
            fetchVoteSentence: function ( rating,sentenceID) {
                let payload = {sentenceID: sentenceID, rating: rating};
                this.$store.dispatch('fetchVoteSentence', payload).then(() => {
                    //console.log('RetVote');
                });
            },
            pawClassRated: function (pawValue) {
                if (this.highlightedSentence.rating) {
                    return [
                        {pawActive: this.highlightedSentence.rating.avg >= pawValue},
                        {paw: this.highlightedSentence.rating.avg < pawValue},
                    ];
                } else {
                    return {paw: true};
                }
            }
        },
        computed: {
            highlightedSentence: function () {
                return this.$store.state.detail.sentence
            },
            highlightedRatingCount: function () {
                if (this.highlightedSentence.rating) {
                    return this.highlightedSentence.rating.count;
                }
                return 0;
            },
            sentences: function () {
                return this.$store.state.sentences;
            },
        }
    }
</script>

<style scoped>
    .wellHighlight {
        background-color: #ffeb8a;
        box-shadow: 1px 1px 3px #0a0a0a88;
        border-radius: 8px;
        padding: 10pt;
    }

    .highlightedSentence {
        font-family: 'Indie Flower', cursive;
        font-size: 16pt;
        text-align: center;
    }

    .pawActive {
        width: 16px;
        height: 19px;
        vertical-align: bottom;
        background: url("../assets/paw.png") no-repeat right bottom;
    }

    .pawActive:hover {
        width: 16px;
        height: 19px;
        vertical-align: bottom;
        background: url("../assets/paw-dark.png") no-repeat right bottom;
    }

    .paw {
        width: 16px;
        height: 19px;
        vertical-align: bottom;
        background: url("../assets/paw-dark.png") no-repeat right bottom;
    }

    .paw:hover {
        width: 16px;
        height: 19px;
        vertical-align: bottom;
        background: url("../assets/paw.png") no-repeat right bottom;
    }

    .labelContainer > span {
        margin-right: 5pt;
        padding: 3pt;
    }

    .valueContainer > span {
        margin-right: 5pt;
        padding: 3pt;
    }

</style>