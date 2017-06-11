KrakenPublic = require './local/KrakenPublic'
KrakenPrivate = require './local/KrakenPrivate'

class Kraken

  constructor: (@api_key, @private_key) ->

  time: ->
    krak = new KrakenPublic 'Time'
    krak.api()
    .then (response) ->
      response.result

  assets: (assets...) ->
    assets = assets[0] if Array.isArray assets[0]
    assets = assets.join ','
    krak = new KrakenPublic 'Assets' , asset: assets
    krak.api()
    .then (response) ->
      response.result

  assetPairs: (pairs...) ->
    pairs = pairs[0] if Array.isArray pairs[0]
    pairs = pairs.join ','
    krak = new KrakenPublic 'AssetPairs' , pair: pairs
    krak.api()
    .then (response) ->
      response.pair().result

  ticker: (pairs...) ->
    pairs = pairs[0] if Array.isArray pairs[0]
    pairs = pairs.join ','
    krak = new KrakenPublic 'Ticker' , pair: pairs
    krak.api()
    .then (response) ->
      response.pair().result

  ohlc: (pair, interval, last) ->
    options = pair: pair
    options.interval = interval if interval
    options.last = last if last
    krak = new KrakenPublic 'OHLC', options
    krak.api()
    .then (response) ->
      response.pair().result

  depth: (pair, count) ->
    options = pair: pair
    options.count = count if count
    krak = new KrakenPublic 'Depth', options
    krak.api()
    .then (response) ->
      response.pair().result

  trades: (pair, since) ->
    options = pair: pair
    options.since = since if since
    krak = new KrakenPublic 'Trades', options
    krak.api()
    .then (response) ->
      response.pair().result

  spread: (pair, since) ->
    options = pair: pair
    options.since = since if since
    krak = new KrakenPublic 'Spread', options
    krak.api()
    .then (response) ->
      response.pair().result

  balance: ->
    krak = new KrakenPrivate 'Balance', @api_key, @private_key
    krak.api()
    .then (response) ->
      response.float().currency().result

  tradeBalance: (currency, aclass) ->
    params = {}
    params.aclass = aclass if aclass
    params.asset = currency if currency
    krak = new KrakenPrivate 'TradeBalance', @api_key, @private_key, params
    krak.api()
    .then (response) =>
      response.float().result

  openOrders: (trades, userref) ->
    params = {}
    params.trades = trades if trades?
    params.userref = userref if userref
    krak = new KrakenPrivate 'OpenOrders', @api_key, @private_key, params
    krak.api()
    .then (response) =>
      response.result

  closedOrders: (trades, userref, start, end, ofs, closetime) ->
    params = {}
    params.trades = trades if trades?
    params.userref = userref if userref
    params.start = start if start
    params.end = end if end
    params.ofs = ofs if ofs
    params.closetime = closetime if closetime
    krak = new KrakenPrivate 'ClosedOrders', @api_key, @private_key, params
    krak.api()
    .then (response) =>
      response.result


module.exports = Kraken
