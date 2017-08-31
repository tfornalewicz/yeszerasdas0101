function onModalWindow(cid, modalWindowId, buttonId, choiceId, item, position, pos, toPosition, fromPosition, itemEx)
local player = Player(cid)
local config = {
	[1] = {female = 136, male = 128, nazwa = 'Citizen', male_jeden = {{5878, 100}}, male_dwa = {{2480, 1}, {5902, 50}, {5890, 100}},
	female_jeden = {{5878, 100}}, female_dwa = {{2480, 1}, {5902, 50}, {5890, 100}}},
	
	[2] = {female = 137, male = 129, nazwa = 'Hunter', male_jeden = {{5876, 100}, {5948, 100}, {5891, 5}, {5887, 1}, {5889, 1}, {5888, 1}}, male_dwa = {{5875,1}},
	female_jeden = {{5876, 100}, {5948, 100}, {5891, 5}, {5887, 1}, {5889, 1}, {5888, 1}}, female_dwa = {{5875,1}}},
	
	[3] = {female = 138, male = 130, nazwa = 'Mage', male_jeden = {{2182, 1}, {2186, 1},{2185, 1},{2181, 1},{2183, 1},{2190, 1},{2191, 1},{2188, 1},{2189, 1},{2187, 1},{2193, 20},{5809, 1},{5904, 10}}, male_dwa = {{5903, 1}},
	female_jeden = {{5958, 1}}, female_dwa = {{5894, 70},{5911, 20},{5883, 40},{5922, 35},{5881, 60},{5882, 40},{5905, 30},{5904, 15},{5886, 10}}},
	--
	[4] = {female = 139, male = 131, nazwa = 'Knight', male_jeden = {{5880, 100},{5892, 1}}, male_dwa = {{5893, 100},{5887, 1},{11422, 1},{5885, 1}},
	female_jeden = {{5880, 100},{5892, 1}}, female_dwa = {{5893, 100},{5887, 1},{11422, 1},{5885, 1}}},
	
	[5] = {female = 140, male = 132, nazwa = 'Noblewoman', male_jeden = {{2160, 15}}, male_dwa = {{2160, 15}},
	female_jeden = {{2160, 15}}, female_dwa = {{2160, 15}}},
	
	[6] = {female = 141, male = 133, nazwa = 'Summoner', male_jeden = {{5958, 1}}, male_dwa = {{5894, 70},{5911, 20},{5883, 40},{5922, 35},{5881, 60},{5882, 40},{5905, 30},{5904, 15},{5886, 10}},
	female_jeden = {{2182, 1}, {2186, 1},{2185, 1},{2181, 1},{2183, 1},{2190, 1},{2191, 1},{2188, 1},{2189, 1},{2187, 1},{2193, 20},{5809, 1},{5904, 10}}, female_dwa = {{5903, 1}}},
	
	[7] = {female = 142, male = 134, nazwa = 'Warrior', male_jeden = {{5925, 100}, {5899, 100}, {5919, 1}, {5884, 1}}, male_dwa = {{5880, 100}, {5887, 1}},
	female_jeden = {{5925, 100}, {5899, 100}, {5919, 1}, {5884, 1}}, female_dwa = {{5880, 100}, {5887, 1}}},
	
	[8] = {female = 147, male = 143, nazwa = 'Barbarian', male_jeden = {{5884, 1},{5885, 1}, {5911, 50}, {5910, 50}, {5886, 10}}, male_dwa = {{5880, 100},{5876, 50},{5893, 50}, {5892, 1}},
	female_jeden = {{5884, 1},{5885, 1}, {5911, 50}, {5910, 50}, {5886, 10}}, female_dwa = {{5880, 100},{5876, 50},{5893, 50}, {5892, 1}}},
	
	[9] = {female = 148, male = 144, nazwa = 'Druid', male_jeden = {{5896, 50}, {5897, 50}}, male_dwa = {{5906, 100},{5940, 1},{5937, 1},{5938, 1}},
	female_jeden = {{5896, 50}, {5897, 50}}, female_dwa = {{5906, 100},{5940, 1},{5937, 1},{5938, 1}}},
	
	[10] = {female = 149, male = 145, nazwa = 'Wizard', male_jeden = {{5922, 50}}, male_dwa = {{2536, 1}, {2492, 1}, {2488, 1}, {2123, 1}},
	female_jeden = {{5922, 50}}, female_dwa = {{2536, 1}, {2492, 1}, {2488, 1}, {2123, 1}}},
	
	[11] = {female = 150, male = 146, nazwa = 'Oriental', male_jeden = {{5945, 1}}, male_dwa = {{5883, 100}, {5895, 100}, {5912, 100}, {5891, 2}},
	female_jeden = {{5945, 1}}, female_dwa = {{5883, 100}, {5895, 100}, {5912, 100}, {5891, 2}}},
	
	[12] = {female = 156, male = 152, nazwa = 'Assassin', male_jeden = {{5910, 50}, {5912, 50}, {5886, 10}, {5909, 50}, {5913, 50}, {5914, 50}, {5911, 50}}, male_dwa = {{5930, 1}, {5804, 1}}, 
	female_jeden = {{5910, 50}, {5912, 50}, {5886, 10}, {5909, 50}, {5913, 50}, {5914, 50}, {5911, 50}}, female_dwa = {{5930, 1}, {5804, 1}}},
	
	[13] = {female = 155, male = 151, nazwa = 'Pirate', male_jeden = {{6098, 100}, {6126, 100}, {6097, 100}}, male_dwa = {{6101, 1}, {6102, 1}, {11425, 1}, {6099, 1}},
	female_jeden = {{6098, 100}, {6126, 100}, {6097, 100}}, female_dwa = {{6101, 1}, {6102, 1}, {11425, 1}, {6099, 1}}},
	
	[14] = {female = 157, male = 153, nazwa = 'Beggar', male_jeden = {{5913, 20}, {5878, 50}, {5894, 10}, {5921, 30}}, male_dwa = {{5883, 100}},
	female_jeden = {{5913, 20}, {5878, 50}, {5894, 10}, {5921, 30}}, female_dwa = {{5883, 100}}},
	
	[15] = {female = 158, male = 154, nazwa = 'Shaman', male_jeden = {{5810, 5}, {3955, 5}, {5015, 1}}, male_dwa = {{3966, 5}, {3967, 5}},
	female_jeden = {{5810, 5}, {3955, 5}, {5015, 1}}, female_dwa = {{3966, 5}, {3967, 5}}}
}
local plec = player:getSex()
local ktory = 0
	if (choiceId<200 and choiceId>100 ) then
		choiceId= choiceId- 100
		ktory = 1
	elseif (choiceId>200) then
		choiceId = choiceId- 200
		ktory = 2
	end
		local v = config[choiceId]
		local itemki =""
		
		if (plec == PLAYERSEX_FEMALE) and (ktory==1) then
			itemki= "female_jeden"			
		elseif (plec == PLAYERSEX_MALE) and (ktory==1) then
			itemki = "male_jeden"
		elseif (plec == PLAYERSEX_FEMALE) and (ktory==2) then
			itemki = "female_dwa"
		elseif (plec == PLAYERSEX_MALE) and (ktory==2) then
			itemki = "male_dwa"
		end




    if modalWindowId == 100 and buttonId == 3 then --pomoc
		player:showTextDialog(5903, "Mozesz wymienic odpowiednie przedmioty na dodatki do outfitow. Po wybraniu dodatku, kliknij przycisk pomoc, aby dowiedziec sie jakie przedmioty sa wymagane. Jezeli jeszcze nie jestes zdecydowany na dodatek, za 300gp przetestuj go. \n\nPo zdobyciu wszystkich dodatkow, otrzymasz ode mnie nagrode.")
   elseif modalWindowId == 100 and buttonId == 1 then --testuj	
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Opcja wylaczona.")
			return false
	elseif modalWindowId == 100 and buttonId == 2 then --wybierz		
		local looktypee = 100
		local modale = ModalWindow (101, "Addon", "Wybierz opcje dodatku ktory cie interesuje: ")	
			if (plec == PLAYERSEX_FEMALE) then
				looktypee= config[choiceId].female
			elseif (plec == PLAYERSEX_MALE) then
				looktypee= config[choiceId].male		
			end			
			if (player:hasOutfit(looktypee, 3))then
				return false
			elseif not (player:hasOutfit(looktypee, 1)) then
				modale:addChoice(choiceId+100, config[choiceId].nazwa.." -- (Pierwszy dodatek)")
				if not (player:hasOutfit(looktypee, 2)) then
					modale:addChoice(choiceId+200, config[choiceId].nazwa.." -- (Drugi dodatek)")
				end
			else
				modale:addChoice(choiceId+200, config[choiceId].nazwa.." -- (Drugi dodatek)")
			end
			
		modale:addButton(1, "Wybierz")
		modale:addButton(2, "Pomoc")	
		modale:addButton(3, "Anuluj")	
		modale:setDefaultEnterButton(2)
		modale:setDefaultEscapeButton(3)   
		modale:sendToPlayer(player)
		
		
	elseif modalWindowId == 101 and buttonId == 2 then --pomoc
				
		local text = ""				
		for i = 1, #v[itemki] do
			local itemType = ItemType(v[itemki][i][1])
			text = text .. (i ~= 1 and (i == #v[itemki] and "\n" or "\n") or "") .. (v[itemki][i][2] > 1 and v[itemki][i][2] or itemType:getArticle()) .. " " .. (v[itemki][i][2] > 1 and itemType:getPluralName() or itemType:getName())
		end		
		player:showTextDialog(1954, "Potrzebujesz: \n\n"..text)
	elseif modalWindowId == 101 and buttonId == 1 then
	
	for i = 1, #v[itemki] do
		if player:getItemCount(v[itemki][i][1]) < v[itemki][i][2] then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Nie masz wymaganych przedmiotow.")
			return false
		end
	end
	for i = 1, #v[itemki] do
		player:removeItem(unpack(v[itemki][i]))
	end
	--Mage i Summoner  3 i 6
	if (ktory == 2 and choiceId == 3 or choiceId ==6) then
		if(plec == PLAYERSEX_FEMALE) then
			player:addOutfitAddon(config[3].male, ktory)
			player:addOutfitAddon(v.female, ktory)			
			player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
			player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
		elseif (plec == PLAYERSEX_MALE) then
			player:addOutfitAddon(config[6].female, ktory)
			player:addOutfitAddon(v.male, ktory)			
			player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
			player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
		end
	else
		player:addOutfitAddon(v.male, ktory)
		player:addOutfitAddon(v.female, ktory)
		player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
		player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
	end
   return true
      end	
end