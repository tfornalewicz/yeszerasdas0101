function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local repairedCount = player:getStorageValue(Storage.BigfootBurden.RepairedCrystalCount)
	if repairedCount == 5 or player:getStorageValue(Storage.BigfootBurden.MissionCrystalKeeper) ~= 1 then
		return false
	end

	if target.itemid == 18307 then
		player:setStorageValue(Storage.BigfootBurden.RepairedCrystalCount, repairedCount + 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Naprawiles zniszczony krysztal.')
		target:transform(18311)
		target:decay()
		toPosition:sendMagicEffect(CONST_ME_ENERGYAREA)
	elseif isInArray({18308, 18309, 18310, 18311}, target.itemid) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'To nie ten!')
	end
	return true
end
