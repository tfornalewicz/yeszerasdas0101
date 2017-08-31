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
    selfSay('Dodatkowo trzymaj te oto naszyjnik i witaj w naszej spolecznosci.',cid)
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
      if player:getStorageValue(11017) < 1 and npcHandler.topic[cid] == 2 then
         player:setStorageValue(11017,1)
         player:addItem(5908,1) -- dostaje obsidian knife
         selfSay('Trzymaj ten noz, na pewno ci sie przyda.',cid)
      end   
   end

   if (msgcontains(msg,"mission") or msgcontains(msg,"misja")) then
   
      if player:getStorageValue(11017) == 2 then
         player:setStorageValue(11017,3) -- skonczona misja
         player:setStorageValue(11007,player:getStorageValue(11007) + 1) -- zwiekszamy licznik misji
        --  Q5.1
        player:addExperience(50000,true) -- 50k expa
         checkDruidsStatus(player)
        --  Q5.1
         selfSay('Dziekuje ci bardzo, byl taki wykonczony i ranny, gdyby nie ty, by pewnie umarl.',cid)
         selfSay('Zatrzymaj sobie noz w podziece za pomoc! Matka Natura takze ci wynagrodzi to kiedys!',cid)
      end
      if player:getStorageValue(11017) < 1 then
         npcHandler.topic[cid] = 1
         selfSay('To bylo straszne, te zielone stwory przyszly i pojmaly mojego {benka}.',cid)
      end
      
   end
   if (msgcontains(msg,"benka") or msgcontains(msg,"benek")) 
        and npcHandler.topic[cid] == 1 and player:getStorageValue(11017) < 1 then
        selfSay('To moj wilk, pojmaly go i zabraly gdzies, pomozesz mi go uratowac?',cid)
        npcHandler.topic[cid] = 2
   end
  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 

