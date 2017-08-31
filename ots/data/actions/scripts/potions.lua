local berserk = Condition(CONDITION_ATTRIBUTES)
berserk:setParameter(CONDITION_PARAM_SUBID, 7)
berserk:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
berserk:setParameter(CONDITION_PARAM_SKILL_MELEE, 5)
berserk:setParameter(CONDITION_PARAM_SKILL_SHIELD, -10)
berserk:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local mastermind = Condition(CONDITION_ATTRIBUTES)
mastermind:setParameter(CONDITION_PARAM_SUBID, 8)
mastermind:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
mastermind:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 3)
mastermind:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local bullseye = Condition(CONDITION_ATTRIBUTES)
bullseye:setParameter(CONDITION_PARAM_SUBID, 9)
bullseye:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
bullseye:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 5)
bullseye:setParameter(CONDITION_PARAM_SKILL_SHIELD, -10)
bullseye:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local antidote = Combat()
antidote:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
antidote:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
antidote:setParameter(COMBAT_PARAM_DISPEL, CONDITION_POISON)
antidote:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
antidote:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)

local potions = {
	[6558] = {transform = {id = {7588, 7589}}, effect = CONST_ME_DRAWBLOOD},
	[7439] = {condition = berserk, vocations = {4, 8}, effect = CONST_ME_MAGIC_RED,
			description = "Tylko rycerze moga skorzystac z tej mikstury.", text = "You feel stronger."},

	[7440] = {condition = mastermind, vocations = {1, 2, 5, 6}, effect = CONST_ME_MAGIC_BLUE,
			description = "Tylko druidzi i magowie moga skorzystac z tej mikstury.", text = "You feel smarter."},

	[7443] = {condition = bullseye, vocations = {3, 7}, effect = CONST_ME_MAGIC_GREEN,
			description = "Tylko paladyni moga skorzystac z tej mikstury.", text = "You feel more accurate."},

	[7588] = {health = {250, 350}, vocations = {3, 4, 7, 8}, level = 50, flask = 7634,
			description = "Tylko rycerze od 50 poziomu moga skorzystac z tej mikstury."},

	[7589] = {mana = {115, 185}, vocations = {1, 2, 3, 5, 6, 7}, level = 50, flask = 7634,
			description = "Tylko druidzi i magowie od 50 poziomu moga skorzystac z tej mikstury."},

	[7590] = {mana = {150, 250}, vocations = {1, 2, 5, 6}, level = 80, flask = 7635,
			description = "Tylko druidzi i magowie od 80 poziomu moga skorzystac z tej mikstury."},

	[7591] = {health = {425, 575}, vocations = {4, 8}, level = 80, flask = 7635,
			description = "Tylko rycerze od 80 poziomu moga skorzystac z tej mikstury."},

	[7618] = {health = {125, 175}, flask = 7636},
	[7620] = {mana = {75, 125}, flask = 7636},
	[8472] = {health = {250, 350}, mana = {100, 200}, vocations = {3, 7}, level = 80, flask = 7635,
			description = "Tylko paladyni od 80 poziomu moga skorzystac z tej mikstury."},

	[8473] = {health = {650, 850}, vocations = {4, 8}, level = 130, flask = 7635,
			description = "Tylko rycerze od 130 poziomu moga skorzystac z tej mikstury."},

	[8474] = {combat = antidote, flask = 7636},
	[8704] = {health = {60, 90}, flask = 7636},
	[26029] = {mana = {425, 575}, vocations = {1, 2, 5, 6}, level = 130, flask = 7635,
			description = "Tylko druidzi i magowie od 130 poziomu moga skorzystac z tej mikstury."},

	[26030] = {health = {420, 580}, mana = {250, 350}, vocations = {3, 7}, level = 130, flask = 7635,
			description = "Tylko paladyni od 130 poziomu moga skorzystac z tej mikstury."},

	[26031] = {health = {875, 1125}, vocations = {4, 8}, level = 200, flask = 7635,
			description = "Tylko rycerze od 200 poziomu moga skorzystac z tej mikstury."}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if type(target) == "userdata" and not target:isPlayer() then
		return false
	end
	
	if (item.itemid == 7620 or item.itemid == 7590 or item.itemid == 7589 or item.itemid == 26029) then
		player:addAchievementProgress(38, 5000)
	end

	local potion = potions[item:getId()]
	if potion.level and player:getLevel() < potion.level or potion.vocations and not isInArray(potion.vocations, player:getVocation():getId()) then
		player:say(potion.description, TALKTYPE_MONSTER_SAY)
		return true
	end
	
	if potion.health or potion.mana or potion.combat then
		if potion.health then
			doTargetCombatHealth(0, target, COMBAT_HEALING, potion.health[1], potion.health[2], CONST_ME_MAGIC_BLUE)
		end

		if potion.mana then
			doTargetCombatMana(0, target, potion.mana[1], potion.mana[2], CONST_ME_MAGIC_BLUE)
		end

		if potion.combat then
			potion.combat:execute(target, Variant(target:getId()))
		end

		target:say("Aaaah...", TALKTYPE_MONSTER_SAY)
		player:addItem(potion.flask, 1)
	end

	if potion.condition then
		player:addCondition(potion.condition)
		player:say(potion.text, TALKTYPE_MONSTER_SAY)
		player:getPosition():sendMagicEffect(potion.effect)
	end

	if potion.transform then
		item:transform(potion.transform.id[math.random(#potion.transform.id)])
		item:getPosition():sendMagicEffect(potion.effect)
		return true
	end
	if item.itemid == 7620 and player:getStorageValue(110097) < 13 then
		player:setStorageValue(110097, 1+ player:getStorageValue(110097))
		player:sendTextMessage(23, "Mana potiony zaczna sie konczyc po 15 uzyciach.")
		return true
	else
		item:remove(1)
		return true
	end
	
	if item.itemid == 7618 and player:getStorageValue(110096) < 8 then
		player:setStorageValue(110096, 1+ player:getStorageValue(110096))
		player:sendTextMessage(23, "Health otiony zaczna sie konczyc po 10 uzyciach.")
		return true
	else
		item:remove(1)
		return true
	end
	
	return true
end