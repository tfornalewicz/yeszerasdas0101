local function revertCask(position)
	local caskItem = Tile(position):getItemById(2726)
	if caskItem then
		caskItem:transform(5096)
		position:sendMagicEffect(CONST_ME_MAGIC_GREEN)
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local szansa = math.random(10)
	if szansa <= 8 then
		item:transform(2726)
		toPosition:sendMagicEffect(CONST_ME_POFF)
		addEvent(revertCask, 15 * 60  * 1000, toPosition)
	elseif szansa >= 9 then
		item:transform(2726)
		toPosition:sendMagicEffect(CONST_ME_POFF)
		player:addItem(2678, 1)
		addEvent(revertCask, 15 * 60 * 1000, toPosition)
	end
	return true
end