Ping = require './ping'

ping = new Ping 'google.com'

ping.on 'data', (data) ->
	console.log data

ping.on 'exit', (data) ->
	console.log data