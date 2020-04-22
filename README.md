# Extractor PGQuery

This is a simple wrapper that returns a json object resulting from a select query issued to a Postgresql server.

This npm was created for a very specific use case and may not have any value for general use at this time.


## Install

`npm install extractor-pgquery`


## Usage

Sample code in coffeescript:

```
Extractor = require "extractor-pgquery"

config = {
  "host": "192.168.1.10",
  "database": "test_db",
  "user": "pguser",
  "password": "password",
  "port": 5432
}

testSql = "select * from sometable"

queryOutput = new Extractor(config)


successCallback = (data)->
  console.log "success!"
  console.log data

errorCallback = (e)->
  console.log "error!"
  console.log e
finallyCallback = ()->
  console.log "FINALLY..."

queryOutput.execute { sql: testSql }, successCallback, errorCallback, finallyCallback

```
