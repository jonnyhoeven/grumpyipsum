<template>
    <div>
        <div class="floatLeft labelContainer w4">
            <div>
                <label for="name">By:</label>
            </div>
        </div>
        <div class="floatLeft formContainer w8">
            <input v-model="submission.name" class="w12" type="text" id="name"
                   placeholder="Name..."/>
        </div>

        <div class="floatLeft labelContainer w4">
            <div>
                <label for="ip">IP:</label>
            </div>
        </div>
        <div class="floatLeft formContainer w8">
            <input v-model="submission.ip" class="w12" type="text" id="ip"
                   placeholder="IP..."/>
        </div>

        <div class="floatLeft labelContainer w4">
            <div>
                <label for="datetime">Submitted:</label>
            </div>
        </div>
        <div class="floatLeft formContainer w8">
            <input v-model="submission.created_at" class="w12" type="text" id="datetime"
                   placeholder="Submitted..."/>
        </div>

        <div class="floatLeft labelContainer w4">
            <div>
                <label for="text">Sentence:</label>
            </div>
        </div>
        <div class="floatLeft formContainer w8">
            <input v-model="submission.text" class="w12" type="text" id="text"
                   placeholder="Sentence..."/>
        </div>

        <div class="floatLeft w4"></div>
        <div class="floatLeft formContainer w4">
            <button v-on:click="deleteSubmission" class="delete w9">
                Delete
            </button>
        </div>
        <div class="floatLeft formContainer w4">
            <button v-on:click="acceptSubmission" class="accept floatRight w9">
                Accept
            </button>
        </div>
        <div class="clearFloat"></div>
    </div>
</template>

<script>
    export default {
        name: "Submission",
        props: {
            submission: Object,
        },
        methods: {
            acceptSubmission: function () {
                this.$store.dispatch('acceptSubmission', this.submission.id).then(() => {
                    //console.log('RETacceptSubmission');
                });
            },
            deleteSubmission: function () {
                this.$store.dispatch('deleteSubmission', this.submission.id).then(() => {
                    //console.log('RETdeleteSubmission');
                });
            },
        }
    }
</script>

<style scoped>
    .accept {
        background-color: #c9f9b8;
        border:1px solid #a8d898;
    }
    .delete {
        background-color: #f9bba5;
        border:1px solid #e5a791;
    }

</style>
