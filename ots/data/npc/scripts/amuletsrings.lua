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
	{text = 'Piekny panie, daj pan zloty pierscionek ja powrozyc...'},
	{text = 'Spokojnie, nie okradne Cie, mozesz sprzedac u mnie swoje kosztownosci...'},
	{text = 'Cooo? Yyyy no tego, mial kurde'},
	{text = 'Byla sakwa z hajsem, nie ma sakwy'} }

npcHandler:addModule(VoiceModule:new(voices))

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)




local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)

	if isInArray({"life crystal", "life ring", "life"}, msg) then
		npcHandler:say("Moge wytworzyc pierscien z {life crystal}, nauczyla mnie tego mama. Czy chcesz, abym sprobowal zrobic to z Twoim krysztalem?", cid)
		npcHandler.topic[cid] = 1
	elseif isInArray({"yes", "tak"}, msg) then
		if npcHandler.topic[cid] == 1 then
			if player:removeItem(2177, 1) then
				player:addItem(2168, 1)
				npcHandler:say("Prosze bardzo, oto Twoj pierscionek.", cid)
			else
				npcHandler:say("Sorry, ale nie masz tego krysztalu ze soba. Tylko {life crystal} nadaje sie do wytworzenia tego pierscienia.", cid)
			end
		elseif npcHandler.topic[cid] == 2 then
			if player:removeItem(2156,1) then
				player:addItem(2214,1) -- dostaje ring of healing
				selfSay('Trzymaj pierscien!',cid)
			else
				selfSay('Nie posiadasz zadnego gemu!',cid)
			end
		end
		npcHandler.topic[cid] = 0
	elseif isInArray({"no", "nie"}, msg ) and npcHandler.topic[cid] > 0 then
		npcHandler:say("Nie to nie, spadaj!", cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg,"Red gem") and player:getStorageValue(11072) == 2 then
		selfSay('Moge Ci z niego wykuc {Ring of Healing}, co ty na to?',cid)
		npcHandler.topic[cid] = 2
	-- ============ DO MISJI TRUDNE POCZATKI =============
   elseif (msgcontains(msg, "pomoc")) and player:getStorageValue(11019) > 0 and player:getStorageValue(11029) < 1 then
        player:setStorageValue(11029,1) -- lockujemy Cygana jako wykonanego
        player:setStorageValue(11019,player:getStorageValue(11019) + 1) -- +1 zeby kolejnosc nie miala znaczenia
        selfSay('Kula! Ukradli mi moja kule do wrozenia', cid)
-- ============ DO MISJI TRUDNE POCZATKI =============
	elseif msgcontains(msg,"kula") or msgcontains(msg,"kule") then
		if player:getStorageValue(11072) < 1 then
			selfSay('Tak, moja kula! Niestety mi sie potlukla, moze uda ci sie znalezc nowa aby ja zastapic, zglos sie wtedy do mnie!',cid)
			player:setStorageValue(11072,1) -- zaczynamy questa
		elseif player:getStorageValue(11072) == 1 and player:getItemCount(2192) > 0 then
			-- Q5.1
			player:addExperience(30000,true) -- 30k expa
			-- Q5.1
			player:setStorageValue(11072,2) -- koniec questa
			player:removeItem(2192,1) -- zabieramy kule
			selfSay('Hmm, poprzednia byla lepsza, ale tez jest super. Dzieki wielkie!',cid)
			selfSay('W zamian mozesz u mnie wymieniac Red Gem na Ring of Healing',cid)
		end
	end
end


