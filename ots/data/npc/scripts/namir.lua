local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                         npcHandler:onThink() end

local voices = {
	{text = 'Ale dzis goraco..'},
	{text = 'Chyba pora sie zdrzemnac..'} }
	
npcHandler:addModule(VoiceModule:new(voices))

-- OTServ event handling functions end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	if isInArray({"ryz", "rice", "kulka ryzowa", "bunch of ripe rice", "rice ball", "ryzu"}, msg) then
		npcHandler:say("Ahh! Skonczyl mi sie wlasnie caly ryz.. Masz moze jakies wiazki ryzowe przy sobie?", cid)
		npcHandler.topic[cid] = 1
	elseif isInArray({"yes", "tak"}, msg) then
		if npcHandler.topic[cid] == 1 then
			if player:removeItem(11245, 10) then
				player:addItem(11246, 1)
				npcHandler:say("Prosze, oto kulka dla ciebie.", cid)

			else
				npcHandler:say("Ehh, masz za malo..", cid)

			end
		end
	return true
	end

end

-- Start shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


shopModule:addSellableItem({'Squeezer'}, 5865, 50, 'juice squeezer')

-------------------player buys

shopModule:addBuyableItem({'Lemonade'}, 2006, 25, 5, 'vial of lemonade')
shopModule:addBuyableItem({'Wine'},2006,10,15, 'vial of wine')
shopModule:addBuyableItem({'Meat'},2666,5)
shopModule:addBuyableItem({'Cheese'},2696,5)
shopModule:addBuyableItem({'Bread'},2689,3)
shopModule:addBuyableItem({'Squeezer'},5865,350)
shopModule:addBuyableItem({'Bug Milk'},9674,550)
shopModule:addBuyableItem({'Water'},2007,20,1, 'bottle of water')
shopModule:addBuyableItem({'Mug of beer'},2012,2,3, 'mug of beer')
shopModule:addBuyableItem({'Mug of wine'},2012,3,15, 'mug of wine')

npcHandler:addModule(FocusModule:new())
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
