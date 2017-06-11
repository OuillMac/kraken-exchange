// Generated by CoffeeScript 2.0.0-beta2
(function() {
  var KrakenResponse;

  KrakenResponse = class KrakenResponse {
    constructor(response) {
      var result;
      result = JSON.parse(response);
      if (result.error.length) {
        throw new Error(result.error[0]);
      }
      this.result = result.result;
    }

    float() {
      var key, ref, val;
      ref = this.result;
      for (key in ref) {
        val = ref[key];
        this.result[key] = parseFloat(val);
      }
      return this;
    }

    currency() {
      var key, obj, ref, val;
      obj = {};
      ref = this.result;
      for (key in ref) {
        val = ref[key];
        key = key.replace(/^[XZ]([A-Z]{3})$/, '$1');
        obj[key] = val;
      }
      this.result = obj;
      return this;
    }

    pair() {
      var key, obj, ref, val;
      obj = {};
      ref = this.result;
      for (key in ref) {
        val = ref[key];
        key = key.replace(/^[XZ]([A-Z]{3})/, '$1');
        key = key.replace(/[XZ]([A-Z]{3})$/, '$1');
        obj[key] = val;
      }
      this.result = obj;
      return this;
    }

  };

  module.exports = KrakenResponse;

}).call(this);
