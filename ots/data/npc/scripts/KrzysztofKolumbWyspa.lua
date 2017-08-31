local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	if isPlayerPzLocked( cid ) then
		npcHandler:say('Wygladasz jakbys sie przed chwila walczyl... Lepiej odejdz.', cid)
		return false
	elseif isInArray({"sail", "plyn", "podroz", "tak", "plynac", "plyn", "powrot"}, msg) then
		local player = Player(cid)
			if player:removeMoneyNpc(200) then
				player:teleportTo(Position(5909, 1233, 6 ))
			else
				npcHandler:say('Musisz miec 200 zlota, zeby tam plynac.', cid)
			end
		
		
	return true
	end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

