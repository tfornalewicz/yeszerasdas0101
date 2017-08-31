dofile ('data/arena.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local voices = {
	{text = 'Wejdz na arene i walcz ! Wroc z tarcza lub na tarczy !'},
	{text = 'Jesli nie brak Ci odwagi, sprawdz sie w obliczu ciezkiej walki!'},
	{text = 'My smiertelnicy jestesmy jedynie cieniami i pylem.'},
	{text = 'To, co czynimy za zycia, odbija sie echem w wiecznosci.'} }

npcHandler:addModule(VoiceModule:new(voices))
local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	
	if isInArray({"arena", "zadanie", "fight", "walka", "arene", "wyzwanie", "wazwania"}, msg) then
		npcHandler:say("Mam do zaoferowania 4 poziomy trudnosci areny, {latwa}, {srednia}, {trudna} oraz {ekstremalna}. Na ktory poziom trudnosci masz ochote?", cid)
		if player:getStorageValue(26100) > 0 and player:getStorageValue(26101) > 0 and player:getStorageValue(26102) > 0 and not player:hasOutfit(884) then
			player:addOutfitAddon(885, 3)
			player:addOutfitAddon(884, 3)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Otrzymujesz Arena Champion Outfit plus dodatki za wykonanie trzech aren!")
		end
		
	elseif isInArray({"latwa", "latwy"}, msg) then
		npcHandler:say("Czy jestes {pewny}, ze poradzisz sobie na tej arenie?", cid)
		npcHandler.topic[cid] = 1
	elseif isInArray({"srednia", "sredni"}, msg) then
		npcHandler:say("Czy jestes {pewny}, ze poradzisz sobie na tej arenie?", cid)
		npcHandler.topic[cid] = 2
	elseif isInArray({"trudna", "trudny"}, msg) then
		npcHandler:say("Czy jestes {pewny}, ze poradzisz sobie na tej arenie?", cid)
		npcHandler.topic[cid] = 3
	elseif isInArray({"ekstremalna", "ekstremalny"}, msg) then
		if player:getParty() ~= nil then
			npcHandler:say("Nie macie czego tutaj szukac! Jestescie za slabi!", cid)
			npcHandler:releaseFocus(cid)
			npcHandler:resetNpc(cid)
		else
			npcHandler:say("Serio? Przeciez nie dasz sobie rady. Z czym do ludzi, przyjdz kiedy indziej.", cid)
			npcHandler:releaseFocus(cid)
			npcHandler:resetNpc(cid)
		end
		
	elseif isInArray({"yes", "tak", "pewny", "pewna"}, msg) and (npcHandler.topic[cid] == 1 or npcHandler.topic[cid] == 2 or npcHandler.topic[cid] == 3) then
	if player:getStorageValue(26099+npcHandler.topic[cid]) > 0 then
		npcHandler:say("Ta arena zostala zakonczona, ale mozesz wejsc do sali po nagrode.", cid)
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
		player:teleportTo(Position(6918, 630, 7))
	else			
		if (roomsIsOccupied()) then
			npcHandler:say("Wszystkie areny sa zajete! Wroc do mnie za kilku minut. Elo.", cid)
			npcHandler:releaseFocus(cid)
			npcHandler:resetNpc(cid)
		else
			npcHandler:say("Powodzenia!", cid)
			local level = npcHandler.topic[cid]
			player:setStorageValue(300+level, 1)
			local room = player:getStorageValue(300+level)
			local boss = arena_bosses[level == 1 and room or level == 2 and 10+room or 20+room]
			local arenaroom = 0
			for i = 1, 10 do
				local spectators = Game.getSpectators(rooms[i].centerPosition, false, false, 7, 7, 7, 7)
				if #spectators == 0 then
					arenaroom = i
				end
			end
			player:setStorageValue(300, arenaroom)
			local monster = Game.createMonster(boss, rooms[arenaroom].centerPosition, true, true)
			player:teleportTo(rooms[arenaroom].teleportPosition)
			local event_id=addEvent(clearArena, 10*60*1000, player.uid, monster.uid, arenaroom)
			player:setStorageValue(299, event_id)
			player:say('Masz 7 minut na pokonanie kazdego przeciwnika.', TALKTYPE_MONSTER_SAY)
			if not monster then
				return true
			end
			npcHandler:releaseFocus(cid)
			npcHandler:resetNpc(cid)
		end
	end
	end
		
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())