events	= require 'events'
child	= require 'child_process'
_s		= require 'underscore.string'
_		= require 'underscore'

EventEmitter = events.EventEmitter

class module.exports extends EventEmitter
	constructor: (target, options={}) ->
		@options = _.defaults count: 10, options
		@num = 0
		@spawn = child.spawn 'ping', [target, "-c #{@options.count}"]
		@spawn.stdout.on 'data', (data) =>
			@data data
	data: (str) ->
		lines = _s.lines str
		clean = _s.clean str
		if lines.length > 1
			for line in lines
				@data line
		else
			regex = /^(\d+) bytes from (.*?): icmp_[rs]eq=(\d+) ttl=(\d+) time=([\d\.]+) ms$/
			match = clean.match regex
			if not match
				regex = /^(\d+) packets transmitted, (\d+) received, (\d+)% packet loss, time (\d+)ms$/
				match = clean.match regex
				if match
					@emit 'exit',
						sent: +match[1]
						recieved: +match[2]
						loss: +match[3]
						time: +match[4]
			else
				@emit 'data',
					no: ++@num
					bytes: +match[1]
					time: +match[4]
					ttl: +match[3]