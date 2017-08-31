local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)     npcHandler:onCreatureAppear(cid)     end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)     end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()     npcHandler:onThink()     end

local voices = {
	{text = 'Uwazaj podrozniku, Ryba zasadzil sie na Ciebie!'},
	{text = 'Welcome to Knurrrow'},
	{text = 'Mysleliscie ze mozna mnie bezkarnie ponizac? Ze bede waszym popychadlem?'},
	{text = 'Miarka sie przebrala ! Przejmuje hajs i wladze nad Mirkotown! '},
	{text = 'Do budy? Do budy? Wy do budy, i to juz!'},
	{text = 'Waski jestem, chyba widac , nie?!'} }

npcHandler:addModule(VoiceModule:new(voices))

function spawnBandits(player)


	if player:getStorageValue(11031) == 3 then
		player:setStorageValue(11030,5)
		selfSay("Dobra dobra, nie bij juz. Powiedz komisarzowi Rybie ze moze przyjsc po drewno.",player)
	end
	if player:getStorageValue(11031) == 2 then
		player:setStorageValue(11031,3)
		selfSay("Sadziles ze mafie Waskiego tak latwo pokonasz?",player)
		Game.createMonster("Hunter",player:getPosition(), true, false)
		Game.createMonster("Hunter",player:getPosition(), true, false)
		Game.createMonster("Hunter",player:getPosition(), true, false)
		Game.createMonster("Assassin",player:getPosition(), true, false)
		Game.createMonster("Assassin",player:getPosition(), true, false)
		Game.createMonster("Assassin",player:getPosition(), true, false)
		Game.createMonster("barbarian bloodwalker",player:getPosition(), true, false)
		Game.createMonster("barbarian bloodwalker",player:getPosition(), true, false)
		Game.createMonster("barbarian bloodwalker",player:getPosition(), true, false)
	end
	if player:getStorageValue(11031) == 1 then
		player:setStorageValue(11031,2)
		selfSay("Tym razem nie dasz rady.",player)
		Game.createMonster("Valkyrie",player:getPosition(), true, false)
		Game.createMonster("Valkyrie",player:getPosition(), true, false)
		Game.createMonster("Assassin",player:getPosition(), true, false)
		Game.createMonster("Assassin",player:getPosition(), true, false)
		Game.createMonster("Assassin",player:getPosition(), true, false)
		Game.createMonster("Hunter",player:getPosition(), true, false)
		Game.createMonster("Hunter",player:getPosition(), true, false)
		Game.createMonster("Hunter",player:getPosition(), true, false)
	end
	if player:getStorageValue(11031) < 1 then
		player:setStorageValue(11031,1)
		selfSay("Zaraz sie przekonamy czy masz racje.",player)
		Game.createMonster("Bandit",player:getPosition(), true, false)
		Game.createMonster("Bandit",player:getPosition(), true, false)
		Game.createMonster("Bandit",player:getPosition(), true, false)
		Game.createMonster("Bandit",player:getPosition(), true, false)
		Game.createMonster("Bandit",player:getPosition(), true, false)
		Game.createMonster("Valkyrie",player:getPosition(), true, false)
	end
end -- end function

function  creatureSayCallback(cid, type, msg)
   if(not npcHandler:isFocused(cid)) then
  return false
end

  local player = Player(cid)
  -- ============= MISJA 1 DRUID ADDON QUEST ================= 

	if msgcontains(msg,"no") or msgcontains(msg,"nie") then
		if player:getStorageValue(11030,4) and npcHandler.topic[cid] == 1 or npcHandler.topic[cid] == 2 then
			if player:getStorageValue(11031) < 3 then
				selfSay('CO NIE JEST DEBESCIAK?!',cid)
			end
			spawnBandits(player)
			npcHandler.topic[cid] = 0
		end
	end
	if msgcontains(msg,"yes") or msgcontains(msg,"tak") then
		if player:getStorageValue(11030,4) and npcHandler.topic[cid] == 2 then
			selfSay("Dokladnie tak, szybko sie uczysz mlody.",cid)
			npcHandler.topic[cid] = 0
		end
		if player:getStorageValue(11030,4) and npcHandler.topic[cid] == 1 then
			selfSay("Bardzo dobre, a jego mafia tez jest debesciak?",cid)
			npcHandler.topic[cid] = 2
		end
	end
	if (msgcontains(msg,"drewno")) then
		if player:getStorageValue(11030) == 4 and npcHandler.topic[cid] == 0 then
			player:getPosition():sendMagicEffect(49)
			doCreatureSay(player:getPosition(),'*Pif paf*',TALKTYPE_ORANGE_1)
			selfSay("On jest debesciak? JA JESTEM DEBESCIAK.",cid)
			selfSay("Powiedz, Waski jest debesciak?",cid)
			npcHandler.topic[cid] = 1
		end
		if player:getStorageValue(11030) == 2 then
			player:setStorageValue(11030,3)
			selfSay('Drewno chcesz? To teraz jest drewno Waskiego i jego mafii. Przekaz to komisarzowi Rybie.',cid)
		end
	end
  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 

