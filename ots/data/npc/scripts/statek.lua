local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local voices = {
	{text = 'Parostatkiem w piekny rejs...'},
	{text = '...Zabiore Cie wlasnie tam, gdzie pustyni zloty piach...'},
	{text = 'Zapraszam na poklad, poplyniemy w miejsca o ktorych nie sniles...'},
	{text = '...Przy wtorze klatw bosmana...'} }
	
npcHandler:addModule(VoiceModule:new(voices))

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	if isPlayerPzLocked( cid ) then
		npcHandler:say('Wygladasz jakbys sie przed chwila z kims bil... Lepiej odejdz.', cid)
		return false
	elseif isInArray({"sail", "plyn", "podroz", "transport", "plynac", "plyn"}, msg) then
		local player = Player(cid)
		local modal = ModalWindow (1, "Statek", "Gdzie chcesz plynac?")  --zmien tytul okna i komunikat jezeli chcesz, id o numerze 1 mozesz zmienic, ale wtedy w creaturescript trzeba
	-- pamietaj ze id 100 oraz 101 jest wykorzystywane przez NPC addon

	--Tutaj miasta do wyboru (id ma sie zgadzac z tablicy miasta(creaturescript/script/statek.lua)... np. Sosnowiec to id nr 3)
	--Wywali blad, jezeli dasz id o numerze, ktorego elementu nie ma w tablicy

	modal:addChoice(1, "Mirko Town")
	modal:addChoice(2, "Pustynia")
	modal:addChoice(3, "Dzungla")
	modal:addChoice(4, "Knurowo")
	modal:addChoice(5, "Sybir")





	-- przyciski oraz efekt klawiszy Enter/Escape
	modal:addButton(1, "Anuluj")
	modal:addButton(2, "Wybierz")
   	modal:addButton(3, "Pomoc")
	modal:setDefaultEnterButton(1)
	modal:setDefaultEscapeButton(2)	
	modal:sendToPlayer(player)
	return true
end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

