
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
	storage = item.uid
	if storage <= 1250 or storage >= 30000 then
		return false
	end
	
	if player:getStorageValue(storage) > 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Nic tu dla ciebie nie ma.')
		return true
	end
	
	player:addAchievement(14)
	player:addAchievementProgress(20, 10)
	
	
	local items, reward = {}
	local size = item:isContainer() and item:getSize() or 0
	if size == 0 then
		reward = item:clone()
	else
		local container = Container(item.uid)
		for i = 0, container:getSize() - 1 do
			items[#items + 1] = container:getItem(i):clone()
		end
	end

	size = #items
	if size == 1 then
		reward = items[1]:clone()
	end

	local result = ''
	if reward then
		local ret = ItemType(reward.itemid)
		if ret:isRune() then
			result = ret:getArticle() .. ' ' ..  ret:getName() .. ' (' .. reward.type .. ' charges)'
		elseif ret:isStackable() and reward:getCount() > 1 then
			result = reward:getCount() .. ' ' .. ret:getPluralName()
		elseif ret:getArticle() ~= '' then
			result = ret:getArticle() .. ' ' .. ret:getName()
		else
			result = ret:getName()
		end
	else
		if size > 20 then
			reward = Game.createItem(item.itemid, 1)
		elseif size > 8 then
			reward = Game.createItem(1988, 1)
		else
			reward = Game.createItem(1987, 1)
		end

		for i = 1, size do
			local tmp = items[i]
			if reward:addItemEx(tmp) ~= RETURNVALUE_NOERROR then
				print('[Warning] QuestSystem:', 'Could not add quest reward to container')
			end
		end
		local ret = ItemType(reward.itemid)
		result = ret:getArticle() .. ' ' .. ret:getName()
	end

	if player:addItemEx(reward) ~= RETURNVALUE_NOERROR then
		local weight = reward:getWeight()
		if player:getFreeCapacity() < weight then
			player:sendCancelMessage(string.format('Nagroda %s wazy %.2f oz. Nie mozesz jej udzwignac.', result, (weight / 100)))
		else
			player:sendCancelMessage((player:getSex() == PLAYERSEX_MALE and  'Znalales ' or "Znalazlas ")  .. result ..  ', ale nie masz miejsca na ten przedmiot.')
		end
		return true
	end

	local anni = {4015, 4016, 4017, 4018}
	
	 if isInArray(anni, storage) then
		for i = 1, #anni do
			player:setStorageValue(anni[i], 1)
		end
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Otrzymujesz dodatek do Demon Hunter!")
		player:addOutfitAddon(288, 1)
		player:addOutfitAddon(289, 1)
	end

	
	local arena1 = {4028, 7364, 7392, 7380, 7406}
	
	 if isInArray(arena1, storage) then
		for i = 1, #arena1 do
			player:setStorageValue(arena1[i], 1)
		end
	end
	
	local arena2 = {4029, 12571, 7415, 7389, 7384}
	
	 if isInArray(arena2, storage) then
		for i = 1, #arena2 do
			player:setStorageValue(arena2[i], 1)
		end
	end
	
	local arena3 = {4030, 6529, 7429, 7434, 7390}
	
	 if isInArray(arena3, storage) then
		for i = 1, #arena3 do
			player:setStorageValue(arena3[i], 1)
		end
	end

	local poi = {4019, 4020, 4021}
	
	 if isInArray(poi, storage) then
		for i = 1, #poi do
			player:setStorageValue(poi[i], 1)
		end
	end

	local orcFortress = {6023, 6024, 6025}
	
	 if isInArray(orcFortress, storage) then
		for i = 1, #orcFortress do
			player:setStorageValue(orcFortress[i], 1)
		end
	end
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE,(player:getSex() == PLAYERSEX_MALE and  'Znalales ' or "Znalazlas ")  .. result .. '.')
	player:setStorageValue(storage, 1)
	return true
end