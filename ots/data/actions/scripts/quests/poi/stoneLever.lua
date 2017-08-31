function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 1945 then
		local stonePosition = Position(6151, 1847, 10)
		local stoneItem = Tile(stonePosition):getItemById(1304)
		if stoneItem then
			stoneItem:remove()
			stonePosition:sendMagicEffect(CONST_ME_EXPLOSIONAREA)
			item:remove()
		end
	end
	return true
end