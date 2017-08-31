function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if(item.uid == 9021) then
		if(player:getStorageValue(Storage.TheInquisition.Questline) == 23) then
			return (player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Zapomniales poprosic Henryka o outfit."))
		end
		if(player:getStorageValue(Storage.TheInquisition.Questline) >= 24) then
			if(item.itemid == 5105) then
				player:teleportTo(toPosition, true)
				item:transform(item.itemid + 1)
			end
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Potrzebujesz specjalnych uprawnien aby przejsc dalej.")
		end
	end
	return true
end
