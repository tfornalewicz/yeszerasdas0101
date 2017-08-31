local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local voices = {
	{text = 'Posiadam wiele przedmiotow, ale czy mam wszystkie? Nogi sobie nie dam za to uciac...'},
	{text = 'Od reki wymienisz u mnie wiele rzeczy, zapraszam serdecznie...'},
	{text = 'Oby tylko nie przyszla burza wraz z deszczem bo juz nie mam gdzie sie schowac..'},
	{text = 'Polecam zapoznac sie z moja oferta !'} }
	
npcHandler:addModule(VoiceModule:new(voices))

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if isInArray({"help", "przedmioty", "przedmiot", "item"}, msg) then
		npcHandler:say("Moge sie z Toba zamienic. W moim asortymencie jest {enchanted chicken wing}, {spirit container}, {flask of warrior's sweat}, {spool of yarn}, {huge chunk of crude iron}, {piece of royal steel}, {piece of draconian steel} oraz {magic sulphur}. Sprzedam Ci rowniez {damaged steel helmet}. Powiedz, ktory przedmiot Cie interesuje.", cid)
		npcHandler.topic[cid] = 0	
	elseif isInArray({"enchanted chicken wing", "chicken wing", "wing", "boots of haste", "boh"}, msg) then
		npcHandler:say("Czy masz ze soba buty predkosci? Za nic innego nie oddam tego zaczarowanego piora.", cid)
		npcHandler.topic[cid] = 1
	elseif isInArray({"spirit container", "spirit", "container"}, msg) then
		npcHandler:say("Masz ze soba dwa helmy z krolewskiej armii - {royal helmet}?", cid)
		npcHandler.topic[cid] = 2
	elseif isInArray({"flask of warrior's sweat", "flask of warriors sweat", "warriors sweat"}, msg) then
		npcHandler:say("Lubie zbierac helmy i rozne zbroje... Chcialbym dodac do swojej kolekcji cztery helmy, czesto uzywane przez wojownikow - {warrior helmet}. Jestes w ich posiadaniu?", cid)
		npcHandler.topic[cid] = 3
	elseif isInArray({"spool of yarn", "spool", "yarn"}, msg) then
		npcHandler:say("Zawsze bylem wielkim fanem czlowieka-pajaka. Obejrzalem wszystkie komiksy. Pamietam taka jedna burze, siedzialem wtedy przy transformatorze, a w rece mialem komiks Spidermana... No ale nieistotne - chcialbym garsc tworzywa, ktore wydzielaja pajaki. Masz moze? Przynajmniej pietnascie centymetrow.", cid)
		npcHandler.topic[cid] = 4
	elseif isInArray({"huge chunk of crude iron", "crude iron", "chunk of crude iron", "chunk"}, msg) then
		npcHandler:say("Widzisz, niektorzy nie sa tak hojnie obdarzeni, i musza sobie rekompensowac czym innym... no, tak czy siak. Masz moze ze soba {giant sword}?", cid)
		npcHandler.topic[cid] = 5
	elseif isInArray({"piece of royal steel", "royal steel"}, msg) then
		npcHandler:say("Moj znajomy, Michal Pirog, bardzo ladnie sie ubiera. Ja tez chce, ale bardziej w wojowniczym stylu. Chce od Ciebie kupic {Crown Armor}, zamiast tego - dam Ci {Piece of Royal Steel}. Chetny?", cid)
		npcHandler.topic[cid] = 6
	elseif isInArray({"piece of hell steel", "hell steel"}, msg) then
		npcHandler:say("He, he. Kiedys wujek jak wchodzil mi do wanny, zeby sprawdzic czy woda jest ciepla, pokazal mi ciekawa rzecz. Ta rzecz kojarzy mi sie z {Devils helmet}. Jesli chcesz, to sie wymienimy - ja Ci dam {Hell Steel}. To co?", cid)
		npcHandler.topic[cid] = 7
	elseif isInArray({"piece of draconian steel", "draconian steel"}, msg) then
		npcHandler:say("Lubie smoki. Jesli dasz mi {dragon shield}, to wzamian dostaniesz {Piece of Draconian Steel}. To jak?", cid)
		npcHandler.topic[cid] = 8
	elseif isInArray({"magic sulphur", "sulphur"}, msg) then
		npcHandler:say("Tak jak kazdy, mam trzy relatywnie duze otwory w ciele. No i lubie polykac. Dlatego... postanowilem pobawic sie w bycie polykaczem ogni. Masz moze trzy {Fire Sword}? Dam Ci za nie {magic sulphur} - dobrze kopie.", cid)
		npcHandler.topic[cid] = 9
	elseif isInArray({"damaged steel helmet", "steel helmet"}, msg) then
		npcHandler:say("Masz ze soba 100 000 zlota? Taniej go nie opyle, to unikat, z pierwszej wojny o Mirko Town, pomiedzy Rogalami a Rebornami.", cid)
		npcHandler.topic[cid] = 10
	elseif isInArray({"yes", "tak", "okej", "dobra"}, msg) and npcHandler.topic[cid] == 1 then
		if player:removeItem(2195, 1) then
			npcHandler:say("Oby Ci sie przydalo... bo zwrotow nie ma!", cid)
			player:addItem(5891, 1)
		else
			npcHandler:say("Najpierw musisz zalatwic sobie buty szybkosci. Wtedy mozemy porozmawiac.", cid)
		end
		npcHandler.topic[cid] = 0
	elseif isInArray({"yes", "tak", "okej", "dobra"}, msg) and npcHandler.topic[cid] == 2 then
		if player:removeItem(2498, 2) then
			npcHandler:say("Prosze, oto Twoj {spirit container}.", cid)
			player:addItem(5884, 1)
		else 
			npcHandler:say("Hej, nie klam, nie masz wymaganych przedmiotow.", cid)
		end
		npcHandler.topic[cid] = 0
	elseif isInArray({"yes", "tak", "okej", "dobra"}, msg) and npcHandler.topic[cid] == 3 then
		if player:removeItem(2475, 4) then
			npcHandler:say("Blech... masz to ohydztwo, {flask of warrior's sweat}.", cid)
			player:addItem(5885, 1)
		else
			npcHandler:say("E-e, to nie sa przedmioty ktore chce. Przyjdz z czterema {warrior helmet}.", cid)
		end
		npcHandler.topic[cid] = 0
	elseif isInArray({"yes", "tak", "okej", "dobra"}, msg) and npcHandler.topic[cid] == 4 then
		if player:removeItem(5879, 10) then
			npcHandler:say("Spoko, oto Twoj {spool of yarn}. A teraz spadaj, chce sie pobawic w spidermana.", cid)
			player:addItem(5886, 1)
		else
			npcHandler:say("Ej, chce 10 centymetrow {spider silk}, nie mniej, nie wiecej!", cid)
		end
		npcHandler.topic[cid] = 0
	elseif isInArray({"yes", "tak", "okej", "dobra"}, msg) and npcHandler.topic[cid] == 5 then
		if player:removeItem(2393, 1) then
			npcHandler:say("Jeeej! Mam wielki miecz! Szkoda tylko, ze miecz... No coz, ale prosze, masz {Huge Chunk of Crude Iron}.", cid)
			player:addItem(5892, 1)
		else
			npcHandler:say("*Mela chowa sie w transformatorze* nic o mnie nie wiesz! Nie pokazuj mi sie na oczy bez {Giant Sword}!", cid)
		end
		npcHandler.topic[cid] = 0
	elseif isInArray({"yes", "tak", "okej", "dobra"}, msg) and npcHandler.topic[cid] == 6 then
		if player:removeItem(2487, 1) then
			npcHandler:say("Dzieki, to kawalek tej zbroi, nie bede go potrzebowal - {Piece of Royal Steel}.", cid)
			player:addItem(5887, 1)
		else
			npcHandler:say("Nie masz tej fajnej zbroi przy sobie. Przynies, to wtedy pogadamy.", cid)
		end
		npcHandler.topic[cid] = 0
	elseif isInArray({"yes", "tak", "okej", "dobra"}, msg) and npcHandler.topic[cid] == 7 then
		if player:removeItem(2462, 1) then
			npcHandler:say("Oto Twoj {Piece of Hell Steel}.", cid)
			player:addItem(5888, 1)
		else
			npcHandler:say("Nie masz przy sobie {Devil Helmet}, sorry, nie moge Ci dac {Piece of Hell Steel} od tak.", cid)
		end
		npcHandler.topic[cid] = 0
	elseif isInArray({"yes", "tak", "okej", "dobra"}, msg) and npcHandler.topic[cid] == 8 then
		if player:removeItem(2516, 1) then
			npcHandler:say("Oto Twoj {Piece of Draconian Steel}. Tylko uwazaj, wystaje z niego jeszcze zab smoka.", cid)
			player:addItem(5889, 1)
		else
			npcHandler:say("Nie masz ze soba {Dragon Shield}... Przyznaj sie po prostu, ze boisz sie tych jaszczurek.", cid)
		end
		npcHandler.topic[cid] = 0
	elseif isInArray({"yes", "tak", "okej", "dobra"}, msg) and npcHandler.topic[cid] == 9 then
		if player:removeItem(2392, 3) then
			npcHandler:say("He, he, wiec tez wciagasz? No spoko, oto Twoja dzialka {Magic Sulphur}. Tylko uwazaj, bo kopie.", cid)
			player:addItem(5904, 1)
		else
			npcHandler:say("Co Ty, z bagiet jestes, czy jak? Nie masz trzech {Fire Sword}, spadaj, bo zaraz zawolam ziomeczka...", cid)
		end
		npcHandler.topic[cid] = 0
	elseif isInArray({"yes", "tak", "okej", "dobra"}, msg) and npcHandler.topic[cid] == 10 then
		if player:removeMoney(100000) then
			npcHandler:say("Spoko. Masz. Tylko nie mow od kogo wziales.", cid)
			player:addItem(5924, 1)
		else
			npcHandler:say("Nie masz tyle kasy, ziomeczku.", cid)
		end
		npcHandler.topic[cid] = 0
	elseif isInArray({"no", "nie", "nope"}, msg) then
		npcHandler:say("Nie, to nie. Spadaj.", cid)
		npcHandler.topic[cid] = 0
	end
	
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
