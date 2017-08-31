local events = {
    'PlayerDeath',
    'AdvanceSave',
    'DropLoot',
    'BossParticipation',
    'DeathCounter',
    'KillCounter',
    'bless',
	'addon',
	'ships',
	'tasks',
	'weekly',
	'TasksCounter',
	'manage',
	'ArenaTp',
	'knightWeapons',
	'tp_save',
	'modalMD1',
	'bless1',
	'Recompense',
	'lowerRoshamuul',
	'VibrantEgg',
	'InquisitionBosses',
	'BigfootBurdenVersperoth',
	'BigfootBurdenWarzone',
	'BigfootBurdenWeeper',
	'BigfootBurdenWiggler',
	'BigfootBurdenBosses',
	'ElementalSpheresOverlords',
	'InquisitionUngreez',
	'ShattererKill',
	'PlagirathKill',
	'ZamuloshKill',
	'MazoranKill',
	'RazzagornKill',
	'RagiazKill',
	'TarbazKill',
	'ShulgraxKill',
	'FerumbrasMortalKill'
}

local function onMovementRemoveProtection(cid, oldPosition, time)
	local player = Player(cid)
	if not player then
		return true
	end

	local playerPosition = player:getPosition()
	if (playerPosition.x ~= oldPosition.x or playerPosition.y ~= oldPosition.y or playerPosition.z ~= oldPosition.z) or player:getTarget() then
		player:setStorageValue(Storage.combatProtectionStorage, 0)
		return true
	end

	addEvent(onMovementRemoveProtection, 1000, cid, oldPosition, time - 1)
end

