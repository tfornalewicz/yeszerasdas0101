local lava = {
	Position(6213, 1775, 15),
	Position(6214, 1774, 15),
	Position(6213, 1774, 15),
	Position(6214, 1775, 15)  
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local lavaTile
	for i = 1, #lava do
		lavaTile = Tile(lava[i]):getGround()
		if lavaTile and isInArray({407, 598}, lavaTile.itemid) then
			lavaTile:transform(lavaTile.itemid == 598 and 407 or 598)
			lava[i]:sendMagicEffect(CONST_ME_SMOKE)
		end
	end

	item:remove()
	return true
end
