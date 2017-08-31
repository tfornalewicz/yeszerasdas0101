local posdotp = {x= 7517, y=1408, z=9} -- {x = 7517, y = 1408, z = 9}
local salaDeathstrike = {x=7514, y=1456, z=9} -- {x = 7514, y = 1456, z = 9}
local posDeathstrike = {x=7521, y=1467, z=9} -- {x = 7521, y = 1467, z = 9}

function removerTp(tp)
    local t = getTileItemById(posdotp, 1387) -- bierze id i koordy tpka
    if t then -- jak tam jest
        doRemoveItem(t.uid, 1) -- to go usuwa
        doSendMagicEffect(posdotp, CONST_ME_POFF)
    end
end

function TirarCristal()
    local cristal = getTileItemById(posdotp, 17999) -- krystal na koordach
    if cristal then --jak jest
        doRemoveItem(cristal.uid, 1) --to go usuwa
    end
    return true
end
     
function onTimer5() --creates wall back
doCreateItem(17999,1,posdotp)-- Stone pos
end

function onTimer6()
local tp = Game.createItem(1387, 1, posdotp) --na koordach
tp:setActionId(45702) --zmienia aid 
 end

function onUse(cid, item, fromPosition, itemEx, toPosition)
  if(getGlobalStorageValue(96974) < 1) then
		setGlobalStorageValue(96974, 1)
			for i = 1, 6 do
				for k = 1, 10 do
					creatures = {
						"humongous fungus",
						"hideous fungus"
					}
				pos = {x = math.random(7504, 7514), y = math.random(1399, 1416), z = 9}
				addEvent(doSummonCreature, i * 20 * 1000, creatures[math.random(1, 2)], pos)
				addEvent(doSendMagicEffect, i * 20 * 1000, pos, CONST_ME_TELEPORT)
			end
	 end
        
   	 doCreatureSay(cid, "Krysztaly sie laduja!", TALKTYPE_ORANGE_1, false, cid, toPosition)
  	 addEvent(doSendMagicEffect, 6*20*1000, posDeathstrike, CONST_ME_TELEPORT)   			
   	 addEvent(TirarCristal, 6*20*1000)
  	 addEvent(onTimer6, 100+6*20*1000) -- Warzone TP 
   	 addEvent(removerTp, 60000+6*20*1000)
	 addEvent(onTimer5, 61000+6*20*1000) --2minutes
	 addEvent(setGlobalStorageValue, 6*20*1000 + 30*60*1000, 96974, 0)
    else
        doPlayerSendCancel(cid, "Musisz zaczekac 30 minut.")
    end
    return true
end