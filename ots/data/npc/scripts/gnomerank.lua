local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local t = {}
local renown = {}

local function greetCallback(cid)
	npcHandler:setMessage(MESSAGE_GREET, 'Witaj, jesli masz wystarczajace doswiadczenie, to moge cie {awans}owac! Spytaj o {rangi} po wiecej informacji ...')
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if msgcontains(msg, 'awans') then
		local player = Player(cid)
		if player:getStorageValue(Storage.BigfootBurden.Rank) >= 30 and player:getStorageValue(Storage.BigfootBurden.Rank) < 90 then
			if player:getStorageValue(Storage.BigfootBurden.QuestLine) == 14 then
				player:setStorageValue(Storage.BigfootBurden.QuestLine, 15)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler:say('Otrzymujesz range Pomocnik Gnomow. ...', cid)
				player:addAchievement('Pomocnik Gnomow')
			else
				npcHandler:say('Posiadasz odpowiednia range.', cid)
			end
		elseif player:getStorageValue(Storage.BigfootBurden.Rank) >= 90 and player:getStorageValue(Storage.BigfootBurden.Rank) < 240 then
			if player:getStorageValue(Storage.BigfootBurden.QuestLine) <= 15 then
				player:setStorageValue(Storage.BigfootBurden.QuestLine, 16)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler:say('Otrzymujesz range Przyjaciel Gnomow. ...', cid)
				player:addAchievement('Przyjaciel Gnomow')
			else
				npcHandler:say('Posiadasz odpowiednia range.', cid)
			end
		elseif player:getStorageValue(Storage.BigfootBurden.Rank) >= 240 and player:getStorageValue(Storage.BigfootBurden.Rank) < 430 then
			if player:getStorageValue(Storage.BigfootBurden.QuestLine) <= 16 then
				player:setStorageValue(Storage.BigfootBurden.QuestLine, 17)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler:say('Otrzymujesz range "Niczym Gnom". ...', cid)
				player:addAchievement('Niczym Gnom')
			else
				npcHandler:say('Posiadasz odpowiednia range.', cid)
			end
		elseif player:getStorageValue(Storage.BigfootBurden.Rank) >= 430 then
			if player:getStorageValue(Storage.BigfootBurden.QuestLine) <= 17 then
				player:setStorageValue(Storage.BigfootBurden.QuestLine, 18)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler:say('Otrzymujesz range Honorowy Gnom. ...', cid)
				player:addAchievement('Honorowy Gnom')
			else
				npcHandler:say('Posiadasz odpowiednia range.', cid)
			end
		else
			npcHandler:say('Czego tu szukasz?', cid)
		end
	elseif msgcontains(msg, "rangi") then
			npcHandler:say({
				"Wsrod gnomow wyrozniamy cztery rangi, sa to {Pomocnik Gnomow}, {Przyjaciel Gnomow}, {Niczym Gnom} oraz {Honorowy Gnom}. ...",
			}, cid)
			npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "pomocnik gnomow") then
		if(npcHandler.topic[cid] == 1) then
			npcHandler:say("Jest to najnizsza ranga, potrzebujesz 30 punktow reputacji aby ja zdobyc. ", cid)

		end
	elseif msgcontains(msg, "przyjaciel gnomow") then
		if(npcHandler.topic[cid] == 1) then
			npcHandler:say("Porzebujesz 90 punktow reputacji aby adobyc te range. Umozliwia ci ona wykonywanie powazniejszych zadan.", cid)

		end
	elseif msgcontains(msg, "niczym gnom") then
		if(npcHandler.topic[cid] == 1) then
			npcHandler:say("Potrzebujesz 240 punktow reputacji aby adobyc te range. Umozliwia ci ona wykonywanie powazniejszych zadan.", cid)

		end
	elseif msgcontains(msg, "honorowy gnom") then
		if(npcHandler.topic[cid] == 1) then
			npcHandler:say("Potrzebujesz 430 punktow reputacji aby zdobyc te range. Umozliwia ci ona wejscie do strefy wojny.", cid)

		end
	end
	return true
end

local function onReleaseFocus(cid)
	t[cid], renown[cid] = nil, nil
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)
npcHandler:addModule(FocusModule:new())
