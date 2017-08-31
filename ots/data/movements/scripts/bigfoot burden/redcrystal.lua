local destination = {
	[3140] = {position = Position(7409, 1422, 9), storageValue = 1, needCrystal = true}, --WARZONE 1 7409, 1422, 9
	[3141] = {position = Position(7424, 1443, 10), storageValue = 2, needCrystal = true}, --WARZONE 2 7424, 1443, 10
	[3142] = {position = Position(7402, 1409, 11), storageValue = 3, needCrystal = true} --WARZONE 3 7402, 1409, 11
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	local teleportCrystal = destination[item.actionid]
	if not teleportCrystal then
		return
	end

	if player:getStorageValue(Storage.BigfootBurden.WarzoneEntry) >= teleportCrystal.storageValue then
		if not teleportCrystal.needCrystal or player:removeItem(18509, 1) then
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(teleportCrystal.position)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:teleportTo(fromPosition)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Aby uzyc potrzebujesz krysztalu teleportacyjnego.')
		end
		return true
	end

	if teleportCrystal.storageValue == 4 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Nie masz pojecia jak tego uzyc.')
	else
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Nie posiadasz uprawnien!')
	end
	return true
end