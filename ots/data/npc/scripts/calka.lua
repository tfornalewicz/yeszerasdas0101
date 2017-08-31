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
	{text = 'Luki, kusze, amunicja to moj chleb powszedni'},
	{text = 'Codziennie z rana ostrze grot kazdej wloczni'},
	{text = 'Co drugi przychodzi i krzyczy daaaaaj kamieniaaaaaa'},
	{text = 'Za Tuska to sie dobrze krecil interes a teraz...'},
	{text = 'Kusza czy luk? Zapraszam do debaty...'} }

npcHandler:addModule(VoiceModule:new(voices))

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)



local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	
	if isInArray({"soul orb", "soul"}, msg) then
		npcHandler:say("Moge wytworzyc diabelskie belty z {soul orb}. Nauki bralem u samego Diabla. Czy chcesz zamienic wszystkie kule duszy?", cid)
		npcHandler.topic[cid] = 1
	elseif isInArray({"yes", "tak"}, msg) and npcHandler.topic[cid] == 1 then
		local soulOrb = player:getItemCount(5944)
		local infernalBolts = 0

		if soulOrb > 0 and soulOrb ~= nil then
			for i = soulOrb, 1, -1 do
				local rand = math.random(10000) -- 1% chance to get 4 infernal bolts
				if rand < 100 then
					infernalBolts = infernalBolts + 4
				else
					infernalBolts = infernalBolts + 2
				end
			end

			if player:removeItem(5944, soulOrb) then
				player:addItem(6529, infernalBolts )
				npcHandler:say("Trzymaj! Uzywaj ich rozsadnie!", cid)
			end
		else
			npcHandler:say("Przeciez widze, ze ich nie masz! Moge wytworzyc diabelskie belty tylko z {soul orb}.", cid)
		end


		npcHandler.topic[cid] = 0
	elseif isInArray({"no", "nie"}, msg ) and npcHandler.topic[cid] == 1 then
		npcHandler:say("Nie zawracaj mi glowy!", cid)
		npcHandler.topic[cid] = 0
	end
	-- ============ DO MISJI TRUDNE POCZATKI =============
	   if msgcontains(msg,"nagroda") and player:getStorageValue(11030) == 6 then
        if player:getStorageValue(11032) > 0 then
            selfSay('Juz dostales jedna nagrode, nie probuj cebulic. A po potiony do Fstaba.',cid)
        end
        if player:getStorageValue(11032) < 1 then
            selfSay('Trollsy cie przyslal? Co wolisz belty czy strzaly?',cid)
            npcHandler.topic[cid] = 1
        end
   end
	if msgcontains(msg,"belty") and player:getStorageValue(11032) < 1 and npcHandler.topic[cid] == 1 then
        player:setStorageValue(11032,3) -- do fstaba
        player:addItem(7363,100) -- 100 piercing bolts 
        player:addItem(7363,100) -- 100 piercing bolts 
        player:addItem(7363,100) -- 100 piercing bolts 
        selfSay('Oto twoje belty, zglos sie jescze do Fstaba po przydzial potionow',cid)
        npcHandler.topic[cid] = 0
   end 
	if msgcontains(msg,"strzaly") and player:getStorageValue(11032) < 1 and npcHandler.topic[cid] == 1 then
        player:setStorageValue(11032,3) -- do fstaba
        player:addItem(7364,100) -- 100 sniper arrows
        player:addItem(7364,100) -- 100 sniper arrows
        player:addItem(7364,100) -- 100 sniper arrows
        selfSay('Oto twoje strzaly, zglos sie jescze do Fstaba po przydzial potionow',cid)
        npcHandler.topic[cid] = 0
   end 
   if (msgcontains(msg, "pomoc")) and player:getStorageValue(11019) > 0 and player:getStorageValue(11022) < 1 then
        player:setStorageValue(11022,1) -- lockujemy calke jako wykonanego
        player:setStorageValue(11019,player:getStorageValue(11019) + 1) -- +1 zeby kolejnosc nie miala znaczenia
        selfSay('Wszystko w jak najlepszym porzadku, tylko jakbys mogl dowiedziec sie co z drewnem, bo mi sie zapasy koncza, a nie chce zawiesc klientow', cid)
   end
-- ============ DO MISJI TRUDNE POCZATKI =============
end

shopModule:addBuyableItem({'prismatic bolt'}, 18435,20,'prismatic bolt')
shopModule:addBuyableItem({'arrow'}, 2544,3,'arrow')
shopModule:addBuyableItem({'small stone'}, 1294,30,'small stone')
shopModule:addBuyableItem({'bolt'}, 2543,4,'bolt')
shopModule:addBuyableItem({'bow'}, 2456,400,'bow')
shopModule:addBuyableItem({'crossbow'}, 2455,500,'crossbow')
shopModule:addBuyableItem({'crystalline arrow'}, 18304,20,'crystalline arrow')
shopModule:addBuyableItem({'drill bolt'}, 18436,12,'drill bolt')
shopModule:addBuyableItem({'earth arrow'}, 7850,5,'earth arrow')
shopModule:addBuyableItem({'envenomed arrow'}, 18437,12,'envenomed arrow')
shopModule:addBuyableItem({'assassin star'}, 7368,100,'assassin star')
shopModule:addBuyableItem({'flaming arrow'}, 7840,5,'flaming arrow')
shopModule:addBuyableItem({'flash arrow'}, 7838,5,'flash arrow')
shopModule:addBuyableItem({'onyx arrow'}, 7365,7,'onyx arrow')
shopModule:addBuyableItem({'piercing bolt'}, 7363,5,'piercing bolt')
shopModule:addBuyableItem({'power bolt'}, 2547,7,'power bolt')
shopModule:addBuyableItem({'royal spear'}, 7378,15,'royal spear')
shopModule:addBuyableItem({'shiver arrow'}, 7839,5,'shiver arrow')
shopModule:addBuyableItem({'sniper arrow'}, 7364,5,'sniper arrow')
shopModule:addBuyableItem({'spear'}, 2389,9,'spear')
shopModule:addBuyableItem({'tarsal arrow'}, 15648,6,'tarsal arrow')
shopModule:addBuyableItem({'throwing star'}, 2399,42,'throwing star')
shopModule:addBuyableItem({'vortex bolt'}, 15649,6,'vortex bolt')


shopModule:addSellableItem({'bow'}, 2456, 100,'bow')
shopModule:addSellableItem({'crossbow'}, 2455, 120,'crossbow')
shopModule:addSellableItem({'silkweaver bow'}, 8857, 4000,'silkweaver bow')
shopModule:addSellableItem({'spear'}, 2389, 3,'spear')
shopModule:addSellableItem({'modified crossbow'}, 8849, 8000,'modified crossbow')
shopModule:addSellableItem({'hive bow'}, 15643, 28000,'hive bow')



npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
