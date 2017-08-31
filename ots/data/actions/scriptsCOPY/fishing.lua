local waterIds = {493, 4608, 4609, 4610, 4611, 4612, 4613, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625, 4665, 4666, 7236, 10499, 15401, 15402}
--loot do water elemental
local lootCommon = {2143}
local lootRare = {2146, 2149}
local lootVeryRare = {7632, 7633}
local lootUltraRare = {10220}
-- wymagac robakow?
local useWorms = true

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not isInArray(waterIds, target.itemid) then
		return false
	end

	local targetId = target.itemid
	--water elemental
	if targetId == 10499 then
		local owner = target:getAttribute(ITEM_ATTRIBUTE_CORPSEOWNER)
		if owner ~= 0 and owner ~= player.uid then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "Musisz poczekac.")
			return true
		end

		toPosition:sendMagicEffect(CONST_ME_WATERSPLASH)
		target:remove()

		local rareChance = math.random(1000)
		if rareChance == 1 then
			player:addItem(lootUltraRare[math.random(#lootUltraRare)], 1)
		elseif rareChance <= 7 then
			player:addItem(lootVeryRare[math.random(#lootVeryRare)], 1)
		elseif rareChance <= 55 then
			player:addItem(lootRare[math.random(#lootRare)], 1)
		elseif rareChance <= 70 then
			player:addItem(lootCommon[math.random(#lootCommon)], 1)
		else
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "Nic nie wylowiles.")
		end
		return true
	end

	if useWorms and not player:removeItem("worm", 1) then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "Nie posiadasz robakow.")
		return true
	end
	
	player:addSkillTries(SKILL_FISHING, 1)
	toPosition:sendMagicEffect(CONST_ME_LOSEENERGY)
	if (math.random(300) <= 2) then
		local condition = Condition(CONDITION_BLEEDING)
		condition:setParameter(CONDITION_PARAM_DELAYED, 1)
		condition:addDamage(5, 10, -10)
		player:getPosition():sendMagicEffect(CONST_ME_DRAWBLOOD)
		player:addCondition(condition)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Wbil ci sie haczyk w noge!")
		return true
	end

	if math.random(200) <= math.min(math.max(10 + (player:getEffectiveSkillLevel(SKILL_FISHING) - 10) * 0.597, 10), 50) then
		local range = math.random(100)
		local points =0
		if range > 99 then
			player:addItem(7963, 1) --marlin
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Piekna ryba! Niektorzy wedkarze duzo by dali za taki okaz, popytaj w miescie.")
			points = 30
		elseif range > 90 then
			player:addItem(7158, 1) --pstrag
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "No no, zlapac takiego pstraga to jak wygrac zycie.")
			points = 5
		elseif range > 70 then
			player:addItem(2669, 1) --szczupak
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Ooo, jebany szczupak, a jakie ma zeby! Uwazaj, bo chaps i reka ujebana!")
			points = 3
		elseif range > 60 then
			player:addItem(7159, 1) --okon
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Zlapales okonia.")
			points = 2
		elseif range < 30 then
			player:addItem(2667, 1)
			points = 1
		else
			points = 0
		end
		if (player:getStorageValue(10100) > 0 and os.date('%A') == 'Sunday') then
			player:setStorageValue(10100, player:getStorageValue(10100)+points)
		end
		toPosition:sendMagicEffect(CONST_ME_WATERSPLASH)
	end
	return true
end