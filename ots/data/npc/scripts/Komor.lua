local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = {
	{text = 'Antyki, meble z Ikei, wszystko czego zapragniesz ! Nasz klient nasz pan !'},
	{text = 'Pssst, nie chcesz moze zyrandolu z Palacu Prezydenckiego?'},
	{text = 'Kiedy pytaja mnie co robie aktualnie odpowiadam: handluje meblami !'},
	{text = 'Nareszcie wzialem kredyt i zmienilem prace !'},
	{text = 'Witam, witam, prosze zerknac na asortyment krzesel jaki posiadam, zaiste wyborny!'},
	{text = 'Paaaanie kochany, te meble to prosto z Belwederu !'} }

npcHandler:addModule(VoiceModule:new(voices))
-- ============ DO MISJI TRUDNE POCZATKI =============
local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
   
	local player = Player(cid)


   if (msgcontains(msg, "pomoc")) and player:getStorageValue(11019) > 0 and player:getStorageValue(11026) < 1 then
        player:setStorageValue(11026,1) -- lockujemy Komora jako wykonanego
        player:setStorageValue(11019,player:getStorageValue(11019) + 1) -- +1 zeby kolejnosc nie miala znaczenia
        selfSay('Drewno, drewno, mialo byc juz 2 dni temu, znowu pewnie jakas afera w Knurowie ze nie da sie przejechac', cid)
   end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
-- ============ DO MISJI TRUDNE POCZATKI =============
npcHandler:addModule(FocusModule:new())
