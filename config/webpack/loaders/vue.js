module.exports = {
  module: {
    rules: [
      {
        test: /\.vue(\.erb)?$/,
        use: [{
          loader: 'vue-loader'
        }],
      },
      {
        test: /\.vue$/, 
        use: ["vue-loader"],
      },
      {
      test: /\.vue$/,
      loader: 'vue-loader',
        options: {
          loaders: {
            scss: 'vue-style-loader!css-loader!sass-loader', // <style lang="scss">
            sass: 'vue-style-loader!css-loader!sass-loader?indentedSyntax' // <style lang="sass">
          }
        }
      }
    ]
  },
}


