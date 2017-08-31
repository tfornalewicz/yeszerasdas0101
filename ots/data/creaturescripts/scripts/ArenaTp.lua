dofile('data/arena.lua')

function onKill(player, target)
    if (target:isPlayer() or target:getMaster()) then
		return true
	end
	local targetName = target:getName():lower()
	if (isInArray(arena_bosses, targetName)) then
		for i = 1, 30 do
			if arena_bosses[i] == targetName then
				local event_id = player:getStorageValue(299)
				stopEvent(event_id)
				if (i == 10 or i == 20 or i == 30) then
					i=i/10
					player:setStorageValue(300+i, 2)
					player:setStorageValue(26099+i, 1)
					player:teleportTo(Position(6918, 630, 7))
					player:say('Wrogowie zostali pokonani!', TALKTYPE_MONSTER_SAY)
					return true
				end
				local arenaroom = player:getStorageValue(300)
				player:addHealth(player:getMaxHealth())
				player:addMana(player:getMaxMana())
				local monster = Game.createMonster(arena_bosses[i+1], rooms[arenaroom].centerPosition, true, true)
				event_id=addEvent(clearArena, 7*60*1000, player.uid, monster.uid, arenaroom)
				player:say('Masz 7 minut na pokonanie przeciwnika.', TALKTYPE_MONSTER_SAY)
				player:setStorageValue(299, event_id)
				return true
			end
		end
	end
	
    return true
end