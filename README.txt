The code was taken from JSONRPC4Lua and modified to work without
luasockets. Now it uses HTTPApiTable which works 
through callbacks.
To run this mod you need to add secure.http_mods = rpc to minetest.conf.

Usage is like JSONRPC4Lua, but with callbacks:

  local client=rpc.proxy(
    "http://127.0.0.1:4444",
    function(res)
      minetest.debug(res)
      end,)
  client.echo("Pong!")
  minetest.debug("Once upon a time...")
 
Prints:
  
  Once upon a time...
  Pong!
