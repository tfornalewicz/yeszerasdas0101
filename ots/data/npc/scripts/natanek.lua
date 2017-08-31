local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local voices = {
	{text = 'Zaczal diabel jak wsciekniety atakowac, wiedz ze cos sie dzieje...'},
	{text = 'Lepiej dac na tace i kupic te blessy, licho nie spi...'},
	{text = 'Harry Potter, Gwiezdne Wojny, akupunktura,astrologia, bioenergoterapia...'},
	{text = 'Horoskopy,Magia,Numerologia, Okultyzm, Tarot, Techno...'} }

	npcHandler:addModule(VoiceModule:new(voices))

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	local totalBlessPrice = getBlessingsCost(player:getLevel()) * 5
	if isInArray({"pomoc", "pomocy", "help", "tak", "yes"}, msg) and npcHandler.topic[cid] == 0 then
		npcHandler:say({"Znajdujesz sie w swiatyni miasta. Jezeli chcesz, moge {uleczyc} Twoje rany, {poblogoslawic} Cie, {awansowac} lub {zaznaczyc} na mapie najwazniejszych NPC."}, cid)
		
	elseif  isInArray({"mark", "zaznacz", "map", "zaznaczyc"}, msg) then
		npcHandler.topic[cid] = 0
		local configMarks = {
			{mark = "tools", position = Position(5864, 1559, 7), markId = MAPMARK_SHOVEL, description = "Sklep z narzedziami"},
			{mark = "fluids", position = Position(5870, 1555, 7), markId = MAPMARK_STAR, description = "Zaopatrzenie magiczne"},
			{mark = "depo", position = Position(5889, 1558, 7), markId = MAPMARK_LOCK, description = "Depo"},
			{mark = "post", position = Position(5898, 1556, 6), markId = MAPMARK_FLAG, description = "Poczta"},
			{mark = "arm", position = Position(5853, 1558, 7), markId = MAPMARK_SWORD, description = "Skup uzbrojenia"},
			{mark = "jewelry", position = Position(5848, 1574, 7), markId = MAPMARK_KISS, description = "Jubiler"},
			{mark = "creatureproducts", position = Position(5838, 1575, 7), markId = MAPMARK_BAG, description = "Sprzedaz creatureproducts"},
			{mark = "paladinshop", position = Position(5864, 1577, 7), markId = MAPMARK_BAG, description = "Zaopatrzenie dla lucznikow"},
			{mark = "bank", position = Position(5893, 1558, 9), markId = MAPMARK_DOLLAR, description = "Bank"},
			{mark = "shophouse", position = Position(5842, 1560, 7), markId = MAPMARK_TICK, description = "Wyposazenie domu"},
			{mark = "food", position = Position(5874, 1576, 7), markId = MAPMARK_TICK, description = "Sklep z jedzeniem"},
			{mark = "komisarz", position = Position(5849, 1609, 7), markId = MAPMARK_TICK, description = "Komisarz Ryba"},
			{mark = "statue", position = Position(5824, 1514, 7), markId = MAPMARK_SWORD, description = "Trening offline"},
		}

		for i = 1, #configMarks do
			mark = configMarks[i]
			player:addMapMark(mark.position, mark.markId, mark.description)
		end
		npcHandler:say("Prosze bardzo. Zagladnij do mnie za jakis czas, mozliwe ze pojawia sie nowi NPC.", cid)
	elseif isInArray({"bless","blessy","blessing","blessings","blogoslawienstwo","blogoslawienstwa","blogoslaw","poblogoslawic", "poblogoslaw"}, msg ) then
			npcHandler:say("Blogoslawienstwo dla ciebie kosztuje "..totalBlessPrice.." zlota (na nowy konfesjonal!) i chroni Cie przed utrata ekwipunku, jak i zmniejsza kare za smierc. Czy chcesz, abym Cie poblogoslawil?", cid)
			npcHandler.topic[cid] = 1
	elseif isInArray({"awansowac","awans","promotion","promocja"}, msg ) then
	local vocation = player:getVocation()
	local promotion = vocation:getPromotion()
		if player:getVocation():getId() < 5 then
			if player:getLevel() > 19 then
				if player:removeMoney(4999) then
					player:setVocation(promotion)
					npcHandler:say("Awansuje cie uroczyscie na dzika jakich malo!", cid)
				else
					npcHandler:say("Musisz miec 4999 zlota na awans!", cid)
				end
			else
				npcHandler:say("Musisz miec minimum 20 poziom!", cid)
			end
		else
			npcHandler:say("Przeciez juz masz promocje!", cid)
		end
	elseif isInArray({"tak", "yes"}, msg ) and npcHandler.topic[cid] == 1 then
		if player:hasBlessing(5) then
			npcHandler:say("Juz Cie poblogoslawilem. Odezwij sie, gdy stracisz moja moc.", cid)
			npcHandler.topic[cid] = 0
		elseif player:removeMoney(totalBlessPrice) then 
			npcHandler:say("Dzieki Ci za ofiare. Idz w pokoju i badz blogoslawiony!", cid)
			for b = 1, 5 do
				player:addBlessing(b)
			end
		else
			npcHandler:say("Wybacz, ale abym Cie poblogoslawil musisz wpierw zlozyc ofiare na tace... skromne "..totalBlessPrice.." sztuk zlota.", cid)
		end
	elseif isInArray({"rany", "lecz", "ulecz", "heal", "uleczyc"}, msg) then
		npcHandler.topic[cid] = 0
		player:addHealth(9999)
		npcHandler:say("Zostales uzdrowiony.", cid)
		local conditions = { CONDITION_POISON, CONDITION_FIRE, CONDITION_ENERGY, CONDITION_BLEEDING, CONDITION_PARALYZE, CONDITION_DROWN, CONDITION_FREEZING, CONDITION_DAZZLED, CONDITION_CURSED }
		for i = 1, #conditions do
			player:removeCondition(conditions[i])

		end
    end
    return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

