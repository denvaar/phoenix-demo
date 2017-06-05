var path = require("path");

var ExtractTextPlugin = require("extract-text-webpack-plugin"),
    webpack = require("webpack");

var config = {
  entry: {
    app: [
      "js/app.js",
      "css/app.css" /* putting this here to enable atuo-reload for css because they are not required in js files */
    ],
    show: "js/show.js",
    mdEditor: "js/mdEditor.js"
  },
  output: {
    path: "./priv/static",
    filename: "js/[name].js"
  },
  resolve: {
    modules: [ "node_modules", __dirname + "/web/static" ],
    extensions: ['.js', '.jsx', '.map']
  },
  module: {
    loaders: [
      {
        test: /\.js?|\.jsx$/,
        exclude: /node_modules/,
        loaders: ['babel-loader']
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
  plugins: [
    new ExtractTextPlugin("css/[name].css")
  ]
};

if (process.env.NODE_ENV === "production") {
  config.plugins.push(
    new webpack.optimize.DedupePlugin(),
    new webpack.optimize.UglifyJsPlugin({ minimize: true })
  );
}

module.exports = config;
