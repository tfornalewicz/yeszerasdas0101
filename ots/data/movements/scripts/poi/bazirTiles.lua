local config = {
	[16772] = Position(6056, 1930, 15),
	[16773] = Position(6027, 1946, 15),
	[16774] = Position(6129, 1806, 12),
	[50082] = Position(6047, 1959, 14),
	[50083] = Position(6047, 1959, 14)
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local targetPosition = config[item.actionid]
	if not targetPosition then
		return true
	end

	player:teleportTo(targetPosition)
	return true
end
