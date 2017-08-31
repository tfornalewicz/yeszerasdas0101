dofile('data/tasks.lua')

function onKill(player, target)
    if target:isPlayer() or target:getMaster() then
		return true
	end
	player:addAchievementProgress(3, 1000)
	local targetName = target:getName():lower()
	local activeTasks =  false
	local first, second, third = player:getStorageValue(291), player:getStorageValue(292), player:getStorageValue(293)
	if (first > 0) then
		if isInArray(config[first].creatures, targetName) then
			player:setStorageValue(200+first, player:getStorageValue(200+first)+1)
			player:sendTextMessage(23, "Task na ".. config[first].name .. ": "..player:getStorageValue(200+first) .."/"..config[first].killsRequired)
			if (player:getStorageValue(200+first)) >= config[first].killsRequired then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Task na "..config[first].name .." zostal zakonczony! Udaj sie do npc po nagrode!")
				player:setStorageValue(291, 0)
				player:setStorageValue(295, 2)
			end
			return true
		end
	end
	if second > 0 then
		if isInArray(config[second].creatures, targetName) then
			player:setStorageValue(200+second, player:getStorageValue(200+second)+1)
			player:sendTextMessage(23, "Task na ".. config[second].name .. ": "..player:getStorageValue(200+second) .."/"..config[second].killsRequired)
			if (player:getStorageValue(200+second)) >= config[second].killsRequired then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Task na "..config[second].name .." zostal zakonczony! Udaj sie do npc po nagrode!")
				player:setStorageValue(292, 0)
				player:setStorageValue(295, 2)
			end
			return true
		end
	end
	if third > 0 then
		if isInArray(config[third].creatures, targetName) then
			player:setStorageValue(200+third, player:getStorageValue(200+third)+1)
			player:sendTextMessage(23, "Task na ".. config[third].name .. ": "..player:getStorageValue(200+third) .."/"..config[third].killsRequired)
			if (player:getStorageValue(200+third)) >= config[third].killsRequired then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Task na "..config[third].name .." zostal zakonczony! Udaj sie do npc po nagrode!")
				player:setStorageValue(293, 0)
				player:setStorageValue(295, 2)
			end
			return true
		end
	end
    return true
end
