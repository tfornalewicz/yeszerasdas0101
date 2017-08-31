local hay_bed_id = 3848
function onUse(cid, item, fromPosition, target, toPosition, isHotkey)
	local player = Player(cid)
	if player:getStorageValue(11002) ~= 6 then -- czy ktos juz bral to i czy ma aktywny od postmana
		return false
	end
	
	if hay_bed_id == item.itemid then
		if player:getStorageValue(item.uid) ~= 1 then
			if player:getItemCount(26383) > 0 then -- czy ma eliksir przy sobie
				doCreatureSay(cid, 'znalazles wlosa', TALKTYPE_ORANGE_1) 
                doSendMagicEffect(position, 49)
                doCreatureSay(cid, 'Mikstura zabulgotala', TALKTYPE_ORANGE_1) 
                cid:setStorageValue(item.uid, 1) -- uaktualnienie uid lozka na 1
			end
		end
	end
	return true
end
