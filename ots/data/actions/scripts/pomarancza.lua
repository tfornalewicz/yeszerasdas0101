local function revertCask(position)
	local caskItem = Tile(position):getItemById(4008)
	if caskItem then
		caskItem:transform(4006)
		position:sendMagicEffect(CONST_ME_SMALLPLANTS)
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local szansa = math.random(10)
	if szansa <= 4 then
		item:transform(4008)
		toPosition:sendMagicEffect(CONST_ME_POFF)
		addEvent(revertCask, 5 * 60 * 1000, toPosition)
	elseif szansa >= 5 and szansa <= 7 then
		item:transform(4008)
		toPosition:sendMagicEffect(CONST_ME_POFF)
		player:addItem(2675, 1)
		addEvent(revertCask, 5 * 60 * 1000, toPosition)
	elseif szansa >= 8 then
		item:transform(4008)
		toPosition:sendMagicEffect(CONST_ME_POFF)
		player:addItem(2675, 2)
		addEvent(revertCask, 5 * 60 * 1000, toPosition)
	end
	return true
end