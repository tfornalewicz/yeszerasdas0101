dofile ('data/tasks.lua')

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local reward = rewards[item.actionid-5000]
	if not reward then
		return true
	end
    player:getPosition():sendMagicEffect(CONST_ME_BUBBLES)
	player:getPosition():sendMagicEffect(CONST_ME_YELLOW_RINGS)
	player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
	player:say('Otrzymales dostep do '.. reward.bossName, TALKTYPE_MONSTER_SAY)
	player:setStorageValue(301, 1)
	
	item:remove()
	return true
end
