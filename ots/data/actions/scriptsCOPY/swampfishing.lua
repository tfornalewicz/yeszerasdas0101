local swampIds = {18581, 18582, 18583, 18584, 18585, 18586, 18587, 18588, 18589, 18590}
-- wymagac larw?
local useLarvaes = true

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not isInArray(swampIds, target.itemid) then
		return false
	end
		toPosition:sendMagicEffect(CONST_ME_HITBYPOISON)
	local targetId = target.itemid

	if useLarvaes and not player:removeItem("larvae", 1) then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "Nie posiadasz larw.")
		return true
	end

	if math.random(200) <= math.min(math.max(10 + (player:getEffectiveSkillLevel(SKILL_FISHING) - 10) * 0.597, 10), 50) then
		local range = math.random(100)
		if range > 99 then
			player:addItem(20138, 1) --pijawka
		elseif range > 90 then
			player:addItem(2145, 1) --syf
		elseif range > 80 then
			player:addItem(2227, 1) --syf
		elseif range > 70 then
			player:addItem(2238, 1) --syf
		elseif range > 60 then
			player:addItem(2817, 1) --syf
		elseif range > 40 then
			player:addItem(2240, 1) --syf
		elseif range < 30 then
			player:addItem(2237, 1) --syf
		end
		toPosition:sendMagicEffect(CONST_ME_STONES)
	end
	return true
end