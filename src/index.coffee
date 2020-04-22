Sugar = require('sugar-and-spice')
Sugar.extend()



class ExtractorPgQuery
  constructor: (config)->
    pg = require('pg')
    @client = pg.Client

    parseDate = (date)->
      return Date.create(date)
      
    [1082,1083,1114,1184].forEach (type)->
      pg.types.setTypeParser(type, parseDate)

    @config = config


  execute: (options, successCallback, errorCallback, finallyCallback)->

    that = @
    client = new @client(@config)
    client.connect()
    unless options.sql?
      if errorCallback?
        errorCallback "Options is missing sql attribute"
    client.query options.sql

    .then (result) ->
      if result?
        if successCallback?
          successCallback result.rows
      else
        if successCallback?
          successCallback []
    .catch (err)->
      if err?
        if errorCallback?
          errorCallback err
    .finally ()->
      client.end()
      if finallyCallback?
        finallyCallback()


module.exports = ExtractorPgQuery
