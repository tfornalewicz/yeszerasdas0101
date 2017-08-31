function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	if player:getStorageValue(88500) >= 1 then
		player:teleportTo(Position(7186, 1742, 15)) --{x = 7186, y = 1742, z = 15}
	else
		player:teleportTo(Position(7185, 1800, 13)) --{x = 7185, y = 1800, z = 13}
		player:sendCancelMessage("Musisz pokonac The Shatterer aby uzyc teleportu.")
	end
	return true
end