var Extractor, config, ecb, fcb, fs, queryOutput, scb, testSql;

Extractor = require("../index.js");

fs = require("fs-extra");

config = fs.readJsonSync("./testconfig/config.json");

testSql = fs.readFileSync("./testqueries/new_scraped_data_count.sql").toString();

queryOutput = new Extractor(config);

console.log(testSql);

scb = function(data) {
  console.log("success!");
  return fs.writeJsonSync("./testoutput/new_scraped_data.json", data);
};

ecb = function(e) {
  console.log("error!");
  return console.log(e);
};

fcb = function() {
  return console.log("FINALLY...");
};

queryOutput.execute({
  sql: testSql
}, scb, ecb, fcb);
