local function revertCask(position)
	local caskItem = Tile(position):getItemById(5156)
	if caskItem then
		caskItem:transform(5157)
		position:sendMagicEffect(CONST_ME_SMALLPLANTS)
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local szansa = math.random(10)
	if szansa <= 5 then
		item:transform(5156)
		toPosition:sendMagicEffect(CONST_ME_POFF)
		addEvent(revertCask, 5 * 60 * 1000, toPosition)
	elseif szansa >= 6 and szansa <= 8 then
		item:transform(5156)
		toPosition:sendMagicEffect(CONST_ME_POFF)
		player:addItem(5097, 1)
		addEvent(revertCask, 5 * 60 * 1000, toPosition)
	elseif szansa >= 9 then
		item:transform(5156)
		toPosition:sendMagicEffect(CONST_ME_POFF)
		player:addItem(5097, 2)
		addEvent(revertCask, 5 * 60 * 1000, toPosition)
	end
	return true
end