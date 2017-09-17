dogecoin={}

local rpcport, rpcaddress="44555","127.0.0.1"

if minetest.setting_get("doge.rpcaddress") then
  rpcaddress=minetest.setting_get("doge.rpcaddress")
end 

if minetest.setting_get("doge.rpcport") then
 rpcport=minetest.setting_get("doge.rpcport")
end 

dogecoin.url='http://'..
  minetest.setting_get("doge.rpcuser")..
  ':'..minetest.setting_get("doge.rpcpassword")..
  '@'..rpcaddress..
  ':'..rpcport

local send=function(from, to, amount, reason)
  local proxy=rpc.proxy(dogecoin.url)
  proxy.sendmany(from, {[to]=amount, }, 1, reason)
end

dogecoin.transfer=function(from, to, amount, reason)
  local proxy=rpc.proxy(dogecoin.url, function(res)
    send(from, res, amount, reason)
    end)
  proxy.getnewaddress(to)
end
