
function onModalWindow(cid, modalWindowId, buttonId, choiceId, item, position, pos, toPosition, fromPosition, itemEx)
local player = Player(cid)
	
	if (modalWindowId == 20 and buttonId == 2 or modalWindowId ~= 20) then --cancel button
		return true
	end
	
	if (choiceId == 2 and buttonId == 1) then -- change status server- open/close
		if (Game.getGameState() == GAME_STATE_CLOSED) then 
			Game.setGameState(GAME_STATE_NORMAL)
			player:sendTextMessage(32, "Serwer zostal otwarty.")
		elseif (Game.getGameState() == GAME_STATE_NORMAL) then
			Game.setGameState(GAME_STATE_CLOSED)
			player:sendTextMessage(32, "Serwer zostal zamkniety.")
		else
			player:sendCancelMessage("Cos poszlo nie tak. Sprobuj jeszcze raz za chwilke.")
		end
	elseif (choiceId == 1 and buttonId == 1) then -- change pvp
		if (Game.getWorldType() == WORLD_TYPE_NO_PVP) then 
			Game.setWorldType(WORLD_TYPE_PVP)
			player:sendTextMessage(32, "PVP zostalo wlaczone.")
		elseif (Game.getWorldType() == WORLD_TYPE_PVP) then
			Game.setWorldType(WORLD_TYPE_NO_PVP)
			player:sendTextMessage(32, "PVP zostalo wylaczone.")
		else
			player:sendCancelMessage("Cos poszlo nie tak. Sprobuj jeszcze raz za chwilke.")
		end
	elseif (choiceId == 3 and buttonId == 1) then -- change exp rate window
		local modal = ModalWindow (20, "Manage server", "Zarzadzanie serwerem:\n(Exp rate) ")
		modal:addChoice(10, "Zwieksz o jeden")
		modal:addChoice(20, "Podwojny exp(+100%)")
		modal:addChoice(30, "Wyzeruj bonus")
		modal:addButton(1, "Ustaw")
		modal:addButton(2, "Anuluj")
		modal:sendToPlayer(player)
	elseif (choiceId == 10 and buttonId == 1) then -- add +1 rate exp
		local expRate = configManager.getNumber(configKeys.RATE_EXPERIENCE)
		local bonusExpRate = getGlobalStorageValue(1)
		if bonusExpRate > 0 then
			setGlobalStorageValue(1, bonusExpRate+1)
		else
			setGlobalStorageValue(1, 1)
		end
		player:sendTextMessage(32, "Exp rate zostal zwiekszony o 1.")
	elseif (choiceId == 20 and buttonId == 1) then -- add +100% rate exp
		local expRate = configManager.getNumber(configKeys.RATE_EXPERIENCE)
		setGlobalStorageValue(1, expRate)
		player:sendTextMessage(32, "Exp rate zostal podwojony")
	elseif (choiceId == 30 and buttonId == 1) then -- remove bonus exp
		setGlobalStorageValue(1, 0)
		player:sendTextMessage(32, "Exp bonus zostal ustawiony na 0.")
	elseif (choiceId == 4 and buttonId == 1) then -- change loot rate window
		local modal = ModalWindow (20, "Manage server", "Zarzadzanie serwerem:\n(Loot rate) ")
		modal:addChoice(11, "Zwieksz o jeden")
		modal:addChoice(21, "Podwojny Loot(+100%)")
		modal:addChoice(31, "Wyzeruj bonus")
		modal:addButton(1, "Ustaw")
		modal:addButton(2, "Anuluj")
		modal:sendToPlayer(player)
	elseif (choiceId == 11 and buttonId == 1) then -- add +1 rate loot
		local lootRate = configManager.getNumber(configKeys.RATE_LOOT)
		local bonusLootRate = getSuperGlobalStorageValue(2)
		if bonusLootRate > 0 then
			setSuperGlobalStorageValue(2, bonusLootRate+1)
		else
			setSuperGlobalStorageValue(2, 1)
		end
		player:sendTextMessage(31, "Loot rate zostal zwiekszony o 1.")
	elseif (choiceId == 21 and buttonId == 1) then -- add +100% rate loot
		local lootRate = configManager.getNumber(configKeys.RATE_LOOT)
		setSuperGlobalStorageValue(2, lootRate)
		player:sendTextMessage(32, "Loot rate zostal podwojony")
	elseif (choiceId == 31 and buttonId == 1) then -- remove bonus loot
		setSuperGlobalStorageValue(2, 0)
		player:sendTextMessage(32, "Loot bonus zostal ustawiony na 0.")
	end
	return true
end