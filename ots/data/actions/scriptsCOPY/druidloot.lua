function onUse(cid, item, fromPosition, target, toPosition, isHotkey)
    if (item.itemid == 5078 or item.itemid == 5079 or item.itemid == 5076 or item.itemid == 5077) then
        if cid:getStorageValue(11063) < 1 and cid:getStorageValue(11007) > 3 then
            cid:addItem(5938,1) -- dostaje wode
            cid:setStorageValue(11063,1) -- lock wody
            toPosition:sendMagicEffect(34)
        else
            if cid:getStorageValue(11007) < 4 then
                doCreatureSay(cid, 'Nie jestes godzien wziac swietej wody!', TALKTYPE_ORANGE_1) 
            else
                doCreatureSay(cid, 'Nie mozesz juz wziac wiecej ze swietego zrodla!', TALKTYPE_ORANGE_1) 
            end
        end
    elseif item.itemid == 5659 then
        if cid:getStorageValue(11064) < 1 and cid:getStorageValue(11007) > 5 then
            cid:addItem(5937,1) -- dostaje kwiat
            cid:setStorageValue(11064,1) -- lock kwiatu
            toPosition:sendMagicEffect(47)
        else
            if cid:getStorageValue(11007) < 6 then
                doCreatureSay(cid, 'Nie jestes godzien wziac swietego kwiatu!', TALKTYPE_ORANGE_1) 
            else
                doCreatureSay(cid, 'Nie mozesz juz wziac wiecej ze swietego kwiatu!', TALKTYPE_ORANGE_1) 
            end
        end
    end
	return true
end
