local function revertCask(position)
	local caskItem = Tile(position):getItemById(5092)
	if caskItem then
		caskItem:transform(5094)
		position:sendMagicEffect(CONST_ME_HITBYPOISON)
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local szansa = math.random(10)
	if szansa <= 6 then
		item:transform(5092)
		toPosition:sendMagicEffect(CONST_ME_POFF)
		addEvent(revertCask, 3 * 60  * 1000, toPosition)
	elseif szansa >= 7 and szansa <= 8 then
		item:transform(5092)
		toPosition:sendMagicEffect(CONST_ME_POFF)
		player:addItem(2676, 1)
		addEvent(revertCask, 3 * 60 * 1000, toPosition)
	elseif szansa >= 9 then
		item:transform(5092)
		toPosition:sendMagicEffect(CONST_ME_POFF)
		player:addItem(2676, 2)
		addEvent(revertCask, 3 * 60 * 1000, toPosition)
	end
	return true
end