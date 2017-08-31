local stone_ids = 1354 -- id kamienia
function onUse(cid, item, fromPosition, target, toPosition, isHotkey)
	if  stone_ids == item.itemid and cid:getStorageValue(11000) == 2 and item.uid == 11001 and cid:getItemCount(5921) > 0 then -- tylko gdy mamy poswieconego blossoma
		cid:setStorageValue(11000,3)
		cid:removeItem(5921, 1) -- zabiera nam blossoma
		doCreatureSay(cid, 'Quel esta', TALKTYPE_ORANGE_1) -- jakis napis po elficku
		return true
	end
	return false
end
