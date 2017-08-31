function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	player:teleportTo(Position(6128, 1838, 12))
	player:getPosition():sendMagicEffect(CONST_ME_EXPLOSIONAREA)
	return true
end
