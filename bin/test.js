// Generated by CoffeeScript 2.0.0-beta2
(function() {
  var API_KEY, Kraken, PRIV_KEY, Util, k;

  Util = require('util');

  Kraken = require('./kraken');

  API_KEY = 'Cv4CTzYOrs92QwThlKzjw8yzEwqY5dTeRojViKkVsGLbnXSpYchB68Ib';

  PRIV_KEY = 'D9y6Azn5M5pCpW5eF0Qj26nhMC4aLRlQooBlKH+iYolWAvC/GusVAHNlqPdRl/Zx7rVVk3+Py5ywkapNJgUxwQ==';

  k = new Kraken(API_KEY, PRIV_KEY);

  Promise.all([k.time(), k.tradeVolume('XBTEUR', 'ETHXBT')]).then((results) => {
    return console.log(Util.inspect(results, {
      depth: null
    }));
  }).catch((err) => {
    return console.log('Error:', err);
  });

}).call(this);