shopModule:addBuyableItem({'wedding ring'}, 2121, 990,'wedding ring')
shopModule:addBuyableItem({'time ring'}, 2169, 2000,'time ring')
shopModule:addBuyableItem({'sword ring'}, 2207, 500,'sword ring')
shopModule:addBuyableItem({'stealth ring'}, 2165, 5000,'stealth ring')
shopModule:addBuyableItem({'signet ring'}, 7697, 15000,'signet ring')
shopModule:addBuyableItem({'ring of healing'}, 2214, 2000,'ring of healing')
shopModule:addBuyableItem({'power ring'}, 2166, 100,'power ring')
shopModule:addBuyableItem({'might ring'}, 2164, 5000,'might ring')
shopModule:addBuyableItem({'life ring'}, 2168, 900,'life ring')
shopModule:addBuyableItem({'energy ring'}, 2167, 2000,'energy ring')
shopModule:addBuyableItem({'dwarven ring'}, 2213, 2000,'dwarven ring')
shopModule:addBuyableItem({'club ring'}, 2209, 500,'club ring')
shopModule:addBuyableItem({'axe ring'}, 2208, 500,'axe ring')
shopModule:addBuyableItem({'Ruby Necklace'}, 2133, 3560,'Ruby Necklace')
shopModule:addBuyableItem({'Wolf Tooth Chain'}, 2129, 400,'Wolf Tooth Chain')
shopModule:addBuyableItem({'Dragon Necklace'}, 2201, 1000,'Dragon Necklace')
shopModule:addBuyableItem({'Garlic Necklace'}, 2199, 100,'Garlic Necklace')
shopModule:addBuyableItem({'Golden Amulet'}, 2130, 6600,'Golden Amulet')
shopModule:addBuyableItem({'Scarf'}, 2661, 15,'Scarf')
shopModule:addBuyableItem({'Bronze Amulet'}, 2172, 100,'Bronze Amulet')
shopModule:addBuyableItem({'Elven amulet'}, 2198, 500,'Elven amulet')
shopModule:addBuyableItem({'Protection amulet'}, 2200, 700,'Protection amulet')
shopModule:addBuyableItem({'Silver Amulet'}, 2170, 50,'Silver Amulet')
shopModule:addBuyableItem({'Stone Skin Amulet'}, 2197, 5000,'Stone Skin Amulet')
shopModule:addBuyableItem({'Strange Talisman'}, 2161, 100,'Strange Talisman')

shopModule:addSellableItem({'wedding ring'}, 2121, 100,'wedding ring')
shopModule:addSellableItem({'time ring'}, 2169, 100,'time ring')
shopModule:addSellableItem({'sword ring'}, 2207, 100,'sword ring')
shopModule:addSellableItem({'stealth ring'}, 2165, 200,'stealth ring')
shopModule:addSellableItem({'ring of the sky'}, 2123, 30000,'ring of the sky')
shopModule:addSellableItem({'ring of healing'}, 2214, 100,'ring of healing')
shopModule:addSellableItem({'power ring'}, 2166, 50,'power ring')
shopModule:addSellableItem({'might ring'}, 2164, 250,'might ring')
shopModule:addSellableItem({'life ring'}, 2168, 50,'life ring')
shopModule:addSellableItem({'gold ring'}, 2179, 8000,'gold ring')
shopModule:addSellableItem({'energy ring'}, 2167, 100,'energy ring')
shopModule:addSellableItem({'dwarven ring'}, 2213, 100,'dwarven ring')
shopModule:addSellableItem({'death ring'}, 6300, 1000,'death ring')
shopModule:addSellableItem({'crystal ring'}, 2124, 250,'crystal ring')
shopModule:addSellableItem({'club ring'}, 2209, 100,'club ring')
shopModule:addSellableItem({'axe ring'}, 2208, 100,'axe ring')


