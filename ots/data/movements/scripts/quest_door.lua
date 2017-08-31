function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if player == nil then
		return false
	end

	if player:getStorageValue(item.actionid) == -1 then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Nie mozesz przejsc przez te drzwi.")
		player:teleportTo(fromPosition, true)
		return false
	end
	return true
end