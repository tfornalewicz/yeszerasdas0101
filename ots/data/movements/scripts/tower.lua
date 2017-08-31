local outfit = {lookType = 267, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookTypeEx = 0, lookAddons = 0}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
    position.x = 1414
    position.y = 1599
    position.z = 6
	if item.uid == 12000 then
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		creature:teleportTo(position, false)
		position:sendMagicEffect(CONST_ME_TELEPORT)
	end
--	doSetCreatureOutfit(player, outfit, -1) {x = 1414, y = 1599, z = 6}
end

function onStepOut(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

--	player:removeCondition(CONDITION_OUTFIT)
end
