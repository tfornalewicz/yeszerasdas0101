function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if (target == nil) or not target:isItem() then
        return false
    end
	if player:getStorageValue(Storage.MeadVial) >= os.time() then
	player:say("Ehh, juz jest pusta.", TALKTYPE_MONSTER_SAY)
	return false
	end
    if (target:getActionId() == 8000) then
	item:remove()
	player:addItem(2006, 43)
	player:setStorageValue(Storage.MeadVial, os.time() + 22 * 3600)
	toPosition:sendMagicEffect(CONST_ME_BLOCKHIT)
    end
    return true
end