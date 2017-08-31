local drunk = Condition(CONDITION_DRUNK)
drunk:setParameter(CONDITION_PARAM_TICKS, 60000)

local poison = Condition(CONDITION_POISON)
poison:setParameter(CONDITION_PARAM_DELAYED, true)
poison:setParameter(CONDITION_PARAM_MINVALUE, -50)
poison:setParameter(CONDITION_PARAM_MAXVALUE, -120)
poison:setParameter(CONDITION_PARAM_STARTVALUE, -5)
poison:setParameter(CONDITION_PARAM_TICKINTERVAL, 4000)
poison:setParameter(CONDITION_PARAM_FORCEUPDATE, true)

local fluidMessage = {
	[3] = 'Aah...',
	[4] = 'Urgh!',
	[5] = 'Mmmh.',
	[7] = 'Aaaah...',
	[10] = 'Aaaah...',
	[11] = 'Urgh!',
	[13] = 'Urgh!',
	[15] = 'Aah...',
	[19] = 'Urgh!',
	[43] = 'Aaaah...'
}
-- ============== DO QUESTA YALAHARI MISJA 1
local item_id = 9912 -- id tej aparatury
-- ============== DO QUESTA YALAHARI MISJA 1

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local targetType = ItemType(target.itemid)
-- ============== DO QUESTA YALAHARI MISJA 1
		if item.itemid == 2007 and target.actionid == 11045 then 
			player:removeItem(2007,1) -- zabieramy butelke
			player:addItem(26387,1) -- dajemy wodke leszke
			doCreatureSay(cid, 'Plum', TALKTYPE_ORANGE_1)
			return true
		elseif item_id == target.itemid and player:getStorageValue(11002) == 4
								and player:getItemCount(2006) > 0
								and target.uid == 11003 then 
		player:setStorageValue(11002,5)
		doCreatureSay(cid, 'Puffff', TALKTYPE_ORANGE_1)
		player:removeItem(2006,1) -- zabieramy viala
		player:addItem(26383,1) -- i dajemy love potion
   -- player:addItem(ItemType(2006):getId(), 1) -- dostaje eliksir, na razie prowizorka
	end
-- ============== DO QUESTA YALAHARI MISJA 1
	if targetType:isFluidContainer() then
		if target.type == 0 and item.type ~= 0 then
			target:transform(target.itemid, item.type)
			item:transform(item.itemid, 0)
			return true
		elseif target.type ~= 0 and item.type == 0 then
			target:transform(target.itemid, 0)
			item:transform(item.itemid, target.type)
			return true
		end
	end

	if target.itemid == 1 then
		if item.type == 0 then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, 'It is empty.')

		elseif target.uid == player.uid then
			if isInArray({3, 15, 43}, item.type) then
				player:addCondition(drunk)
				player:addAchievement(36)

			elseif item.type == 4 then
				player:addCondition(poison)

			elseif item.type == 7 then
				player:addMana(math.random(50, 150))
				fromPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)

			elseif item.type == 10 then
				player:addHealth(60)
				fromPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			end

			player:say(fluidMessage[item.type] or 'Gulp.', TALKTYPE_MONSTER_SAY)
			item:transform(item.itemid, 0)
		else
			local pool = Game.createItem(2016, item.type, toPosition)
			if pool then
				pool:decay()
			end
			item:transform(item.itemid, 0)
		end

	else

		local fluidSource = targetType:getFluidSource()
		if fluidSource ~= 0 then
			item:transform(item.itemid, fluidSource)

		elseif item.type == 0 then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, 'It is empty.')

		else
			if item.type == 2 and target.actionid == 2023 then
			
			local position = player:getPosition()
			position.z = position.z + 1
			player:teleportTo(position)

			else
				if toPosition.x == CONTAINER_POSITION then
					toPosition = player:getPosition()
				end

				local pool = Game.createItem(2016, item.type, toPosition)
				if pool then
					pool:decay()
				end
			end
			item:transform(item.itemid, 0)
		end
	end

	return true
end
