function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local itemId = item:getId()
	local targetId = target:getId()
	if itemId == 2229 and targetId == 2047 then
			item:remove(1)
			target:transform(5813)
			return true
		end	
end