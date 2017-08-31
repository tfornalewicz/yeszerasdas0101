function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local condition_f = createConditionObject(CONDITION_ATTRIBUTES)
	setConditionParam(condition_f, CONDITION_PARAM_SUBID, 6)
	setConditionParam(condition_f, CONDITION_PARAM_BUFF_SPELL, 1)
	setConditionParam(condition_f, CONDITION_PARAM_TICKS, 60 * 60 * 1000)
	setConditionParam(condition_f, CONDITION_PARAM_SKILL_FISHING, 20)
	setConditionParam(condition_f, CONDITION_PARAM_FORCEUPDATE, true)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Umiejetnosc lowienia zostala zwiekszona na godzine o 20 poziomow.")
	doAddCondition(player, condition_f)
	item:remove()
	return true
end