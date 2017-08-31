local crate_id = 7707 -- id skrzynki
function onUse(cid, item, fromPosition, target, toPosition, isHotkey)
	if  crate_id == item.itemid
      and cid:getStorageValue(11036) < 1 
      and item.uid == 11035 
  then -- Nie trzeba aktywnego questa, ale tlyko raz mozna wziac
		cid:setStorageValue(11036,1)
        cid:addItem(26385,1) -- Dostaje liste
  else
    doCreatureSay(cid, 'Skrzynia jest pusta!', TALKTYPE_ORANGE_1) -- no i jesli ktos probuje skipowac za bardzo
	end
	return true
end
