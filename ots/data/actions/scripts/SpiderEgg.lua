function onUse(cid, item, fromPosition, itemEx, toPosition)
	local rand, effect = math.random(1, 100), CONST_ME_TELEPORT
	if((rand >= 50) and (rand < 83)) then
		doSummonCreature("Spider", fromPosition)
		item:transform(7566)
		item:decay()
	elseif((rand >= 83) and (rand < 97)) then
		doSummonCreature("Poison Spider", fromPosition)
		item:transform(7566)
		item:decay()
	elseif((rand >= 97) and (rand < 99)) then
		doSummonCreature("Tarantula", fromPosition)
		item:transform(7566)
		item:decay()
	elseif((rand >= 99) and (rand < 100)) then
		doSummonCreature("Giant Spider", fromPosition)
		item:transform(7566)
		item:decay()
	elseif(rand == 100) then
		player:addItem(5879, 1)
		item:transform(7566)
		item:decay()
	else
		effect = CONST_ME_POFF
	end

	doSendMagicEffect(fromPosition, effect)
	return true
end