<template>
    <div>
        <div class="floatLeft w3"></div>
        <transition name="fade">
            <div class="floatLeft w6 well inputContainer" v-if="detailSentence">
                <div class="labelContainer floatLeft w4">
                    <div><label for="sentences">You'll get:</label></div>
                </div>
                <div class="formContainer floatLeft w8">
                    <select class="w12" id="sentences" v-model="sentenceCount" v-on:change="fetchSentences">
                        <option v-for="option in sentenceOptions" :value="option.value" :key="option.value">
                            {{ option.name }}
                        </option>
                    </select>
                </div>

                <div class="labelContainer floatLeft w4">
                    <div><label for="paragraphs">stuffed into:</label></div>
                </div>
                <div class="formContainer floatLeft w8">
                    <select class="w12" id="paragraphs" v-model="paragraphCount">
                        <option v-for="option in paragraphOptions" :value="option.value" :key="option.value">
                            {{ option.name }}
                        </option>
                    </select>
                </div>
            </div>
        </transition>
        <div class="clearFloat"></div>

        <div class="floatLeft w1"></div>

        <Paragraphs v-bind:paragraphs="paragraphs"/>

        <div class="clearFloat"></div>
    </div>


</template>


<script>
    import Paragraphs from './Paragraphs.vue'

    export default {
        name: "LorumIpsum",
        components: {
            Paragraphs
        },
        data: function () {
            return {
                sentenceOptions: [
                    {value: 1, name: 'The worst sentence'},
                    {value: 3, name: 'Three blunt sentences'},
                    {value: 5, name: 'Five profound sentences'},
                    {value: 10, name: 'Ten sentences'},
                    {value: 20, name: 'Twenty sentences'},
                    {value: 50, name: 'Fifty sentences'}
                ],
                paragraphOptions: [
                    {value: 1, name: 'One paragraph'},
                    {value: 3, name: 'Three paragraphs'},
                    {value: 5, name: 'Five paragraphs'},
                    {value: 10, name: 'Ten paragraphs'},
                    {value: 20, name: 'Twenty paragraphs'},
                    {value: 50, name: 'Fifty paragraphs'}
                ]
            };
        },
        methods: {
            fetchSentences() {
                this.$store.dispatch('fetchSentences').then(() => {
                    //console.log('RETrefreshSentences');
                });
            },
            shuffle: function (inAr) {
                for (let i = inAr.length - 1; i > 0; i--) {
                    const j = Math.floor(Math.random() * (i + 1));
                    [inAr[i], inAr[j]] = [inAr[j], inAr[i]];
                }
                return inAr;
            },
            sentencesShuffleMap: function () {
                return  this.shuffle(Object.keys(this.sentenceCollection));
            },
        },
        computed: {
            sentenceCount: {
                //getter
                get: function () {
                    return this.$store.state.settings.sentences;
                },
                //setter
                set: function (newValue) {
                    return this.$store.state.settings.sentences = newValue;
                }
            },
            paragraphCount: {
                //getter
                get: function () {
                    return this.$store.state.settings.paragraphs;
                },
                //setter
                set: function (newValue) {
                    return this.$store.state.settings.paragraphs = newValue;
                }
            },
            sentenceCollection: function () {
                return this.$store.state.sentences.collection;
            },
            sentencesResult: function () {
                return this.$store.state.sentences.result;
            },
            paragraphs: function () {
                let retAr = [];
                for (let i = 1; i <= this.paragraphCount; i++) {
                    retAr.push(this.sentencesShuffleMap());
                }
                return retAr;
            },
            detailSentence: function () {
                return this.$store.state.detail.sentence;
            },
        },
        mounted: function() {
            if (!this.sentencesResult) {
                this.fetchSentences();
            }
        }
    }
</script>

<style scoped>


    .inputContainer {
        margin: 10pt;
        padding: 10pt;
        max-width: 600pt;
        height: 75pt;
    }


</style>