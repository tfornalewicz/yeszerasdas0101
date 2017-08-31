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
	{ text = 'Moj miecz juz w niejednej bitwie sie przydal.' },
	{ text = 'Ja wam przyblocze, a wy bijcie!' },
	{ text = 'Kurza stopa, jest ich coraz wiecej!' }
}

npcHandler:addModule(VoiceModule:new(voices))

local function onAddFocus(cid)
		npcHandler:say("Bij te diably, nie gadaj!", cid)
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
end
npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:addModule(FocusModule:new())
