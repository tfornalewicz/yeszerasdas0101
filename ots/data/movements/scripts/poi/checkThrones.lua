local cStorages = {
	[2090] = Storage.PitsOfInferno.ThroneInfernatil,
	[2091] = Storage.PitsOfInferno.ThroneTafariel,
	[2092] = Storage.PitsOfInferno.ThroneVerminor,
	[2093] = Storage.PitsOfInferno.ThroneApocalypse,
	[2094] = Storage.PitsOfInferno.ThroneBazir,
	[2095] = Storage.PitsOfInferno.ThroneAshfalor,
	[2096] = Storage.PitsOfInferno.ThronePumin
}

function onStepIn(creature, item, position, fromPosition)
	if not creature:isPlayer() then
		return true
	end

	if creature:getStorageValue(cStorages[item.uid]) ~= 1 then
		creature:teleportTo(Position(6126, 1797, 12))
		creature:say('A ty dokad?', TALKTYPE_MONSTER_SAY)
	end
	return true
end
