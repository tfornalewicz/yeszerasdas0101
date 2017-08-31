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
	{ text = 'W twoim domku nie ma miejsca bo masz pelno starych mieczy? Tarcz? Przyjdz z tym do mnie!' },
	{ text = 'Oferuje wiecej niz pozostali! Sprzedawaj u mnie.' },
	{ text = 'Zebrales sporo zelastwa? Smialo, pohandlujmy..' },
	{ text = 'Skupie caly ekwipunek jaki zebrales na polowaniu w korzystnej cenie !' },
	{ text = 'Poza tworzeniem nozy skupuje rowniez topory, miecze, obuchy...' },
	{ text = 'To legalny biznes, sprzedajac u mnie wspierasz serwerowa gospodarke!' }
}

npcHandler:addModule(VoiceModule:new(voices))


local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local player = Player(cid)

-- ============ DO MISJI TRUDNE POCZATKI =============
   if (msgcontains(msg, "pomoc")) and player:getStorageValue(11019) > 0 and player:getStorageValue(11020) < 1 then
        player:setStorageValue(11020,1) -- lockujemy trollskiego jako wykonanego
        player:setStorageValue(11019,player:getStorageValue(11019) + 1) -- +1 zeby kolejnosc nie miala znaczenia
        selfSay('W zasadzie to tak, od jakis 2 dni spoznia sie dostawa drewna z Knurowa, niestety nie moge sie ruszyc stad zeby to sprawdzic.', cid)
   end
   if msgcontains(msg,"topor") and player:getStorageValue(11032) < 1 and npcHandler.topic[cid] == 1 then
        player:setStorageValue(11032,1) -- do fstaba
        player:addItem(3962,1) -- beastslayer axe
        selfSay('Oto twoj topor, zglos sie jeszcze do Fstaba po przydzial potionow.',cid)
        npcHandler.topic[cid] = 0
   end 
   if msgcontains(msg,"miecz") and player:getStorageValue(11032) < 1 and npcHandler.topic[cid] == 1 then
        player:setStorageValue(11032,1) -- do fstaba
        player:addItem(23548,1) -- Cowtana
        selfSay('Oto twoj miecz, zglos sie jeszcze do Fstaba po przydzial potionow.',cid)
        npcHandler.topic[cid] = 0
   end 
   if msgcontains(msg,"palka") and player:getStorageValue(11032) < 1 and npcHandler.topic[cid] == 1 then
        player:setStorageValue(11032,1) -- do fstaba
        player:addItem(7387,1) -- diamond sceptre
        selfSay('Oto twoja palka, zglos sie jeszcze do Fstaba po przydzial potionow.',cid)
        npcHandler.topic[cid] = 0
   end 
   if msgcontains(msg,"ksiazka") and player:getStorageValue(11032) < 1 and npcHandler.topic[cid] == 1 then
        player:setStorageValue(11032,2) -- do fstaba
        player:addItem(8900,1) -- spellbook of enlightenment
        selfSay('Oto twoja ksiazka, zglos sie jeszcze do Fstaba po przydzial potionow.',cid)
        npcHandler.topic[cid] = 0
   end 
   if (msgcontains(msg,"belty") or msgcontains(msg,"strzaly")) and player:getStorageValue(11032) < 1 and npcHandler.topic[cid] == 1 then
        selfSay('Po ta nagrode zglos sie do Calki, oraz jeszcze do Fstaba po przydzial potionow.',cid)
        npcHandler.topic[cid] = 0
   end 
   if msgcontains(msg,"nagroda") and player:getStorageValue(11030) == 6 then
        if player:getStorageValue(11032) > 0 then
            selfSay('Juz dostales jedna nagrode, nie probuj cebulic. A po potiony do Fstaba.',cid)
        end
        if player:getStorageValue(11032) < 1 then
            selfSay('Aaa, za pomoc w odzyskaniu drewna, oczywiscie. Mam pare rzeczy, powiedz tylko czego potrzebujesz, oto ich lista:',cid)
            selfSay('Topor, miecz, palka, ksiazka, belty lub strzaly.',cid)
            npcHandler.topic[cid] = 1
        end
   end
-- ============ DO MISJI TRUDNE POCZATKI =============
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
