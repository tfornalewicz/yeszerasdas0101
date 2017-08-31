local config = {
	[1] = Position(6186, 1066, 12), --{x = 6186, y = 1066, z = 12}
	[2] = Position(6334, 945, 12), --{x = 6334, y = 945, z = 12}
	[3] = Position(6268, 1071, 12), --{x = 6268, y = 1071, z = 12}
	[4] = Position(6088, 966, 12) --{x = 6088, y = 966, z = 12}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if isInArray({7911, 7912}, item.itemid) then
		local gemCount = player:getStorageValue(Storage.ElementalSphere.MachineGemCount)
		if isInArray({6230, 6231}, toPosition.x) and toPosition.y == 1006 and toPosition.z == 10 and gemCount >= 20 then
			player:setStorageValue(Storage.ElementalSphere.MachineGemCount, gemCount - 20)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(config[player:getVocation():getBase():getId()], false)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
		toPosition.x = toPosition.x + (item.itemid == 7911 and 1 or -1)
		local tile = toPosition:getTile()
		if tile then
			local thing = tile:getItemById(item.itemid == 7911 and 7912 or 7911)
			if thing then
				thing:transform(thing.itemid + 4)
			end
		end
		item:transform(item.itemid + 4)
	else
		toPosition.x = toPosition.x + (item.itemid == 7915 and 1 or -1)
		local tile = toPosition:getTile()
		if tile then
			local thing = tile:getItemById(item.itemid == 7915 and 7916 or 7915)
			if thing then
				thing:transform(thing.itemid - 4)
			end
		end
		item:transform(item.itemid - 4)
	end
	return true
end