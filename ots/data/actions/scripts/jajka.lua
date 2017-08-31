function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local szansa = math.random(100)
	if szansa <= 30 then
		item:transform(13832)
		item:decay()
		fromPosition:sendMagicEffect(CONST_ME_POFF)
	elseif szansa >= 40 and szansa <= 50 then
		item:transform(13832)
		item:decay()
		player:addItem(5890, 1)
		fromPosition:sendMagicEffect(CONST_ME_POFF)
	elseif szansa >= 60 and szansa <= 80 then
		item:transform(13832)
		item:decay()
		player:addItem(2695, 1)
		fromPosition:sendMagicEffect(CONST_ME_POFF)
	elseif szansa >= 90 and szansa <= 97 then
		item:transform(13832)
		item:decay()
		player:addItem(2695, 2)
		fromPosition:sendMagicEffect(CONST_ME_POFF)
	elseif szansa >= 98 then
		item:transform(13832)
		item:decay()
		player:addItem(6545, 1)
		fromPosition:sendMagicEffect(CONST_ME_POFF)
	end	
	return true
end