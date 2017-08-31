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
    selfSay('Dodatkowo trzymaj te oto naszyjnik i witaj w naszej spolecznosci.',cid)
  end
end

function  creatureSayCallback(cid, type, msg)
   if(not npcHandler:isFocused(cid)) then
  return false
end

  local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
  local player = Player(cid)
  -- ============= DRUID ADDON QUEST ================= 

    if (msgcontains(msg,"mission") or msgcontains(msg,"misja")) then
      if player:getStorageValue(11067) == 1 and player:getItemCount(26391) > 0 then
         player:setStorageValue(11067,2) -- koniec questa
         player:addExperience(30000,true) -- 30k expa
         player:removeItem(26391,1) -- zabiera itemek
         player:addItem(13538,1) -- bamboo leaves
         player:setStorageValue(11007,player:getStorageValue(11007) + 1) -- zwiekszamy licznik misji
        -- Q5.1
        player:addExperience(50000,true) -- 50k expa
        -- Q5.1
         selfSay('Dziekuje ci z calego serca, wkoncu moj leon wyzdrowieje. Jako jeden z druidow dziekuje ci takze w imieniu Lasu.',cid)
         checkDruidsStatus(player)
      elseif player:getStorageValue(11067) < 1 then
         npcHandler.topic[cid] = 1
         selfSay('Przychodzisz zeby mi pomoc? Naprawde?',cid)
         selfSay('W takim razie jest jedna rzecz, ktora mozesz dla mnie zrobic. Ostatnio jedno z moich zwierzat zachorowalo.',cid)
         selfSay('A jedyne lekarstwo jakie mu pomoze posiada Ornuld, ale nie za bardzo mnie lubi i woli patrzec jak niewinne zwierze umiera.',cid)
         selfSay('Ale moze tobie sie uda od niego wydobyc ten tajny srodek, tylko nie mow, ze ja cie przyslalem. Znajdziesz go w zachodniej czesci dzungli, ma swoja mala wioske tam.',cid)
         player:setStorageValue(11067,1) -- zaczynamy questa
      end
   end
  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 

