# ping-wrapper #

Native wrapper for ping.

## Install ##

    npm install ping-wrapper2

## Example  ##

```coffeescript
Ping = require 'ping-wrapper2'

ping = new Ping 'google.com'

ping.on 'data', (data) ->
	console.log data

ping.on 'exit', (data) ->
	console.log data
```

## License ##

               DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
                       Version 2, December 2004 

    Copyright (C) 2012 Sebastian McKenzie <sebmck@gmail.com> 

    Everyone is permitted to copy and distribute verbatim or modified 
    copies of this license document, and changing it is allowed as long 
    as the name is changed. 

               DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
      TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION 

     0. You just DO WHAT THE FUCK YOU WANT TO. 