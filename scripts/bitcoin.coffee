# Description:
#   Get cryptocurrency prices from Bitfinex
#
# Configuration:
#   None
#
# Commands:
#   hubot crypto symbols - returns a list of available symbols
#   hubot crypto price <symbol> - returns the last price, max and min for the given symbol (ex: btcusd)
#
# Author:
#   nikolaia

module.exports = (robot) ->
  robot.respond /crypto price(.*)?/i, (msg) ->
    symbol = if (msg.match[1]) then msg.match[1].trim().toUpperCase() else 'BTCUSD'
    msg
      .http("https://api.bitfinex.com/v1/pubticker/#{symbol}")
      .get() (err, res, body) ->
        data = JSON.parse(body);
        msg.send "#{symbol}: #{data.last_price} (High: #{data.high} | Low: #{data.high})"

  robot.respond /crypto symbols/i, (msg) ->
    msg
      .http("https://api.bitfinex.com/v1/symbols")
      .get() (err, res, body) ->
        msg.send "Available symbols: #{body}"

  robot.respond /crypto (\d+) (\S+) in (\S+)/i, (msg) ->
    amount = msg.match[1].trim()
    fromC = msg.match[2].trim().toUpperCase()
    toC = msg.match[3].trim().toUpperCase()
    msg
      .http("https://api.bitfinex.com/v2/calc/trade/avg?symbol=t#{fromC}#{toC}&amount=#{amount}")
      .post() (err, res, body) ->
        msg.send "Current average for tBTCUSD: #{JSON.parse(body)[0]}"