module.exports = {
    outputDir: 'html/dist',
    devServer: {
        host: 'www.grumpyipsum.com',
        disableHostCheck: true,
        proxy: {
            '/rest/': {
                target: 'http://www.grumpyipsum.com'
            },
        },
        overlay: {
            warnings: true,
            errors: true
        }
    }

};