function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.BigfootBurden.GrindstoneStatus) == 1 or player:getStorageValue(Storage.BigfootBurden.MissionGrindstoneHunt) ~= 1 then
		return false
	end

	toPosition:sendMagicEffect(CONST_ME_HITBYFIRE)
	item:transform(18335)

	if math.random(15) ~= 15 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Tym razem ci sie nie poszczescilo.')
		return true
	end

	player:setStorageValue(Storage.BigfootBurden.GrindstoneStatus, 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Twoja zwinnosc pozwolila zlapac kamien nim wpadl do lawy.')
	player:addItem(18337, 1)
	return true
end
