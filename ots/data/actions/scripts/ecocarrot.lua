local item_id = 18160 -- id skrzynki
function onUse(cid, item, fromPosition, target, toPosition, isHotkey)
	if  item_id == item.itemid
      and cid:getStorageValue(11038) < 1 
      and item.uid == 11038 
  then -- Nie trzeba aktywnego questa, ale tlyko raz mozna wziac
		cid:setStorageValue(11038,1)
        cid:addItem(2362,1) -- Dostaje eco marchewke
    end
	return true
end
