local wyvern_egg = 15501
function onUse(cid, item, fromPosition, target, toPosition, isHotkey)
  local player = Player(cid)
	if cid:getStorageValue(11068) < 1 then -- Jak ktos nie ma questa
		return false
	end
	print(target.itemid)
    print(item.itemid)
	if wyvern_egg == item.itemid then
        if player:getStorageValue(11068) < 2 then
            player:addItem(26390,1) -- dostaje jajko wyverny
            player:setStorageValue(11068,2) 
            doCreatureSay(cid, '*Crack* na jajku powstalo pekniecie przy wyciaganiu', TALKTYPE_ORANGE_1) 
            toPosition:sendMagicEffect(10)
            Game.createMonster("Elder Wyrm",player:getPosition())
            Game.createMonster("Elder Wyrm",player:getPosition())
            Game.createMonster("Elder Wyrm",player:getPosition())
        else
            doCreatureSay(cid, 'Nie ma tam juz wiecej jajek', TALKTYPE_ORANGE_1) 
        end
    end
	return true
end
