local bridgePosition = Position(6103, 1901, 11)

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid ~= 1945 then
		return false
	end

	if not Tile(Position(6102, 1904, 11)):getItemById(2016, 11) then
		player:say('Ani drgnie, zbyt stara ta drzwignia.', TALKTYPE_MONSTER_SAY)
		return true
	end

	local water = Tile(bridgePosition):getItemById(493)
	if water then
		water:transform(5770)
	end

	item:remove()
	return true
end