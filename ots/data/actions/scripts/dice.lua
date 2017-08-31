function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local value = math.random(6)
	player:say(player:getName() .. " wylosowal " .. value .. ".", TALKTYPE_MONSTER_SAY)
	item:transform(5791 + value)
	return true
end
