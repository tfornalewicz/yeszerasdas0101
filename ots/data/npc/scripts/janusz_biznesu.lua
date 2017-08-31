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
	{text = 'No nie wiem czy te kly slonia sa legalne... moge Ci za nie dac polowe ceny'},
	{text = 'Tanio skory kupie drozej sprzedam, i wodki sie tez napije...'},
	{text = 'Jak masz na sprzedaz rozne dodatki to zapraszam, najlepsze ceny !'},
	{text = 'Grazina przerwe mam, nalej mnie tej kapucziny ! '} }
	
	npcHandler:addModule(VoiceModule:new(voices))

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
   
	local player = Player(cid)


-- ============ DO MISJI TRUDNE POCZATKI =============
   if (msgcontains(msg, "pomoc")) and player:getStorageValue(11019) > 0 and player:getStorageValue(11028) < 1 then
        player:setStorageValue(11028,1) -- lockujemy Janusza jako wykonanego
        player:setStorageValue(11019,player:getStorageValue(11019) + 1) -- +1 zeby kolejnosc nie miala znaczenia
        selfSay('Nie potrzebuje nic, ale sprzedaje passata jakbys byl zainteresowany', cid)
   end
-- ============ DO MISJI TRUDNE POCZATKI =============
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
