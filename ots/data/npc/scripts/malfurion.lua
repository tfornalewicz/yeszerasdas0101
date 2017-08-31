-- Q4 DRUID QUEST
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)     npcHandler:onCreatureAppear(cid)     end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)     end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()     npcHandler:onThink()     end

function checkDruidsStatus(cid) 
  local player = Player(cid)
  if player:getStorageValue(11007) == 4 then
    -- Q5.1
    player:addExperience(300000,true) -- 300k expa
    -- Q5.1
    selfSay('Za swoje zaslugi wsrod druidow mozesz isc do naszego swietego drzewa i pobraæ buklak wody z jaskini Hydr.',cid)
    selfSay('Nasze swiete drzewo znajduje sie w samym sercu dzungli.',cid)
  end
  if player:getStorageValue(11007) == 6 then
    -- Q5.1
    player:addExperience(500000,true) -- 500k expa
    -- Q5.1
    selfSay('Za twoje zaslugi wsrod druidow mozesz isc do naszego swietego drzewa i zerwac probke kwiatu Griffinclaw.',cid)
    selfSay('Nasze swiete drzewo znajduje sie w samym sercu dzungli.',cid)
    player:addItem(5940,1) -- dostaje naszyjnik
    selfSay('Dodatkowo trzymaj ten oto naszyjnik i witaj w naszej spolecznosci.',cid)
  end
end

function  creatureSayCallback(cid, type, msg)
   if(not npcHandler:isFocused(cid)) then
  return false
end

  local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
  local player = Player(cid)
  -- ============= MISJA 1 DRUID ADDON QUEST ================= 


   if (msgcontains(msg,"yes") or msgcontains(msg,"tak")) then
      if player:getStorageValue(11069) < 1 and npcHandler.topic[cid] == 1 then
         player:setStorageValue(11069,1)
         selfSay('No to super, jak znajdziesz to wroc do mnie.',cid)
      end   
   elseif (msgcontains(msg,"mission") or msgcontains(msg,"misja")) then
      if player:getStorageValue(11069) == 1 then
         selfSay('Ale blyszczacy, tak sadzilem ze dasz rade. Trzymaj w zamian taki drobiazg.',cid)
         player:addItem(18394,1) -- dostaje kule ( do questa u cygana ) --zmiana na bp
	player:addItem(7250,1)
         player:setStorageValue(11069,3) -- skonczona misja
         player:setStorageValue(11007,player:getStorageValue(11007) + 1) -- zwiekszamy licznik misji
        --  Q5.1
         player:addExperience(45000,true) -- 45k expa
        --  Q5.1
         checkDruidsStatus(cid)
      elseif player:getStorageValue(11069) < 1 then
         npcHandler.topic[cid] = 1
         selfSay('Zadanie chcesz zebym ci zlecil? Ostatnio mam duzo na glowie, a potrzebuje do eksperymentu kawalki lodowego krysztalu.',cid)
         selfSay('Zdobedziesz troche dla mnie? Na pewno sie odwdziecze!',cid)
      end
   end
  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 

