dofile ('data/tasks.lua')

local function roomIsOccupied(centerPosition, rangeX, rangeY, playerId)
	local spectators = Game.getSpectators(centerPosition, false, false, rangeX, rangeX, rangeY, rangeY)
	if #spectators ~= 0 then
		local player = Player(playerId)
		for i = 1, #spectators do
			spectator = spectators[i]
			if (#spectators == 1 and spectator:getName() == player:getName()) then
				return false
			end
		end
		return true
	end
	return false
end

function clearBossRoom(playerId, bossId, centerPosition, rangeX, rangeY, exitPosition)
	local spectators, spectator = Game.getSpectators(centerPosition, false, false, rangeX, rangeX, rangeY, rangeY)
	for i = 1, #spectators do
		spectator = spectators[i]
		if spectator:isPlayer() and spectator.uid == playerId then
			spectator:teleportTo(exitPosition)
			exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
		end

		if spectator:isMonster() and spectator.uid == bossId then
			spectator:remove()
		end
	end
end

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local boss = bosses[item.uid]
	if not boss then
		return true
	end
	
	if (player:getStorageValue(item.uid) ~= 1 or roomIsOccupied(boss.centerPosition, boss.rangeX, boss.rangeY, player.uid)) then
		player:teleportTo(fromPosition)
		return true
	end

	player:setStorageValue(item.uid, 2)

	local monster = Game.createMonster(boss.bossName, boss.bossPosition, true, true)
	if not monster then
		return true
	end

	addEvent(clearBossRoom, 60 * 10 * 1000, player.uid, monster.uid, boss.centerPosition, boss.rangeX, boss.rangeY, fromPosition) --1 min
	player:say('Masz 10 minut na pokonanie '..boss.bossName..'.', TALKTYPE_MONSTER_SAY)
	return true
end