local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function onPlayerEndTrade(cid) npcHandler:onPlayerEndTrade(cid) end
function onPlayerCloseChannel(cid) npcHandler:onPlayerCloseChannel(cid) end

local voices = {
	{text = 'Naprawie twoje soft bootsy, bez obaw beda jak nowe'},
	{text = 'Piekna wiosna, wszystko kwitnie, piechurzy wracaja z pierwszych polowan..'},
	{text = 'Slyszalam , ze pierwsze wyprawy po magiczne buty zakonczyly sie pomyslnie'},
	{text = 'Tylko czekac az ktos przyniesie buty do regeneracji...'} }

npcHandler:addModule(VoiceModule:new(voices))	
	
local function creatureSayCallback(cid, type, msg)

	if not npcHandler:isFocused(cid) then
		return false
	end
   
	local player = Player(cid)

-- wymiana turbanow, red robe i green tunicow == 29/04/17
	if (msgcontains(msg,"yes") or msgcontains(msg,"tak")) and npcHandler.topic[cid] > 2 then
		if npcHandler.topic[cid] == 3 then
			player:addItem(5912,player:getItemCount(2663)) -- daje niebieskie szmatki
			player:removeItem(2663,player:getItemCount(2663)) -- zabiera mystic turbany
			selfSay('Oto twoja zaplata',cid)
		elseif npcHandler.topic[cid] == 4 then
			player:addItem(5911,player:getItemCount(2655)) -- daje czerwone szmatki			
			player:removeItem(2655,player:getItemCount(2655)) -- zabiera red roby
			selfSay('Oto twoja zaplata',cid)
		elseif npcHandler.topic[cid] == 5 then
			player:addItem(5910,1) -- daje zielone szmatki			
			player:removeItem(2652,10) -- zabiera green tunici
			selfSay('To dla ciebie robie tylko z czystej sympatii.',cid)
		end
	elseif msgcontains(msg,"mystic turban") and player:getStorageValue(11048) == 2 and player:getItemCount(2663) > 0 then 
		selfSay('Chcesz zamienic wszystkie mystic turbany na niebieskie szmatki?',cid)
		npcHandler.topic[cid] = 3
	elseif msgcontains(msg,"red robe") and player:getStorageValue(11048) == 2 and player:getItemCount(2655) > 0 then 
		selfSay('Chcesz zamienic wszystkie red roby na czerwone szmatki?',cid)
		npcHandler.topic[cid] = 4
	elseif msgcontains(msg,"green tunic") and player:getStorageValue(11048) == 2 then
		if player:getItemCount(2652) > 9 then
			selfSay('Green tunic to slaby material, ale za 10 z nich dam ci 1 zielona szmatke. Dobra?',cid)
		    npcHandler.topic[cid] = 5
		else
			selfSay('Potrzebujesz przynajmniej 10 green tunicow.',cid)
		end
-- wymiana turbanow, red robe i green tunicow == 29/04/17

	elseif isInArray({"soft boots"}, msg) then
		npcHandler:say("Chcesz zamienic worn {soft boots}? Koszt przywrocenia tych butow do stanu uzywalnosci to 10k.", cid)
		npcHandler.topic[cid] = 1
	elseif isInArray({"yes", "tak"}, msg) and npcHandler.topic[cid] == 1 then
		if player:getItemCount(10021) > 0 then
			if player:removeMoney(10000) then
				player:removeItem(10021, 1)
				player:addItem(6132, 1)
				npcHandler:say("Prosze bardzo, oto Twoje buty.", cid)
			else
				npcHandler:say("Zglupiales? Za darmo ja nie pracuje!", cid)
			end
		else
			npcHandler:say("Wybacz, ale nie masz zuzytych butow. Tylko worn {soft boots} moge naprawic.", cid)
		end
		npcHandler.topic[cid] = 0
	elseif isInArray({"no", "nie"}, msg ) and npcHandler.topic[cid] == 1 then
		npcHandler:say("Nie to nie, spadaj!", cid)
		npcHandler.topic[cid] = 0
	end
