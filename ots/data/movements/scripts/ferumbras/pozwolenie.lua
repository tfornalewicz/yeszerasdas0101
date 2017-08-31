function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	if player:getStorageValue(Storage.ElementalSphere.QuestLine) == 3 then
		player:teleportTo(Position(6219, 985, 8)) --{x = 7107, y = 1657, z = 13}
	else
		player:teleportTo(fromPosition) --{x = 6730, y = 1281, z = 8}
		doTargetCombatHealth(0, player, COMBAT_PHYSICALDAMAGE, -60, -80, CONST_ME_DRAWBLOOD)
		player:say('NIE PODCHODZ!', TALKTYPE_MONSTER_SAY)
	end
	return true
end