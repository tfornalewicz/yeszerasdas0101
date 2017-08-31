local jaul_corpses = {15220 ,15221, 15222, 15223} -- id corpsow jaula
function onUse(cid, item, fromPosition, target, toPosition, isHotkey)
	if isInArray(jaul_corpses, target.itemid) and cid:getStorageValue(23083) == 1 then -- tylko raz mozna to zrobic i gdy aktywowany
		cid:setStorageValue(23083,2)
    cid:addItem(ItemType(15621):getId(), 1) -- dostaje guowe
    doCreatureSay(cid, 'krew trysnela po ucieciu mu glowy', TALKTYPE_ORANGE_1)
  else
    doCreatureSay(cid, 'Nie ma juz co ucinac!', TALKTYPE_ORANGE_1)
	end
	return true
end
