function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid == 2782 then
		target:transform(2781)
		target:decay()
		return true
	end
	
	if target.itemid == 1499 then
		target:remove()
		return true
	end
	local itemId = target:getId()
        if target:getName() == "spider web" then
                if math.random(1, 3) == 1 then
                        if itemId == 7538 then
                                target:transform(7544)
                        elseif itemId == 7539 then
                                target:transform(7545)
                        end
                        target:decay()
                end
                toPosition:sendMagicEffect(CONST_ME_POFF)
                return true
        end

	return false
end
