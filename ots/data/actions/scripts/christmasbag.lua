function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:addItem(6527, 1)
	item:remove()	
	player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
	return true
end
