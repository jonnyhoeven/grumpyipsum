<template>
    <div class="floatLeft well w10">
        <div class="paragraphContainer">
            <dl>
                <dt>
                    <SentenceHighlight/>
                </dt>
                <dd :key="'par' + parIndex" v-for="(paragraph, parIndex) in paragraphs">
                    <span class="hoverHighlight" v-bind:class="{sentenceSelected: isSelected(sentenceID)}"
                          v-bind:key="'sen' + parIndex + '-' + sentenceID"
                          v-for="sentenceID in paragraph"
                          v-on:click="fetchSentenceDetail(sentenceID)">
                          {{ sentenceCollection[sentenceID] }}
                    </span>
                </dd>
            </dl>
        </div>
    </div>
</template>

<script>
    import SentenceHighlight from './SentenceHighlight.vue'

    export default {
        name: "Paragraphs",
        components: {
            SentenceHighlight
        },
        methods: {
            fetchSentenceDetail(sentenceID) {
                this.$store.dispatch('fetchSentenceDetail', sentenceID).then(() => {
                    //console.log('RETrefreshSentenceDetail');
                });
            },
            isSelected: function (sentenceID) {
                return (parseInt(this.selectedID) === parseInt(sentenceID));
            }

        },
        computed: {
            selectedID: function () {
                return this.$store.state.detail.sentence.id;
            },
            sentence: function () {
                return this.$store.state.detail.sentence;
            },
            sentenceCollection: function () {
                return this.$store.state.sentences.collection;
            },
        },
        props: {
            paragraphs: Array,
        }
    }
</script>

<style scoped>
    .paragraphContainer {
        clear: left;
        text-align: justify;
    }

    .hoverHighlight:hover {
        background-color: #f9f5c9;
        cursor: pointer;
        border-radius: 4px;
    }

    .sentenceSelected {
        background-color: #f9f3aa;
        cursor: pointer;
        border-radius: 4px;
    }

    .sentenceSelected:hover {
        background-color: #f9ebbb;
        cursor: pointer;
        border-radius: 4px;
    }


    dl {
        margin-left: 0;
        margin-top: 0;
    }

    dt {
        position: -webkit-sticky;
        position: sticky;
        top: 15pt;
        margin-bottom: 0;
    }

    dd {
        margin-left: 0;
        margin-bottom: 15pt;
    }


</style>