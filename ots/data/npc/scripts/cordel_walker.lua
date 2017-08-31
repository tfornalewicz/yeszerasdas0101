local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)     npcHandler:onCreatureAppear(cid)     end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)     end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()     npcHandler:onThink()     end
-- function checkAwans(player) 

-- end
function  creatureSayCallback(cid, type, msg)
   if(not npcHandler:isFocused(cid)) then
  return false
end

local voices = {
	{text = 'Mam pewne ciekawe informacje o tutejszym terenie...'},
	{text = 'Moim glownym towarem eksportowym jest bol'},
	{text = 'Gdybym jadl wegiel, sralbym diamentami'},
	{text = 'Ochronie ta czesc mirko przed bandytami kopem z polobrotu '},
	{text = ' "Cause the eyes of a ranger are upon you.." '},
	{text = "Any wrong you do, he's gonna see"},
	{text = "When you're in Mirko, look behind you"},
	{text = "Cause that's where the ranger's gonna be"} }
	
npcHandler:addModule(VoiceModule:new(voices))


  local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
  local player = Player(cid)
  -- ============= chuck norris ================= 
   
   if (msgcontains(msg,"mission") or msgcontains(msg,"misja")) then

      if player:getStorageValue(11035) == 3 and player:getItemCount(26385) > 0 then
        player:removeItem(26385,1) -- zabieramy Liste
        player:setStorageValue(11035,4) -- konczymy klesta
        player:addItem(10016,1) -- Batwing Hat
        -- Q5.1
        player:addExperience(100000,true) -- 100k expa
        -- Q5.1
        selfSay('Trzymaj w nagrode ten kapelusz, szepne o tobie slowko komisarzowi.',cid)
      elseif player:getStorageValue(11035) == 1 and player:getItemCount(26385) > 0 then
         player:setStorageValue(11035,2)
         selfSay('Udalo ci sie wtargnac tam, niezle. Ale co to za jezyk? wydaje mi sie znajomy i wiem kto bedzie umial go przetlumaczyc.',cid)
         selfSay('Pojdz do mojego znajomego, ktory pracuje w Prince Kebab w <pustynne_miasto>.',cid)
      elseif player:getStorageValue(11035) < 1 and player:getStorageValue(11030) == 6 then
        player:setStorageValue(11035,1)
         if player:getStorageValue(11034) < 1 then
            player:setStorageValue(11034,1) -- ustawienie glownego questa
         end
         selfSay('Oczywiscie ze mam dla ciebie misje, zostaniesz tak jak ja straznikiem z MirkoTown.',cid)
         selfSay('Ostatnio dochodza mnie sluchy o jakichs nielegalnych interesach w wiosce bandytow. Ktos chyba danwo nie dostal z polobrotu.',cid)
         selfSay('Sprawdz to, wioska znajduje sie na wschodzie.',cid)
         npcHandler.topic[cid] = 1
      end
  -- ============= chuck norris ================= 
      
   elseif msgcontains(msg,"Informacja") or msgcontains(msg,"Informacje") then
      selfSay('Na polnoc od miasta znajduje sie kopalnia, na zachod od niej znajduje sie forteca orkow, oraz upiorne miasto. Na wschodzie znajduja sie leza smokow oraz oboz minotaurow. Jest tam tez przejscie w dalsza czesc kontynentu.',cid)
   end

  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 
