dofile('data/weekly.lua')

function onModalWindow(cid, modalWindowId, buttonId, choiceId, item, position, pos, toPosition, fromPosition, itemEx)
local player = Player(cid)
	print("jestem w srodku")
	if (modalWindowId == 400 and buttonId == 2) then --cancel button
		return true	
	elseif (modalWindowId == 400 and buttonId == 3) then --help button
		player:showTextDialog(5905, "Za wykonywanie zadan z ogloszen dostajesz nagrody w postaci: expa, pieniedzy oraz tibia coinow.\n\n Po nagode zglos sie do Pani Burmistrz.")
		return true
	elseif (modalWindowId == 400 and buttonId == 1) then --select button
        if player:getStorageValue(400 + qconfig[choiceId].questid) < 1 then
            player:setStorageValue(400 + qconfig[choiceId].questid,1)
			local book = doPlayerAddItem(cid, 1949, 1)
			doSetItemText(book, qconfig[choiceId].desc .. "\n\nZaplata w wysokosci " ..qconfig[choiceId].money .." gp oraz ".. qconfig[choiceId].tc .. " tibia coin!")
		else
			player:say("Blad 2137, skontaktuj sie z adminem!", TALKTYPE_MONSTER_SAY)
			return false
		end
    end
		-- player:setStorageValue(modalWindowId+choiceId, 0)
	-- elseif (modalWindowId == 400 and buttonId == 24) then
	-- 	player:setStorageValue(200+choiceId, -1) --reset
	-- 	if player:getStorageValue(291) == choiceId then
	-- 		player:setStorageValue(291, -1) --save active task
	-- 	elseif player:getStorageValue(292) == choiceId then
	-- 		player:setStorageValue(292, -1) --save active task
	-- 	elseif player:getStorageValue(293) == choiceId then
	-- 		player:setStorageValue(293, -1) --save active task
	-- 	end
	return true
end