function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	if player:getStorageValue(88419) >= 1 and player:getLevel() >= 150 then
		player:teleportTo(Position(7107, 1657, 13)) --{x = 7107, y = 1657, z = 13}
	else
		player:teleportTo(fromPosition) --{x = 6730, y = 1281, z = 8}
		player:sendCancelMessage("Musisz oddac 30 demonic essence Mazariusowi, lub nie posiadasz odpowiedniego poziomu.")
	end
	return true
end