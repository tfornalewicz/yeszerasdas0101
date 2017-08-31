function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local itemId = item:getId()
	if itemId == 3743 then
			item:transform(5404)
			return true
	else
		item:transform(3743)
		return true
	end
end