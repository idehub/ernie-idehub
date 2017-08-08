# Description:
#   Get the average symbol price from Bitfinex
#
# Configuration:
#   None
#
# Commands:
#   hubot crypto <cryptocurrency> - returns average USD price for symbol t<cryptocurrency>USD from Bitfinex
#
# Author:
#   Nikolai

module.exports = (robot) ->
  robot.respond /crypto(?:\s)?(.*)?/i, (msg) ->
    symbol = if (msg.match[1]) then msg.match[1].trim().toUpperCase() else 'btcusd'
    msg
      .http("https://api.bitfinex.com/v1/pubticker/#{symbol}")
      .get() (err, res, body) ->
        data = JSON.parse(body);
        msg.send "#{symbol}: #{data.last_price} (High: #{data.high} | Low: #{data.high})"