--[[ blyskotki, diamenty, kamienie szlachetne ]]
shopModule:addSellableItem({'emerald bangle'}, 2127, 800,'emerald bangle')
shopModule:addSellableItem({'crystal of balance'}, 9942, 1000,'crystal of balance')
shopModule:addSellableItem({'crystal of focus'}, 9941, 2000,'crystal of focus')
shopModule:addSellableItem({'crystal of power'}, 9980, 3000,'crystal of power')
shopModule:addSellableItem({'Small Sapphire'}, 2146, 250,'Small Sapphire')
shopModule:addSellableItem({'Small Diamond'}, 2145, 300,'Small Diamond')
shopModule:addSellableItem({'Black Pearl'}, 2144, 280,'Black pearl')
shopModule:addSellableItem({'Gold ingot'}, 9971, 5000,'Gold ingot')
shopModule:addSellableItem({'Scarab coin'}, 2159, 100,'Scarab coin')
shopModule:addSellableItem({'Small Amethyst'}, 2150, 200,'Small Amethyst')
shopModule:addSellableItem({'Small Diamond'}, 2145, 300,'Small Diamond')
shopModule:addSellableItem({'Small Emerald'}, 2149, 250,'Small Emerald')
shopModule:addSellableItem({'Small Ruby'}, 2147, 250,'Small Ruby')
shopModule:addSellableItem({'Small Sapphire'}, 2146, 250,'Small Sapphire')
shopModule:addSellableItem({'Small Topaz'}, 9970, 200,'Small Topaz')
shopModule:addSellableItem({'White Pearl'}, 2143, 160,'White Pearl')
shopModule:addSellableItem({'Blue Gem'}, 2158, 5000,'Blue Gem')
shopModule:addSellableItem({'Green Gem'}, 2155, 5000,'Green Gem')
shopModule:addSellableItem({'Red Gem'}, 2156, 1000,'Red Gem')
shopModule:addSellableItem({'Violet Gem'}, 2153, 10000,'Violet Gem')
shopModule:addSellableItem({'Yellow Gem'}, 2154, 1000,'Yellow Gem')
--[[ end of ]]
shopModule:addSellableItem({'Necklace of the Deep'}, 15403, 3000,'Necklace of the Deep')
shopModule:addSellableItem({'Glooth Amulet'}, 23554, 2000,'Glooth Amulet')
shopModule:addSellableItem({'Crystal Necklace'}, 2125, 400,'Crystal Necklace')
shopModule:addSellableItem({'Ruby Necklace'}, 2133, 2000,'Ruby Necklace')
shopModule:addSellableItem({'Wolf Tooth Chain'}, 2129, 100,'Wolf Tooth Chain')
shopModule:addSellableItem({'Dragon Necklace'}, 2201, 100,'Dragon Necklace')
shopModule:addSellableItem({'Garlic Necklace'}, 2199, 50,'Garlic Necklace')
shopModule:addSellableItem({'Beetle Necklace'}, 11374, 1500,'Beetle Necklace')
shopModule:addSellableItem({'Ancient Amulet'}, 2142, 200,'Ancient Amulet')
shopModule:addSellableItem({'Demonbone Amulet'}, 2136, 32000,'Demonbone Amulet')
shopModule:addSellableItem({'Golden Amulet'}, 2130, 2000,'Golden Amulet')
shopModule:addSellableItem({'Scarab Amulet'}, 2135, 200,'Scarab Amulet')
shopModule:addSellableItem({'Star Amulet'}, 2131, 500,'Star Amulet')
shopModule:addSellableItem({'Platinum Amulet'}, 2171, 2500,'Platinum Amulet')
shopModule:addSellableItem({'Scarf'}, 2661, 5,'Scarf')
shopModule:addSellableItem({'Amulet of loss'}, 2173, 25000,'Amulet of loss')
shopModule:addSellableItem({'Bronze Amulet'}, 2172, 50,'Bronze Amulet')
shopModule:addSellableItem({'Elven amulet'}, 2198, 100,'Elven amulet')
shopModule:addSellableItem({'Glacier amulet'}, 7888, 1500,'Glacier amulet')
shopModule:addSellableItem({'Leviathan/s amulet'}, 10220, 3000,'Leviathan/s amulet')
shopModule:addSellableItem({'Lightning pendant'}, 7889, 1500,'Lightning pendant')
shopModule:addSellableItem({'Magma amulet'}, 7890, 1500,'Magma amulet')
shopModule:addSellableItem({'Protection amulet'}, 2200, 100,'Protection amulet')
shopModule:addSellableItem({'Sacred Tree Amulet'}, 10219, 3000,'Sacred Tree Amulet')
shopModule:addSellableItem({'Shockwave Amulet'}, 10221, 3000,'Shockwave Amulet')
shopModule:addSellableItem({'Silver Amulet'}, 2170, 25,'Silver Amulet')
shopModule:addSellableItem({'Stone Skin Amulet'}, 2197, 500,'Stone Skin Amulet')
shopModule:addSellableItem({'Strange Talisman'}, 2161, 30,'Strange Talisman')
shopModule:addSellableItem({'Terra Amulet'}, 7887, 1500,'Terra Amulet')
shopModule:addSellableItem({'Gill Necklace'}, 18402, 10000, 'Gill Necklace')



npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

