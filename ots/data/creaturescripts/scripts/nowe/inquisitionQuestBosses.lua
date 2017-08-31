local bosses = {
	['ushuriel'] = 200,
	['zugurosh'] = 201,
	['madareth'] = 202,
	['latrivan'] = 203,
	['golgordan'] = 203,
	['annihilon'] = 204,
	['hellgorak'] = 205
}

function onKill(player, target)
	local targetMonster = target:getMonster()
	if not targetMonster then
		return true
	end

	local targetName = targetMonster:getName():lower()
	local bossStorage = bosses[targetName]
	if not bossStorage then
		return true
	end

	local newValue = 2
	if targetName == 'latrivan' or targetName == 'golgordan' then
		newValue = math.max(0, Game.getStorageValue(bossStorage)) + 1
	end
	Game.setStorageValue(bossStorage, newValue)

	if newValue == 2 then
		player:say('Pozostaly ci 3 minuty aby przejsc dalej. Teleport przeniesie cie do nastepnego pokoju.', TALKTYPE_MONSTER_SAY)
		addEvent(Game.setStorageValue, 3 * 60 * 1000, bossStorage, 0)
	end
	return true
end