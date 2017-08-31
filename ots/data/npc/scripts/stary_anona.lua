local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end


local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	local player = Player(cid)
	local condition = Condition(CONDITION_DROWN)
	condition:setParameter(CONDITION_PARAM_DELAYED, 1)
	condition:addDamage(15, 4000, -10)

	if isInArray({"sprzet", "sprzet wedkarski", "oferta", "ofert"}, msg) and npcHandler.topic[cid] == 0 then
		npcHandler:say("Aby zobaczyc, co mam w swojej ofercie, napisz {trade}.", cid)
	elseif isInArray({"zawody", "zawodach", "zawody wedkarskie", "chce"}, msg) and npcHandler.topic[cid] == 0 then
		if (player:getStorageValue(10100) < 1) then
			npcHandler:say("Zasady sa proste. Kto dzisiejszego dnia zlowi najwiecej ryb, wygrywa zawody. Chcesz wziac udzial?", cid)
			npcHandler.topic[cid] = 1
		else
			npcHandler:say("Bierzesz juz udzial w zawodach. Wszystko czego potrzebujesz masz w regulaminie.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif isInArray({"tak", "yes", "chce"}, msg) and npcHandler.topic[cid] == 1 then
		npcHandler:say("Okej! Trzymaj tutaj regulamin i zycze powodzenia!", cid)
		local book = doPlayerAddItem(cid, 1951, 1)
		 doSetItemText(book, "Regulamin zawodow wedkarskich\n\nZawody trwaja od momentu zapisania sie do konca niedzieli. Licza sie tylko zlowione ryby. Musisz posiadac swoj sprzet: wedke oraz robaki.\n\n\nzwykla ryba- 1pkt\nokon- 2pkt\nsczupak- 3pkt\npstrag- 5pkt\nmarlin- 30pkt\n\nZa event mozna zdobyc Tibia coinsy oraz lodke potrzebna do rozpoczecia questu Kolo Wedkarskie. ")
		player:setStorageValue(10100, 1)
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
	elseif isInArray({"nie", "nie chce", "no"}, msg) then
		npcHandler:say("I slusznie. Ten sport nie znosi amatorszczyzny.", cid)
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
	elseif isInArray({"karasie jedza gowno", "debil", "idiota", "chujowy wedkarz"}, msg) then
		npcHandler:say("Awrrrr!!!", cid)
		player:getPosition():sendMagicEffect(CONST_ME_EXPLOSIONAREA)
		player:addCondition(condition)
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
	end
return true
end

local function onAddFocus(cid)
	if os.date('%A') == 'Monday' then
		npcHandler:say("Nie przeszkadzaj mi, musze odpoczac po wczorajszych zawodach.", cid)
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
	elseif (os.date('%A') == 'Tuesday') or (os.date('%A') == 'Wednesday') or (os.date('%A') == 'Thursday') or (os.date('%A') == 'Friday') then
		npcHandler:say("Nastepne zaowody dopiero w niedziele. Wtedy przyjdz.", cid)
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
	elseif os.date('%A') == 'Saturday' then
		npcHandler:say("Nie mam czasu, przygotowuje sie do jutrzejszych zaowodow.", cid)
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
	elseif os.date('%A') == 'Sunday' then
		npcHandler:say("No witam, mam do zaoferowania {sprzet wedkarski} oraz skupuje ryby. A moze chcesz wziac udzial w {zawodach}?", cid)
	end
end


npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
