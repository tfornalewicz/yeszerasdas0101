function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 1945 then
		player:teleportTo(Position(6069, 1930, 15))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
 	end
 	return item:transform(item.itemid == 1945 and 1946 or 1945)
end
