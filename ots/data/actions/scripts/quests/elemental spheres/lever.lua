local config = {
	{position = Position(6232, 1011, 10), itemid = 8300, toPosition = Position(6231, 1010, 11), vocationId = 3}, --{x = 6231, y = 1010, z = 11}
	{position = Position(6230, 1014, 10), itemid = 8305, toPosition = Position(6229, 1013, 11), vocationId = 2}, --{x = 6229, y = 1013, z = 11}
	{position = Position(6228, 1011, 10), itemid = 8306, toPosition = Position(6226, 1010, 11), vocationId = 4}, --{x = 6226, y = 1010, z = 11}
	{position = Position(6230, 1009, 10), itemid = 8304, toPosition = Position(6229, 1008, 11), vocationId = 1} --{x = 6229, y = 1008, z = 11}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid ~= 1945 then
		item:transform(1945)
		return true
	end

	if player:getPosition() ~= Position(6232, 1011, 10) then --{x = 6232, y = 1011, z = 10}
		return false
	end

	local spectators = Game.getSpectators(Position(6229, 1011, 11), false, true, 30, 30, 30, 30) --{x = 6229, y = 1011, z = 11}
	if #spectators > 0 or Game.getStorageValue(GlobalStorage.ElementalSphere.BossRoom) > 0 then
		player:say('Poczekaj az zwolni sie miejsce.', TALKTYPE_MONSTER_SAY, false, 0, Position(6230, 1011, 10))
		return true
	end

	local players = {}
	for i = 1, #config do
		local creature = Tile(config[i].position):getTopCreature()
		if not creature or not creature:isPlayer() then
			player:say('Potrzebujesz przedstawicieli wszystkich profesji, ktorzy posiadaja odpowiednia skoncentrowana czastke zywiolu.', TALKTYPE_MONSTER_SAY, false, 0, Position(6230, 1011, 10))
			return true
		end

		local vocationId = creature:getVocation():getBase():getId()
		if vocationId ~= config[i].vocationId or creature:getItemCount(config[i].itemid) < 1 or creature:getStorageValue(Storage.ElementalSphere.QuestLine) < 1 then --{x = 6230, y = 1011, z = 10}
			player:say('Potrzebujesz przedstawicieli wszystkich profesji, ktorzy posiadaja odpowiednia skoncentrowana czastke zywiolu.', TALKTYPE_MONSTER_SAY, false, 0, Position(6230, 1011, 10))
			return true
		end

		players[#players + 1] = creature
	end

	for i = 1, #players do
		players[i]:teleportTo(config[i].toPosition)
		config[i].position:sendMagicEffect(CONST_ME_TELEPORT)
		config[i].toPosition:sendMagicEffect(CONST_ME_TELEPORT)
	end

	item:transform(item.itemid + 1)
	return true
end
