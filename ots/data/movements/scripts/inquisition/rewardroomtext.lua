function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player or player:getStorageValue(Storage.TheInquisition.RewardRoomText) == 1 then
		return true
	end

	player:setStorageValue(Storage.TheInquisition.RewardRoomText, 1)
	player:say('Mozesz wybrac tylko jedna z nagrod!', TALKTYPE_MONSTER_SAY, false, player)
	return true
end
