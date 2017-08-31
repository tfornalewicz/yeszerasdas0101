function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local szansa = math.random(10)
	if szansa <= 5 then
		item:transform(14459)
		item:decay()
		fromPosition:sendMagicEffect(CONST_ME_HITBYPOISON)
	elseif szansa >= 6 and szansa <=8 then
		item:transform(14459)
		item:decay()
		player:addItem(15572, 1)
		fromPosition:sendMagicEffect(CONST_ME_HITBYPOISON)
	elseif szansa >= 9 then
		item:transform(14459)
		item:decay()
		player:addItem(15572, 2)
		fromPosition:sendMagicEffect(CONST_ME_HITBYPOISON)
	end	
	return true
end