var webpack           = require('webpack');
var path              = require('path');

var APP_DIR = path.resolve(__dirname, 'app', 'assets', 'javascripts');
var config = {
  entry: {
    javascript: APP_DIR + '/items_form.tsx'
  },
  output: {
    path: path.resolve(__dirname, 'app', 'assets', 'javascripts', 'bundles'),
    filename: 'items_form.js'
  },
  module: {
    loaders : [
      {
        test: /\.tsx?$/,
        include: path.resolve(__dirname, 'app', 'assets', 'javascripts'),
        use: [ { loader : 'babel-loader' }, { loader: 'ts-loader'}]
      }
    ]
  }
};

module.exports = config;
