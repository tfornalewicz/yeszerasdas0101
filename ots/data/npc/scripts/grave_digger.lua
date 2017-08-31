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
	{text = 'Mam szpadle, liny, maczety, kosy i inne przydatne gadzety...'},
	{text = 'Wedki plecaki, robaki w korzystnej cenie ! '},
	{text = 'Jesli potrzebujesz sprzet niezbedny do eksplorowania terenu to dobrze trafiles.'},
	{text = 'Bez sprzetu na wyprawe? '},
	{text = 'Ludzie to nie maja wyobrazni mam nadzieje ze w koncu wejdzie ta ustawa i na zwiedzanie bedzie mozna chodzic tylko z licencja...'} }
	
npcHandler:addModule(VoiceModule:new(voices))

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
   
	local player = Player(cid)


-- ============ DO MISJI TRUDNE POCZATKI =============
   if (msgcontains(msg, "pomoc")) and player:getStorageValue(11019) > 0 and player:getStorageValue(11027) < 1 then
        player:setStorageValue(11027,1) -- lockujemy grave diggera jako wykonanego
        player:setStorageValue(11019,player:getStorageValue(11019) + 1) -- +1 zeby kolejnosc nie miala znaczenia
        selfSay('Potrzebuje pomocy, ale pewnie nie taka o jaka chodzi Rybie, natomiast jakbys chcial sie przydac to sie zglos do mnie.', cid)
-- ============ DO MISJI TRUDNE POCZATKI =============
-- YALAHARI MISJA 3 30/04/17
	elseif isInArray({"groby","grob","kopanie","cmentarz","cmentarze"},msg) and player:getStorageValue(11049) == 2 then
		selfSay('Groby to szukaj napewno na cmentarzu naszym oraz knurowskim i podobno gdzies na polnocy jakis jest',cid)
	elseif isInArray({"dziewica", "dusza", "dziewicy"}, msg) and player:getStorageValue(11049) == 1 then
		selfSay('Oo tak, pamietam jak za mlodu polowalismy na dziewice. Teraz te glupie dziewczyny puszczaja sie na lewo i prawo. Trudno o dziewice teraz.',cid)
		selfSay('Ale bardzo mozliwe, ze uda cie wycisnac cos z martwych juz dziewic. Takze jedyne rozwiazanie jakie widze, to lopata w dlon i kopanie grobow, czyli to co lubie najbardziej!',cid)
		selfSay('Jakbys nie mial czym kopac, to trzymaj moja stara saperke',cid)
		player:addItem(5710,1) -- dostaje light shovela
		player:setStorageValue(11049,2) -- idziemy dalej z questem
		player:setStorageValue(11059,8) -- do szansy na powodzenie ( kazdy grob daje 10% wiecej szansy
	end
-- YALAHARI MISJA 3 30/04/17
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
