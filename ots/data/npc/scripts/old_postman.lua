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
	{text = 'Przesylki kurierskie z Aliexpress tanio !'},
	{text = 'Przez te internety ludzie wysylaja coraz mniej listow...'},
	{text = 'U mnie zaplacisz rowniez rachunki, jak i zakupisz paczke oraz list'},
	{text = 'Trzeba przemyslec czy nie lepiej udac sie na emigracje... Interes slabiej sie kreci coraz mniejsze obroty'},
	{text = 'Mam juz dosc wciskania ludziom tych zniczy na Wszystkich Swietych, kochany kierownik...'} }

	npcHandler:addModule(VoiceModule:new(voices))
	
local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
local player = Player(cid)

-- ============ DO 1 MISJI YALAHARI QUESTA =============
  if (msgcontains(msg, "zaproszenie") or msgcontains(msg, "madame") or msgcontains(msg, "mission")) and player:getStorageValue(11002) == 3 then
    player:setStorageValue(11002, 4)
    player:addItem(2006,0)
    selfSay('A wiec Madame Malkin dalej nie chce sie zgodzic na spotkanie z Arielem, ale mam pomysl. Nie spodoba sie on Arielowi, ale nie musi przeciez o tym wiedziec.',cid)
    selfSay('Na polnoc od miasta znajduje sie wioska magow. Podobno maja tam laboratorium w ktorym ostatnio wywarzyli eliksir milosci. Wroc pozniej do mnie to powiem ci co dalej robic.', cid)
  end
  if (msgcontains(msg, "eliksir") or msgcontains(msg, "madame") or msgcontains(msg, "mission")) and player:getStorageValue(11002) == 5 then
    player:setStorageValue(11002, 6)
    selfSay('Skoro mamy juz miksture to teraz musimy zdobyc wlos ariela zeby rozpuscic w miksturze. Najwazniejsze, zeby Ariel nie dowiedzial sie co planujemy.',cid)
    selfSay('Idz do niego i poszukaj wlosow w sianie na ktorym spi, napewno cos tam znajdziesz, a nastepnie przekaz Madame Mikstrure do picia jak wino do skosztowania ode mnie.', cid)
  end
-- ============ DO 1 MISJI YALAHARI QUESTA =============  
-- ============ DO MISJI TRUDNE POCZATKI =============
   if (msgcontains(msg, "pomoc")) and player:getStorageValue(11019) > 0 and player:getStorageValue(11023) < 1 then
        player:setStorageValue(11023,1) -- lockujemy postmana jako wykonanego
        player:setStorageValue(11019,player:getStorageValue(11019) + 1) -- +1 zeby kolejnosc nie miala znaczenia
        selfSay('U mnie ok, ale slyszalem ze Fstabowi brakuje rak do pracy', cid)
   end
   
    if (msgcontains(msg, "helm")) and player:getStorageValue(10100) > 99 then
        selfSay('Event juz sie skonczyl...', cid)
		player:setStorageValue(10100, 0)
		--player:addItem(5461, 1)
	end
-- ============ DO MISJI TRUDNE POCZATKI =============
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
