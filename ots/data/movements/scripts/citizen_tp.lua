function onStepIn(creature, item, position, fromPosition)
	if item.actionid > 6000 and item.actionid < 6004 then
		if not creature:isPlayer() then
			return false
		end
	local town = Town(item.actionid-6000)
	if not town then
		return true
	end
	local player = creature:getPlayer()
	player:setTown(town)
	player:teleportTo(town:getTemplePosition())
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, (player:getSex() == PLAYERSEX_FEMALE and "Zostalas" or "Zostales")..' obywatelem tej krainy.')
	end
	return true
end