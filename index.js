var ExtractorPgQuery, Sugar;

Sugar = require('sugar-and-spice');

Sugar.extend();

ExtractorPgQuery = class ExtractorPgQuery {
  constructor(config) {
    var parseDate, pg;
    pg = require('pg');
    this.client = pg.Client;
    parseDate = function(date) {
      return Date.create(date);
    };
    [1082, 1083, 1114, 1184].forEach(function(type) {
      return pg.types.setTypeParser(type, parseDate);
    });
    this.config = config;
  }

  execute(options, successCallback, errorCallback, finallyCallback) {
    var client, that;
    that = this;
    client = new this.client(this.config);
    client.connect();
    if (options.sql == null) {
      if (errorCallback != null) {
        errorCallback("Options is missing sql attribute");
      }
    }
    return client.query(options.sql).then(function(result) {
      if (result != null) {
        if (successCallback != null) {
          return successCallback(result.rows);
        }
      } else {
        if (successCallback != null) {
          return successCallback([]);
        }
      }
    }).catch(function(err) {
      if (err != null) {
        if (errorCallback != null) {
          return errorCallback(err);
        }
      }
    }).finally(function() {
      client.end();
      if (finallyCallback != null) {
        return finallyCallback();
      }
    });
  }

};

module.exports = ExtractorPgQuery;
