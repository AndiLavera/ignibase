const webpack = require('webpack');
const merge = require('webpack-merge');
const common = require('./common.js');

module.exports = merge(common, {
  mode: 'development',
  devtool: 'inline-source-map',
  watchOptions: {
    poll: true,
    ignored: /node_modules/
  }
});
