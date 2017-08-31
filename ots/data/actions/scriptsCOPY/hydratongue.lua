function onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if player:getLevel() >= 30 then
		if player:getStorageValue(Storage.HydraNest) >= os.time() then
			return player:say('Dzis juz je sprawdzilem..', TALKTYPE_MONSTER_SAY)
		end
	local szansa = math.random(100)
		if szansa <= 29 then
			fromPosition:sendMagicEffect(CONST_ME_POFF)
			doTargetCombatHealth(0, player, COMBAT_POISONDAMAGE, -60, -150, CONST_ME_HITBYPOISON)
			player:say('Niech to!', TALKTYPE_MONSTER_SAY)
			player:setStorageValue(Storage.HydraNest, os.time() + 20 * 3600)
		elseif szansa >= 30 and szansa <= 49 then
			player:addItem(2146, 2)
			player:setStorageValue(Storage.HydraNest, os.time() + 20 * 3600)
		elseif szansa >= 50 and szansa <= 69 then
			player:addItem(2149, 2)
			fromPosition:sendMagicEffect(CONST_ME_POFF)
			player:setStorageValue(Storage.HydraNest, os.time() + 20 * 3600)
		elseif szansa >= 70 and szansa <= 89 then
			player:addItem(4850, 1)
			fromPosition:sendMagicEffect(CONST_ME_POFF)
			player:setStorageValue(Storage.HydraNest, os.time() + 20 * 3600)
		elseif szansa >= 90 then
			player:addItem(7250, 1)
			fromPosition:sendMagicEffect(CONST_ME_POFF)
			player:setStorageValue(Storage.HydraNest, os.time() + 20 * 3600)
		end
		return true
	end
end
