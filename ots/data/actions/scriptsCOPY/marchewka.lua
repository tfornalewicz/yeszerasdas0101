local function revertCask(position)
	local caskItem = Tile(position):getItemById(18157)
	if caskItem then
		caskItem:transform(18156)
		position:sendMagicEffect(CONST_ME_GREENSMOKE)
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local szansa = math.random(10)
	if szansa <= 4 then
		item:transform(18157)
		toPosition:sendMagicEffect(CONST_ME_POFF)
		addEvent(revertCask, 3 * 3 * 1000, toPosition)
	elseif szansa >= 5 and szansa <= 7 then
		item:transform(18157)
		toPosition:sendMagicEffect(CONST_ME_POFF)
		player:addItem(2684, 1)
		addEvent(revertCask, 3 * 3 * 1000, toPosition)
	elseif szansa >= 8 then
		item:transform(18157)
		toPosition:sendMagicEffect(CONST_ME_POFF)
		player:addItem(2684, 2)
		addEvent(revertCask, 3 * 3 * 1000, toPosition)
	end
	return true
end