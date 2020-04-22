Extractor = require "../index.js"
fs = require("fs-extra")

config = fs.readJsonSync "./testconfig/config.json"


testSql = fs.readFileSync("./testqueries/new_scraped_data_count.sql").toString()

queryOutput = new Extractor(config)

console.log testSql

scb = (data)->
  console.log "success!"
  fs.writeJsonSync "./testoutput/new_scraped_data.json", data

ecb = (e)->
  console.log "error!"
  console.log e
fcb = ()->
  console.log "FINALLY..."

queryOutput.execute { sql: testSql }, scb, ecb, fcb
