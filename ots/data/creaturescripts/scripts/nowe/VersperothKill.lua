local teleportPosition = Position(7488, 1378, 11) --{x = 7488, y = 1378, z = 11}

local function transformTeleport()
	local teleportItem = Tile(teleportPosition):getItemById(1387)
	if not teleportItem then
		return
	end

	teleportItem:transform(18463)
end

local function clearArena()
	local spectators = Game.getSpectators(Position(7501, 1411, 11), false, false, 12, 12, 12, 12) --{x = 7501, y = 1411, z = 11}
	local exitPosition = Position(7406, 1412, 11) --{x = 7406, y = 1412, z = 11}
	for i = 1, #spectators do
		local spectator = spectators[i]
		if spectator:isPlayer() then
			spectator:teleportTo(exitPosition)
			exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
			spectator:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Zostales teleportowany przez systemy bezpieczenstwa.')
		else
			spectator:remove()
		end
	end
end

function onKill(creature, target)
	local targetMonster = target:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'versperoth' then
		return true
	end

	Game.setStorageValue(GlobalStorage.Versperoth.Battle, 2)
	addEvent(Game.setStorageValue, 30 * 60 * 1000, GlobalStorage.Versperoth.Battle, 0)

	local holeItem = Tile(teleportPosition):getItemById(18462)
	if holeItem then
		holeItem:transform(1387)
		holeItem:setActionId(45701)
	end
	--Game.createMonster('abyssador', Position(7499, 1407, 11))--

	addEvent(transformTeleport, 30 * 60 * 1000)
	addEvent(clearArena, 32 * 60 * 1000)
	return true
end
