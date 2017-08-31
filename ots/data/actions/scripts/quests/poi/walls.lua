local pos = {
	[2025] = {x = 6133, y = 1898, z = 11},
	[2026] = {x = 6135, y = 1898, z = 11},
	[2027] = {x = 6137, y = 1898, z = 11},
	[2028] = {x = 6139, y = 1898, z = 11}
}

local function doRemoveFirewalls(fwPos)
	local tile = Position(fwPos):getTile()
	if tile then
		local thing = tile:getItemById(6289)
		if thing then
			thing:remove()
		end
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if(item.itemid == 1945) then
		doRemoveFirewalls(pos[item.uid])
		player:say('Odblokowane!', TALKTYPE_MONSTER_SAY)
		Position(pos[item.uid]):sendMagicEffect(CONST_ME_FIREAREA)
	end
	item:remove()
	return true
end
