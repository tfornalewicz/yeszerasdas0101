local config = {
	[24830] = {storage = Storage.Ferumbras.BossCountRazzagorn},
 	[24831] = {storage = Storage.Ferumbras.BossCountRagiaz},
 	[24832] = {storage = Storage.Ferumbras.BossCountZamulosh},
 	[24833] = {storage = Storage.Ferumbras.BossCountMazoran},
 	[24834] = {storage = Storage.Ferumbras.BossCountTarbaz},
 	[24835] = {storage = Storage.Ferumbras.BossCountShulgrax},
 	[24836] = {storage = Storage.Ferumbras.BossCountPlagirath}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local useItem = config[item.uid]
	if not useItem then
		return true
	end

	toPosition.z = toPosition.z + 1
	toPosition.y = toPosition.y + 1

		if player:getStorageValue(config.storage) ~= 1 then
			player:teleportTo(toPosition)
			player:setStorageValue(config.storage, 1)
			toPosition:sendMagicEffect(CONST_ME_TELEPORT)
			player:say('Przeteleportowales artefakt.', TALKTYPE_MONSTER_SAY)
			else
			player:teleportTo(toPosition)
			toPosition:sendMagicEffect(CONST_ME_TELEPORT)
		end

	return true
end