function onLogin(player)
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. " Ubierz sie jak Ci sie podoba."
		player:sendOutfitWindow()
    	local configMarks = {
			{mark = "tools", position = Position(5864, 1559, 7), markId = MAPMARK_SHOVEL, description = "Sklep z narzedziami"},
			{mark = "fluids", position = Position(5870, 1555, 7), markId = MAPMARK_STAR, description = "Zaopatrzenie magiczne"},
			{mark = "depo", position = Position(5889, 1558, 7), markId = MAPMARK_LOCK, description = "Depo"},
			{mark = "post", position = Position(5898, 1556, 6), markId = MAPMARK_FLAG, description = "Poczta"},
			{mark = "arm", position = Position(5853, 1558, 7), markId = MAPMARK_SWORD, description = "Skup uzbrojenia"},
			{mark = "jewelry", position = Position(5848, 1574, 7), markId = MAPMARK_KISS, description = "Jubiler"},
			{mark = "creatureproducts", position = Position(5838, 1575, 7), markId = MAPMARK_BAG, description = "Sprzedaz creatureproducts"},
			{mark = "paladinshop", position = Position(5864, 1577, 7), markId = MAPMARK_BAG, description = "Zaopatrzenie dla lucznikow"},
			{mark = "bank", position = Position(5893, 1558, 9), markId = MAPMARK_DOLLAR, description = "Bank"},
			{mark = "shophouse", position = Position(5842, 1560, 7), markId = MAPMARK_TICK, description = "Wyposazenie domu"},
			{mark = "food", position = Position(5874, 1576, 7), markId = MAPMARK_TICK, description = "Sklep z jedzeniem"},
			{mark = "komisarz", position = Position(5849, 1609, 7), markId = MAPMARK_TICK, description = "Komisarz Ryba"},
			{mark = "statue", position = Position(5824, 1514, 7), markId = MAPMARK_SWORD, description = "Trening offline"},
		}

		for i = 1, #configMarks do
			mark = configMarks[i]
			player:addMapMark(mark.position, mark.markId, mark.description)
		end		
	else
		if loginStr ~= "" then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end

		loginStr = string.format("Twoja ostatnia wizyta byla %s.", os.date("%d-%m-%Y %X", player:getLastLoginSaved()))
	end
	player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)

	if (player:getStorageValue(10100) > 1) and os.date('%A') ~= "Sunday" then
	local count = 0
		if player:getStorageValue(10100) < 100 then
			count = 2
		elseif player:getStorageValue(10100) < 500 then
			count = 4
		elseif player:getStorageValue(10100) < 1000 then
			count = 6
		elseif player:getStorageValue(10100) < 5000 then
			count = 12
		elseif player:getStorageValue(10100) < 11510 then
			count = 18
		elseif player:getStorageValue(10100) > 11510 then
			count = 20
			player:addItem(2113)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Otrzymujesz nagrode glowna.")
		end
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Otrzymujesz "..count.." tibia coins za event wedkarski.")
		-- db.query('UPDATE accounts SET premium_points = 0 WHERE id = ' .. getAccountNumberByPlayerName(getCreatureName(player)))
		doPlayerAddPremiumPoints(player, count)
		doSendMagicEffect(getCreaturePosition(player), 28)
		player:showTextDialog(2667, "Event Wedkarski \n\n1 miejsce- Atomowy Janusz(11816 pkt)\n2 miejsce- Bolec(11755pkt)\n3 miejsce- Buazen(11513pkt)\n\nTwoj wynik to: "..player:getStorageValue(10100)..".")
		player:setStorageValue(10100, -1)
	end
	
	local playerId = player:getId()

	-- Stamina
	nextUseStaminaTime[playerId] = 1

	-- EXP Stamina
	nextUseXpStamina[playerId] = 1

	--Prey Stamina
	nextUseStaminaPrey[playerId+1] = {Time = 1}
	nextUseStaminaPrey[playerId+2] = {Time = 1}
	nextUseStaminaPrey[playerId+3] = {Time = 1}

	-- Prey Data
	if (player:getVocation():getId() ~= 0) then
		local columnUnlocked = getUnlockedColumn(player)
		if (not columnUnlocked) then
			columnUnlocked = 0
		end

		for i = 0, columnUnlocked do
			sendPreyData(player, i)
		end
	end

	-- SPECIAL EVENTS
	--[[
		-- STAMINA DUE TO FALLS START
		local stamina_full = 42 * 60 -- config. 42 = horas
		if player:getStamina() >= stamina_full then
			player:sendCancelMessage("Your stamina is already full.")
		elseif player:getPremiumDays() < 1 then
			player:sendCancelMessage("You must have a premium account.")
		else
			player:setStamina(stamina_full)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "Your stamina has been refilled.")
		end
		-- Promotion
		local vocation = player:getVocation()
		local promotion = vocation:getPromotion()
		if player:isPremium() then
			local value = player:getStorageValue(Storage.Promotion)
			if not promotion and value ~= 1 then
				player:setStorageValue(Storage.Promotion, 1)
			elseif value == 1 then
				player:setVocation(promotion)
			end
		elseif not promotion then
			player:setVocation(vocation:getDemotion())
		end
	]]

	if player:getStorageValue(11019) < 1 then -- quest dla poczatkujacych
		player:setStorageValue(11019,1) -- ustawienie, zeby questlog sie zaktualizowal
	end

	local guild = player:getGuild()
	if guild ~= nil then
		player:addAchievement(31)
	end

	-- OPEN CHANNERLS (ABRIR CHANNELS)
	if table.contains({"Rookgaard", "Dawnport"}, player:getTown():getName())then
		--player:openChannel(7) -- help channel
		player:openChannel(3) -- world chat
		player:openChannel(6) -- advertsing rook main
	else
		--player:openChannel(7) -- help channel
		player:openChannel(3) -- world chat
		player:openChannel(5) -- advertsing main
	end

	-- Rewards
	local rewards = #player:getRewardList()
	if(rewards > 0) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You have %d %s in your reward chest.", rewards, rewards > 1 and "rewards" or "reward"))
	end

	-- Update player id
	local stats = player:inBossFight()
	if stats then
		stats.playerId = player:getId()
	end

	-- fury gates
	if Game.getStorageValue(GlobalStorage.FuryGates, (9710)) == 1 then -- for venore
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Fury Gate is on Venore Today.')
	elseif Game.getStorageValue(GlobalStorage.FuryGates, (9711)) == 2 then -- for ab...
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Fury Gate is on Abdendriel Today.')
	elseif Game.getStorageValue(GlobalStorage.FuryGates, (9712)) == 3 then -- for ab...
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Fury Gate is on Thais Today.')
	elseif Game.getStorageValue(GlobalStorage.FuryGates, (9713)) == 4 then -- for ab...
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Fury Gate is on Carlin Today.')
	elseif Game.getStorageValue(GlobalStorage.FuryGates, (9714)) == 5 then -- for ab...
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Fury Gate is on Edron Today.')
	elseif Game.getStorageValue(GlobalStorage.FuryGates, (9716)) == 6 then -- for ab...
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Fury Gate is on Kazordoon Today.')
	end

	player:sendTextMessage(messageType or MESSAGE_STATUS_CONSOLE_ORANGE, 'Welcome to OTXServer Global!')
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, '[BUGS?] http://www.github.com/malucooo/otxserver-new/issues')
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, '[GUILD LEADER COMMAND] Will change all outfits from members !outfit.')

	-- Events
	for i = 1, #events do
		player:registerEvent(events[i])
	end

	if player:getStorageValue(Storage.combatProtectionStorage) <= os.time() then
		player:setStorageValue(Storage.combatProtectionStorage, os.time() + 10)
		onMovementRemoveProtection(playerId, player:getPosition(), 10)
	end

	return true
end