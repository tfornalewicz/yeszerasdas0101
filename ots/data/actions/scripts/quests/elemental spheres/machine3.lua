function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not isInRange(toPosition, Position(6198, 980, 11), Position(6260, 1042, 11)) then --{x = 6198, y = 980, z = 11}{x = 6260, y = 1042, z = 11}
		return false
	end

	if isInArray({7911, 7912}, item.itemid) then
		toPosition.y = toPosition.y + (item.itemid == 7913 and 1 or -1)
		local machineItem = Tile(toPosition):getItemById(item.itemid == 7913 and 7914 or 7913)
		if machineItem then
			machineItem:transform(machineItem.itemid + 4)
		end
		item:transform(item.itemid + 4)
		player:say('ON', TALKTYPE_MONSTER_SAY, false, player, toPosition)
	else
		toPosition.y = toPosition.y + (item.itemid == 7915 and 1 or -1)
		local machineItem = Tile(toPosition):getItemById(item.itemid == 7915 and 7916 or 7915)
		if machineItem then
			machineItem:transform(machineItem.itemid - 4)
		end
		item:transform(item.itemid - 4)
		player:say('OFF', TALKTYPE_MONSTER_SAY, false, player, toPosition)
	end
	return true

	if isInArray({7913, 7914}, item.itemid) then
		toPosition.x = toPosition.x + (item.itemid == 7913 and 1 or -1)
		local machineItem = Tile(toPosition):getItemById(item.itemid == 7913 and 7914 or 7913)
		if machineItem then
			machineItem:transform(machineItem.itemid + 4)
		end
		item:transform(item.itemid + 4)
		player:say('ON', TALKTYPE_MONSTER_SAY, false, player, toPosition)
	else
		toPosition.x = toPosition.x + (item.itemid == 7917 and 1 or -1)
		local machineItem = Tile(toPosition):getItemById(item.itemid == 7917 and 7918 or 7917)
		if machineItem then
			machineItem:transform(machineItem.itemid - 4)
		end
		item:transform(item.itemid - 4)
		player:say('OFF', TALKTYPE_MONSTER_SAY, false, player, toPosition)
	end
	return true
end
