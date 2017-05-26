var path = require("path");

var ExtractTextPlugin = require("extract-text-webpack-plugin"),
    webpack = require("webpack");

var config = module.exports = {
  // our app's entry points - for this example we'll use a single each for
  // css and js
  entry: [
   "./web/static/css/app.css",
   "./web/static/js/app.js"
  ],

  // where webpack should output our files
  output: {
    path: "./priv/static",
    filename: "js/app.js"
  },

  resolve: {
    modules: [ "node_modules", __dirname + "/web/static/js" ]
  },

  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: "babel-loader"
      },
      {
        test: /\.(scss|css)$/,
        loader: ExtractTextPlugin.extract({
          fallback: "style-loader",
          use: "css-loader!sass-loader"
        })
      },
      {
        test: /\.(png|jpg|gif?)(\?[a-z0-9]+)?$/,
        exclude: /node_modules/,
        loader: 'url-loader!file-loader'
      },
      {
        test: /\.(woff|woff2)(\?v=\d+\.\d+\.\d+)?$/,
        loader: 'url-loader?limit=10000&mimetype=application/font-woff'
      },
      {
        test: /\.ttf(\?v=\d+\.\d+\.\d+)?$/,
        loader: 'url-loader?limit=10000&mimetype=application/octet-stream'
      },
      {
        test: /\.eot(\?v=\d+\.\d+\.\d+)?$/,
        loader: 'file-loader'
      },
      {
        test: /\.svg(\?v=\d+\.\d+\.\d+)?$/,
        loader: 'url-loader?limit=10000&mimetype=image/svg+xml'
      }
    ]
  },

  // what plugins we'll be using - in this case, just our ExtractTextPlugin.
  // we'll also tell the plugin where the final CSS file should be generated
  // (relative to config.output.path)
  plugins: [
    new ExtractTextPlugin("css/app.css")
  ]
};

// if running webpack in production mode, minify files with uglifyjs
if (process.env.NODE_ENV === "production") {
  config.plugins.push(
    new webpack.optimize.DedupePlugin(),
    new webpack.optimize.UglifyJsPlugin({ minimize: true })
  );
}
