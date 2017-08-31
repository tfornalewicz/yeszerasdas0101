dofile('data/weekly.lua')


function onUse(cid, item, fromPosition, target, toPosition, isHotkey)
local player = Player(cid)

local modal = ModalWindow (400, "Ogloszenia", "Wybierz interesujace cie ogloszenie: ")
    for i = 1, #qconfig do 
        if player:getStorageValue(400+qconfig[i].questid) < 1 and (os.time() > qconfig[i].startdate and os.time() < qconfig[i].enddate) then            modal:addChoice(i, qconfig[i].name ..' (' ..qconfig[i].required ..')')
        end
    end
    modal:addButton(1,"Biore")
    modal:addButton(3,"Pomoc")
    modal:addButton(2,"Anuluj")
    modal:setDefaultEnterButton(3)
    modal:setDefaultEscapeButton(2)
    modal:sendToPlayer(player)


	return false
end


-- local function creatureSayCallback(cid, type, msg)b
-- 	if not npcHandler:isFocused(cid) then
-- 		return false
-- 	end
-- 	local player = Player(cid)
-- 	local activeTasks =  false
-- 	if (player:getStorageValue(291) > 0 and player:getStorageValue(292) > 0 and player:getStorageValue(293) > 0) then
-- 		activeTasks = true
-- 	end
	
-- 	if isInArray({"task", "taski", "wez", "biore", "tasks", "zadania", "zadanie", "Bierzesz"}, msg) then
-- 		if not (player:getStorageValue(200) >= 0) then --first time talk
-- 			player:setStorageValue(200, 0)
-- 		end
-- 		local modal = ModalWindow (200, "Taski", "Wybierz interesujace cie zadanie: ")
-- 		if not (activeTasks) then
-- 			for i = 1, #qconfig do
-- 				if not (player:getStorageValue(291) == i or player:getStorageValue(292) == i or player:getStorageValue(293) == i or i == 6 or i == 2) then 
-- 					modal:addChoice(i, qconfig[i].name ..' (' ..qconfig[i].killsRequired ..')')
-- 				end
-- 			end 
		
-- 			modal:addButton(1, "Biore")
-- 			modal:addButton(3, "Pomoc")	
-- 			modal:addButton(2, "Anuluj")	
-- 			modal:setDefaultEnterButton(3)
-- 			modal:setDefaultEscapeButton(2)   
-- 			modal:sendToPlayer(player)
-- 			npcHandler:say("Powodzenia!", cid)
-- 			npcHandler:releaseFocus(cid)
-- 			npcHandler:resetNpc(cid)
-- 		else
-- 			npcHandler:say("Posiadasz 3 aktywne zadania. {Anuluj} je, aby wziac nowe.", cid)
-- 		end
-- 	elseif isInArray({"zakoncz", "koniec", "cancel", "anuluj", "Zakoncz"}, msg) then
-- 		if (player:getStorageValue(291) > 0 or player:getStorageValue(292) > 0 or player:getStorageValue(293) > 0) then
-- 			local modal = ModalWindow (200, "Taski", "Anuluj wybrane zadanie lub ESC:")
-- 			--modal do zakonczenia zadan
-- 			if (player:getStorageValue(291) > 0) then 
-- 				modal:addChoice(player:getStorageValue(291), qconfig[player:getStorageValue(291)].name)
-- 			end 
-- 			if (player:getStorageValue(292) > 0) then 
-- 				modal:addChoice(player:getStorageValue(292), qconfig[player:getStorageValue(292)].name)
-- 			end 
-- 			if (player:getStorageValue(293) > 0) then 
-- 				modal:addChoice(player:getStorageValue(293), qconfig[player:getStorageValue(293)].name)
-- 			end 
		
-- 			modal:addButton(24, "Anuluj")
-- 			modal:setDefaultEnterButton(1)
-- 			modal:setDefaultEscapeButton(2)   
-- 			modal:sendToPlayer(player)
-- 			npcHandler:say("No to elo!", cid)
-- 			npcHandler:releaseFocus(cid)
-- 			npcHandler:resetNpc(cid)
-- 		else
-- 			npcHandler:say("Nie masz aktywnych zadan. Zapytaj mnie o {taski}, aby rozpoczac zadanie.", cid)
-- 		end
-- 	end
		
-- end
-- npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
-- npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
-- npcHandler:addModule(FocusModule:new())