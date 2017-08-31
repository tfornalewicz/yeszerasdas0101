local config = {
	[11258] = {blessId = 4, text = 'The Spark of the Phoenix'},
	[11259] = {blessId = 2, text = 'The Embrace of Tibia'},
	[11260] = {blessId = 1, text = 'The Spiritual Shielding'},
	[11261] = {blessId = 3, text = 'The Fire of the Suns'},
	[11262] = {blessId = 5, text = 'The Wisdom of Solitude'}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local useItem = config[item.itemid]
	if not useItem then
		return true
	end

	--if player:hasBlessing(useItem.blessId) then
	--	player:say('Posiadasz juz to blogoslawienstwo.', TALKTYPE_MONSTER_SAY)
	--	return true
	--end
	
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Bless item zostal zamieniony na 2k. Udaj sie do Natanka po blessy.")
	player:getPosition():sendMagicEffect(CONST_ME_LOSEENERGY)
	item:remove(1)
	player:addMoney(2000)
	return true
end