-- ============ DO 1 MISJI YALAHARI QUESTA =============
   if (msgcontains(msg, "zaproszenie") or msgcontains(msg, "ariel")) and player:getStorageValue(11002) == 1 then
		if player:getItemCount(26382) > 0 then
		 	player:removeItem(26382,1)
			player:setStorageValue(11002, 2)
			selfSay('Ariel? Ten co mieszka w ten smiesznej chatce na zachodzie? Tym razem wyslal ciebie?', cid)
			selfSay('Przekaz mu, Ze nie pojde z nim na impreze. Od tygodnia nic sie nie zmienilo w moich planach', cid)
			npcHandler.topic[cid] = 1
       end        
   end
	if (msgcontains(msg, "ariel") or msgcontains(msg, "mission") or msgcontains(msg, "zaproszenie")) and player:getStorageValue(11002) == 7 then
		player:setStorageValue(11002, 8)
		selfSay('Zaproszenie na impreze od mojego ukochanego Ariela? Oczywiscie, ze pojde. Przekaz mu, zeby byl po mnie o 18.', cid)
		npcHandler.topic[cid] = 1
	end
	
	if (msgcontains(msg, "wino") or msgcontains(msg, "mission")) and player:getStorageValue(11002) == 6 and player:getStorageValue(11004) == 1 then
		-- jesli po misji od postmna -- jesli po zebraniu wlosa -- i jesli mamy akurat winiaka przy sobie
		if player:getItemCount(26383) > 0 then
			player:removeItem(26383,1)
			player:setStorageValue(11002, 7)
			selfSay('Ahh, uwielbiam te egzotyczne paczki od Old Postmana, skosztuje od razu na miejscu.',cid)
			selfSay('Arrrgh, ohydne, przekaz Old Postmanowi, zeby nie zamawial tego wiecej.', cid)
			npcHandler.topic[cid] = 1
		end                                                      
	end
-- ============ DO 1 MISJI YALAHARI QUESTA =============  
-- ============ DO MISJI TRUDNE POCZATKI =============
   if (msgcontains(msg, "pomoc")) and player:getStorageValue(11019) > 0 and player:getStorageValue(11024) < 1 then
        player:setStorageValue(11024,1) -- lockujemy Malkin jako wykonanego
        player:setStorageValue(11019,player:getStorageValue(11019) + 1) -- +1 zeby kolejnosc nie miala znaczenia
        selfSay('Nie potrzebuje pomocy akurat, ale jakbys mi przyniosl po 1 szmatce kazdego koloru to sie na pewno odwdziecze', cid)
-- ============ DO MISJI TRUDNE POCZATKI ============= 24/04/17
	elseif (msgcontains(msg,"naszyjnik") and player:getStorageValue(11033) == 2 and player:getItemCount(11113) > 19) then
   		player:setStorageValue(11033,3)
		player:removeItem(11113,20) -- zabieramy 20 zembuf orkuf
		player:addItem(26384,1) -- dostaje naszyjnik
		selfSay('Ooo, dla Arniego? Pewnie, on jest taki przystojny. Jeszcze popsikam swoimi perfumami. Pozdrow go odemnie i trzymaj naszyjnik.',cid)
-- ============ DO MISJI TRUDNE POCZATKI ============= 24/04/17
-- ============ MISJA ZE SZMATKAMI ============= 29/04/17
   elseif (msgcontains(msg,"mission") or msgcontains(msg,"misja") or msgcontains(msg,"tkaniny")) and player:getStorageValue(11048) == 1 then
   		if player:getItemCount(5909) > 0 and -- white 
		   player:getItemCount(5910) > 0 and -- green
		   player:getItemCount(5911) > 0 and -- red
		   player:getItemCount(5912) > 0 and -- blue
		   player:getItemCount(5913) > 0 and -- brown
		   player:getItemCount(5914) > 0  -- yellow
		then
			selfSay('Dziekuje ci, moze nie sa najlepszej jakosci, ale wkoncu jestem Madame Malkin.',cid)
			player:setStorageValue(11048,2) -- konczymy questa
			-- Q5.1
			player:addExperience(30000,true) -- 30k expa
			-- Q5.1
			player:removeItem(5909,1) -- white
			player:removeItem(5910,1) -- green
			player:removeItem(5911,1) -- red
			player:removeItem(5912,1) -- blue
			player:removeItem(5913,1) -- brown
			player:removeItem(5914,1) -- yellow
		else
			selfSay('Nie mam czasu pamietac, ktore przyniosles, a ktore nie. Przynies mi wszystkie na raz',cid)
		end
   elseif (msgcontains(msg,"yes") or msgcontains(msg,"tak")) and npcHandler.topic[cid] == 2 then
   		selfSay('Super, to czekam w takim razie na ciebie tam gdzie zwykle.',cid)
		player:setStorageValue(11048,1) -- ustaw questa
   elseif (msgcontains(msg,"mystic turban") or msgcontains(msg,"red robe") or msgcontains(msg,"green tunic")) and player:getStorageValue(11030) == 6 and player:getStorageValue(11048) < 1 then
   		selfSay('Nie sprzedaje takiego czegos, to ponizej mojej godnosci. Z takich ubran mozna z 2 ladne kawalki tkanin zrobic.',cid)
		selfSay('Takze jak przyniesiesz mi jakis to moge ci dac jeden kawalek w zamian.',cid)
		selfSay('Ale najpierw musisz mi przyniesc po jednym kawalku z kazdego koloru tkaniny, idziesz na taki uklad?',cid)
		npcHandler.topic[cid] = 2
   end
-- ============ MISJA ZE SZMATKAMI ============= 29/04/17
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
