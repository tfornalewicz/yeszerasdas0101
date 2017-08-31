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
	elseif isInArray({"step", "stepy"}, msg) then
		local player = Player(cid)
			if player:removeMoneyNpc(200) then
				player:teleportTo(Position(6247, 1023, 6))
			else
				npcHandler:say('Musisz miec 200 zlota, zeby tam plynac.', cid)
			end
	elseif isInArray({"quary", "thul"}, msg) then
		local player = Player(cid)
			if player:removeMoneyNpc(200) then
				player:teleportTo(Position(6223, 1392, 7))
			else
				npcHandler:say('Musisz miec 200 zlota, zeby tam plynac.', cid)
			end
	elseif isInArray({"wyspa", "zapomniana wyspa", "wyspe", "zapomniana wyspe"}, msg) then
		local player = Player(cid)
			if player:getLevel() > 50 then
				if player:removeMoneyNpc(200) then
					player:teleportTo(Position(5747, 1217, 6))
				else
				npcHandler:say('Musisz miec 200 zlota, zeby tam plynac.', cid)
				end
			else
				npcHandler:say('Nie masz odpowiedniego poziomu.', cid)
			end
	return true
	end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

