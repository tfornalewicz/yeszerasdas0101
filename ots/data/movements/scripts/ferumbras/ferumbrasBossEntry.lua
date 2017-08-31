function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	if player:getStorageValue(60021) == 1 and 
	player:getStorageValue(60022) == 1 and 
	player:getStorageValue(60023) == 1 and 
	player:getStorageValue(60024) == 1 and 
	player:getStorageValue(60025) == 1 and 
	player:getStorageValue(60026) == 1 and 
	player:getStorageValue(60027) == 1 then
		player:teleportTo(Position(7460, 1879, 12)) --{x = 7460, y = 1879, z = 12}
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:teleportTo(fromPosition) --{x = 6730, y = 1281, z = 8}
		player:sendCancelMessage("Musisz przeteleportowac wszystkie 7 artefaktow, aby przejsc dalej.")
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end