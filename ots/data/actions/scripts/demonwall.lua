function onUse(cid, item, frompos, item2, topos)
gatepos = {x=5741, y=1420, z=12, stackpos=1}
getgate = getThingfromPos(gatepos)
 
if item.uid == 2004 and item.itemid == 1945 and getgate.itemid == 1498 then
doRemoveItem(getgate.uid,1)
doTransformItem(item.uid,item.itemid+1)
Position(gatepos):sendMagicEffect(CONST_ME_FIREAREA)
elseif item.uid == 2004 and item.itemid == 1946 and getgate.itemid == 0 then
doCreateItem(1498,1,gatepos)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry, not possible.")
end
return 1
end