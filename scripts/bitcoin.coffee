# Description:
#   Get the average BTC price from Bitfinex
#
# Configuration:
#   None
#
# Commands:
#   hubot btc - returns average price for symbol tBTCUSD (1 BTC in USD)
#
# Author:
#   Nikolai

module.exports = (robot) ->
  robot.respond /btc/i, (msg) ->
    msg
      .http("https://api.bitfinex.com/v2/calc/trade/avg?symbol=tBTCUSD&amount=1")
      .post() (err, res, body) ->
        msg.send "Current average for tBTCUSD: #{JSON.parse(body)[0]}"