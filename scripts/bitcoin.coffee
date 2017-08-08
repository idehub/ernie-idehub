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
    currency = if (msg.match[1]) then msg.match[1].trim().toUpperCase() else 'BTC'
    msg
      .http("https://api.bitfinex.com/v2/calc/trade/avg?symbol=t#{currency}USD&amount=1")
      .post() (err, res, body) ->
        msg.send "Current average for tBTCUSD: #{JSON.parse(body)[0]}"