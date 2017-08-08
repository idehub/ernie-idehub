# Description:
#   Get the average symbol price from Bitfinex
#
# Configuration:
#   None
#
# Commands:
#   hubot <currency> - returns average price for symbol t<currency>USD from Bitfinex
#
# Author:
#   Nikolai

module.exports = (robot) ->
  robot.respond /crypto(?:\s)?(.*)?/i, (msg) ->
    currency = res.match[1].toUpperCase();
    msg
      .http("https://api.bitfinex.com/v2/calc/trade/avg?symbol=t#{currency}USD&amount=1")
      .post() (err, res, body) ->
        msg.send "Current average for tBTCUSD: #{JSON.parse(body)[0]}"