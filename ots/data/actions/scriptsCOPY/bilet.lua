-- === REV: 01        DATE: 26 Jan 2017     By: W     Tag: Q1*
local item_id = 7608 -- id namiotu
function onUse(cid, item, fromPosition, target, toPosition, isHotkey)
	if  item_id == item.itemid
      and cid:getStorageValue(11041) == 1 
      and item.uid == 11041 
  then 
		cid:setStorageValue(11041,2)
    cid:addItem(26389, 1) -- dostaje bilet
  else
    doCreatureSay(cid, 'Nic tam nie ma!', TALKTYPE_ORANGE_1) -- no i jesli ktos probuje skipowac za bardzo
	end
	return true
end
