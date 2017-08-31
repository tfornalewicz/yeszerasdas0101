function onKill(creature, target)
	local targetMonster = target:getMonster()
	if not targetMonster then
		return true
	end

	local player = creature:getPlayer()
	local destination = Position(7186, 1742, 15)
	if targetMonster:getName():lower() == 'the shatterer' then
		player:teleportTo(destination)
		player:setStorageValue(88500, 1)
		destination:sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end