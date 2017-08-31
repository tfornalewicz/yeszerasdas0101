dofile('data/tasks.lua')

function onModalWindow(cid, modalWindowId, buttonId, choiceId, item, position, pos, toPosition, fromPosition, itemEx)
local player = Player(cid)
	
	if (modalWindowId == 200 and buttonId == 2) or choiceId > 200 then --cancel button
		return true	
	elseif (modalWindowId == 200 and buttonId == 3) then --help button
		player:showTextDialog(7397, "Za wykonywanie taskow dostajesz nagrody w postaci: expa, pieniedzy, osiagniec do CV oraz mozliwosci walki z bossami.\n\nGracz moze miec aktywne 3 zadania na raz.")
		return true
	elseif (modalWindowId == 200 and buttonId == 1) then --select button
		if player:getStorageValue(291) < 1 then
			player:setStorageValue(291, choiceId) --save active task
		elseif player:getStorageValue(292) < 1 then
			player:setStorageValue(292, choiceId) --save active task
		elseif player:getStorageValue(293) < 1 then
			player:setStorageValue(293, choiceId) --save active task
		else
			player:say("Blad 653, skontaktuj sie z adminem!", TALKTYPE_MONSTER_SAY)
			return false
		end
		player:setStorageValue(modalWindowId+choiceId, 0)
	elseif (modalWindowId == 200 and buttonId == 24) then
		player:setStorageValue(200+choiceId, -1) --reset
		if player:getStorageValue(291) == choiceId then
			player:setStorageValue(291, -1) --save active task
		elseif player:getStorageValue(292) == choiceId then
			player:setStorageValue(292, -1) --save active task
		elseif player:getStorageValue(293) == choiceId then
			player:setStorageValue(293, -1) --save active task
		end
	end
	return true
end