local stonePositions = {
	Position(6153, 1898, 12),
	Position(6154, 1898, 12)
}


function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid ~= 1945 then
		return false
	end

	local leverCount = getGlobalStorageValue(3)
	if item.uid > 2049 and item.uid < 2065 then
		local number = item.uid - 2049
		if leverCount < 0 then
			setGlobalStorageValue(3, 1)
		else
			setGlobalStorageValue(3, leverCount+1)
		end
		player:say(getGlobalStorageValue(3)..'/15', TALKTYPE_MONSTER_SAY)
		player:addExperience(10000, true)
	elseif item.uid == 2065 then
		if leverCount ~= 15 then
			player:say('Nie mozesz ruszyc... jeszcze nie.', TALKTYPE_MONSTER_SAY)
			return true
		end

		local stone
		for i = 1, #stonePositions do
			stone = Tile(stonePositions[i]):getItemById(1304)
			if stone then
				stone:remove()
				stonePositions[i]:sendMagicEffect(CONST_ME_EXPLOSIONAREA)
			end
		end
	end
	item:remove()
	return true
end
