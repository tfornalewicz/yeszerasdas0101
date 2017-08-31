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

	if isInArray({"soft boots"}, msg) then
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
   end
   
   end
-- ============ DO MISJI TRUDNE POCZATKI =============

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())