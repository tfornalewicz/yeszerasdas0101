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
      if player:getStorageValue(11008) < 1 and npcHandler.topic[cid] == 1 then
         player:setStorageValue(11007,1)
         player:setStorageValue(11008,1)
         selfSay('Najlepiej jak zakradniesz sie do ich obozu i podpalisz ich zbior drewna. To powinno zajac im wiekszosc czasu i ocalic duza czesc zwierzat.',cid)
      end   
   end

   if (msgcontains(msg,"mission") or msgcontains(msg,"misja")) then
   
      if player:getStorageValue(11008) == 2 then
         player:setStorageValue(11008,3) -- skonczona misja
         player:setStorageValue(11007,player:getStorageValue(11007) + 1) -- zwiekszamy licznik misji
         player:addItem(5907,1) -- dostaje slingshota
        --  Q5.1
        player:addExperience(30000,true) -- 30k expa
        --  Q5.1
         selfSay('Idealnie, teraz beda musieli na nowa zbierac drewno. Dziekuje ci w imieniu {druidow}, jak bedziesz chcial to opowiem ci nieco o naszym cechu.',cid)
      end
      if player:getStorageValue(11008) < 1 then
         npcHandler.topic[cid] = 1
         selfSay('Chcesz mi pomoc? Niedlugo zaczyna sie sezon polowania na jelenie. Te biedne stworzenia sa w niebezpieczenstwie, a Hunterzy nie oszczedza zadnego.',cid)
         selfSay('Ale wiem jak mozemy im choc odrobine pomoc. Moge na ciebie liczyc?',cid)
      end
      
   end
   if (msgcontains(msg,"druid") or msgcontains(msg,"druidzi") 
                                or msgcontains(msg,"druidow")) 
      and player:getStorageValue(11008) == 3 then
      selfSay('Ah tak, obiecalem ci. Otoz na swiecie kiedys byl pokoj i my druidzi zylismy w dzungli, niestety nastaly zle czasy i z musilismy uciekac z naszej wioski i kazdy poszedl w inna strone',cid)
      selfSay('Zostalo nas 5, raz do roku spotykamy sie w wielkim drzewie. Jesli wykazesz sie wystarczajaca pomoca wobec nas, to rozwazymy twoje dolaczenie do naszej spolecznosci.',cid)
   end
  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 
