module.exports = {
  presets: [
    [
      require.resolve('@babel/preset-env'),
      {
        targets: {
          node: 'current',
        },
        useBuiltIns: false,
      },

    ],
  ],
};
