function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item:getId() == 7183 then
		item:transform(7184)
		player:setStorageValue(242, 399)

	else
		item:transform(7183)
		player:setStorageValue(242, 399)

	end
	return true
end