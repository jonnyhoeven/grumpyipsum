<template>
    <div class="app">
        <div class="nav">
            <router-link to="/">Home</router-link>
            <router-link to="/contribute">Contribute</router-link>
            <router-link to="/about">About</router-link>
            <router-link v-if="loginResult" to="/admin" class="floatright">Admin</router-link>
            <router-link v-if="!loginResult" to="/login" class="floatright">Login</router-link>
            <router-link v-if="loginResult" to="/logout" class="floatright">Logout</router-link>
        </div>

        <router-view/>

        <div class="clearFloat"></div>

        <div class="footer" style="text-align:right;">
            <router-link to="/about">Jonny van der Hoeven</router-link>
            <span>-</span>
            <router-link to="/">Grumpy Ipsum</router-link>
            <span>&copy; {{ currentYear }}</span>
        </div>
    </div>
</template>

<script>
    export default {
        name: "App",
        data: function () {
            return {releaseYear: 2019}
        },
        computed: {
            currentYear: function () {
                let currentYear = new Date().getFullYear();
                if (currentYear < this.releaseYear) {
                    return this.releaseYear;
                } else {
                    return currentYear;
                }
            },
            loginResult: function() {
                return this.$store.state.login.result;
            }
        }
    }
</script>


<style>
    * {
        box-sizing: border-box;
    }

    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
    }

    body {
        color: #3a5468;
        margin: 0;
        background: #f9f9f9 repeating-linear-gradient(
                to right,
                #f6bb4e,
                #f6bb4e 10pt,
                #ffd180 10pt,
                #ffd180 20pt
        );
    }


    body, textarea, input, select, button {
        color: #344f63;
        font-family: 'Source Sans Pro', sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
    }

    textarea, input, select {
        padding-left: 3pt;
    }

    textarea {
        padding-top: 2pt;
    }


    div:empty:before {
        content: '\a0';
    }

    div:empty:before .clearFloat .clearFloatRight {
        content: '';
    }


    h1, h2, h3, p, blockquote {
        margin-top: 0;
        margin-left: 10pt;
        margin-right: 10pt
    }

    blockquote {
        border-left: 1pt solid #ccc;
    }


    .noHeaderContainer {
        width: 100%;
        border-top: 3pt solid #3298a7;
    }

    .hand {
        cursor: pointer;
    }

    .app {
        /* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#ffffff+0,e5e5e5+100&0.8+0,0.8+27,0.5+100 */
        background: -moz-linear-gradient(-45deg, rgba(255, 255, 255, 0.8) 0%, rgba(248, 248, 248, 0.8) 27%, rgba(229, 229, 229, 0.5) 100%); /* FF3.6-15 */
        background: -webkit-linear-gradient(-45deg, rgba(255, 255, 255, 0.8) 0%, rgba(248, 248, 248, 0.8) 27%, rgba(229, 229, 229, 0.5) 100%); /* Chrome10-25,Safari5.1-6 */
        background: linear-gradient(135deg, rgba(255, 255, 255, 0.8) 0%, rgba(248, 248, 248, 0.8) 27%, rgba(229, 229, 229, 0.5) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ccffffff', endColorstr='#80e5e5e5', GradientType=1); /* IE6-9 fallback on horizontal gradient */
        text-align: justify;
        min-height: 100%;
    }

    .nav {
        width: 100%;
        padding: 10pt;
        /* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#ffffff+0,e5e5e5+100&0.8+0,0.8+27,0.5+100 */
        background: -moz-linear-gradient(left, rgba(255, 255, 255, 0.8) 0%, rgba(248, 248, 248, 0.8) 27%, rgba(229, 229, 229, 0.5) 100%); /* FF3.6-15 */
        background: -webkit-linear-gradient(left, rgba(255, 255, 255, 0.8) 0%, rgba(248, 248, 248, 0.8) 27%, rgba(229, 229, 229, 0.5) 100%); /* Chrome10-25,Safari5.1-6 */
        background: linear-gradient(to right, rgba(255, 255, 255, 0.8) 0%, rgba(248, 248, 248, 0.8) 27%, rgba(229, 229, 229, 0.5) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ccffffff', endColorstr='#80e5e5e5', GradientType=1); /* IE6-9 */
    }


    .nav > a {
        padding: 10pt;
        font-weight: bold;
        color: #3a5468;
        text-decoration: none;
    }

    .nav > a.router-link-exact-active {
        color: #3a5468;
    }

    .nav > a.router-link-exact-active:hover {
        color: #3a5468;
    }

    .footer {
        #position: fixed;
        bottom: 0;
        right: 0;
        padding: 4pt;
        font-size: 6pt;
    }

    .footer > a {
        text-decoration: none;
        text-shadow: 0 0 6pt rgba(45, 45, 45, 0.4);
        color: #000000;
    }

    .footer > a:hover {
        text-shadow: 0 0 2pt rgba(168, 168, 168, 0.4);
    }


    .footer > span {
        text-shadow: 0 0 2pt rgba(45, 45, 45, 0.4);
        margin-left: 3pt;
        margin-right: 3pt;
        color: #000000;
    }

    .formContainer input, select, textarea, button {
        margin-top: 2pt;
        margin-bottom: 7pt;
        border: 1pt solid #ccc;
        border-radius: 3pt;
    }

    .formContainer input, select, button {
        height: 20pt;
    }

    .labelContainer div {
        text-align: right;
        height: 20pt;
        margin-top: 4pt;
        margin-right: 3pt;
    }

    .clearFloat {
        clear: both;
    }

    .floatLeft {
        float: left;
    }

    .floatRight {
        float: right;
    }

    .well {
        background-color: rgba(255, 255, 255, 0.8);
        box-shadow: 1pt 1pt 3pt #0a0a0a66;
        border-radius: 8pt;
        padding: 15pt;
    }

    .fade-enter-active, .fade-leave-active {
        transition: opacity 3s;
    }

    .w12 {
        width: 100%;
    }

    .w9 {
        width: 91.66%
    }

    .w10 {
        width: 83.33%;
    }

    .w9 {
        width: 75%;
    }

    .w8 {
        width: 66.66%
    }

    .w7 {
        width: 58.33%;
    }

    .w6 {
        width: 50%;
    }

    .w5 {
        width: 41.66%;
    }

    .w4 {
        width: 33.33%;
    }

    .w3 {
        width: 25%;
    }

    .w2 {
        width: 16.66%;
    }

    .w1 {
        width: 8.33%;
    }

    .w-5 {
        width: 4.16%;
    }

    .w-25 {
        width: 2.08%;
    }


</style>
