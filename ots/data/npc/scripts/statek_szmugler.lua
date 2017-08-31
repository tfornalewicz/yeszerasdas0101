local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	if isInArray({"sail", "plyn", "podroz", "transport", "plynac", "plyn"}, msg) then
		local player = Player(cid)
		local modal = ModalWindow (2, "Statek", "Gdzie chcesz plynac?")  --zmien tytul okna i komunikat jezeli chcesz, id o numerze 1 mozesz zmienic, ale wtedy w creaturescript trzeba
	-- pamietaj ze id 100 oraz 101 jest wykorzystywane przez NPC addon

	--Tutaj miasta do wyboru (id ma sie zgadzac z tablicy miasta(creaturescript/script/statek.lua)... np. Sosnowiec to id nr 3)
	--Wywali blad, jezeli dasz id o numerze, ktorego elementu nie ma w tablicy

	--modal:addChoice(3, "Sosnowiec")
	--modal:addChoice(1, "Krakow")
	--modal:addChoice(2, "Radom")
	modal:addChoice(1, "Mirko Town")
	--modal:addChoice(2, "Tereny Jaszczurow")
	--modal:addChoice(3, "Kraina Smokow")
	modal:addChoice(2, "Kraina Aladyna")
	--modal:addChoice(5, "Amazonia")
	--modal:addChoice(6, "Atlantyda")
	modal:addChoice(3, "Skala Barbarzyncow")
	modal:addChoice(4, "Puerto de Mogan")
	modal:addChoice(5, "Fryst")
	modal:addChoice(6, "Kolobrzeg")
	modal:addChoice(7, "Opuszczona Kolonia")
	modal:addChoice(8, "Wyspa Upiorow")
	--modal:addChoice(9, "Bagna")
	modal:addChoice(9, "Cotopaxi")
	modal:addChoice(10, "Bananowo")
	modal:addChoice(11, "Praga Polnoc")
	modal:addChoice(12, "Cebulahar")


		-- przyciski oraz efekt klawiszy Enter/Escape
	modal:addButton(1, "Anuluj")
	modal:addButton(2, "Wybierz")
    modal:addButton(3, "Pomoc")
	modal:setDefaultEnterButton(2)
	modal:setDefaultEscapeButton(1)
	modal:sendToPlayer(player)
	--[[
	elseif  isInArray({"zadanie", "misja", "quest", "mission"}, msg) then
		npcHandler:say("Moj kolega nie wspominal, ze przyjdziesz. Porozmawiaj najpierw z nim.", cid)
	]]
	return true
end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
