const { environment } = require('@rails/webpacker')

module.exports = environment
const webpacker = require('webpack')
environment.plugins.append('Provide', new webpacker.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery'
}))
