local bosses = {
	[3144] = {position = Position(7512, 1450, 9), name = 'deathstrike'}, --{x = 7512, y = 1450, z = 9}
	[3145] = {position = Position(7516, 1451, 10), name = 'gnomevil'}, --{x = 7516, y = 1451, z = 10}
	[3146] = {position = Position(7494, 1402, 11), name = 'abyssador', checkItemId = 18463}, --{x = 7494, y = 1402, z = 11}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local boss = bosses[item.uid]
	if boss.checkItemId then
		if Tile(position):getItemById(boss.checkItemId) then
			return true
		end
	end

	player:teleportTo(boss.position)
	boss.position:sendMagicEffect(CONST_ME_TELEPORT)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Pozostalo ci pol godziny aby pokonac ' .. boss.name .. '. W innym wypadku przeteleportowany zostaniesz przez systemy bezpieczenstwa.')
	return true
end
