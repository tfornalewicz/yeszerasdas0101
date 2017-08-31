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
	{text = 'Wszystko wina Tuska!'},
	{text = 'Cala Polska z was sie smieje, komunisci i zlodzieje!'},
	{text = 'Ale czy marihuana jest z konopi? Chyba nie...'},
	{text = '..z ziemi polskiej do Wolski...'},
	{text = 'My jestesmy tu gdzie wtedy. Oni tam gdzie stalo ZOMO'},
	{text = 'My nie mowimy, ze biale jest czarne, tylko ze czarne jest czarne i ze trzeba to wybielic.'} }

npcHandler:addModule(VoiceModule:new(voices))

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
   
	local player = Player(cid)

end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())