function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.HotCuisineQuest.CookbookDoor) == 1 then
		player:addItem(10006,1)
		player:setStorageValue(Storage.HotCuisineQuest.CookbookDoor, 0)
		else
		player:say('Nic tu dla mnie nie ma..', TALKTYPE_MONSTER_SAY)

		return true
	end
end