local destinations = {
	[2000] = Position(6093, 1896, 10),
	[2001] = Position(6093, 1892, 10)
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	if player:getItemCount(1970) < 1 then
		player:teleportTo(fromPosition)
		player:sendTextMessage(MESSAGE_STATUS_SMALL, 'Bez ksiazki z instrukcjami nawet sie nie wybieraj!')
		return true
	end

	player:teleportTo(destinations[item.uid])
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
