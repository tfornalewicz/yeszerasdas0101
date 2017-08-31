-- === REV: 01        DATE: 26 Jan 2017     By: W     Tag: Q1*
function onUse(cid, item, fromPosition, target, toPosition, isHotkey)
	if  
      cid:getStorageValue(11041) == 3 
  then  
    if item.uid == 11042 then
        toPosition.x = 5639
        toPosition.y = 1423
        toPosition.z = 7
    elseif item.uid == 11043 then
        toPosition.x = 5749
        toPosition.y = 1377
        toPosition.z = 7
    end
        fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		cid:teleportTo(toPosition, false)
		toPosition:sendMagicEffect(CONST_ME_TELEPORT)
  else
    doCreatureSay(cid, 'To nie twoja lodka!', TALKTYPE_ORANGE_1) 
	end
	return true
end
