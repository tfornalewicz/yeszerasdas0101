local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

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

function onCreatureAppear(cid)     npcHandler:onCreatureAppear(cid)     end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)     end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()     npcHandler:onThink()     end

function  creatureSayCallback(cid, type, msg)
   if(not npcHandler:isFocused(cid)) then
  return false
end

  local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
  local player = Player(cid)
  -- ============= MISJA DRUID ADDON QUEST ================= 

   if (msgcontains(msg,"mission") or msgcontains(msg,"misja")) then
   
      if player:getStorageValue(11061) == 2 then
         player:setStorageValue(11061,3) -- skonczona misja
         Game.createMonster("Undead Cavebear",player:getPosition()) -- spawnuje czarem undead Cavebear
         selfSay('Czar dziala! Dzieki ci w imieniu {druidow} Trzymaj w zamian Ten oto amulet.',cid)
         player:setStorageValue(11007,player:getStorageValue(11007) + 1) -- zwiekszamy licznik misji
        -- Q5.1
        player:addExperience(50000,true) -- 50k expa
        -- Q5.1 
         checkDruidsStatus(player) -- sprawdzenie ktory etap
         player:addItem(23810,1) -- dostaje lion's heart amulet ( do mounta )
      end
      if player:getStorageValue(11061) < 1 then
         selfSay('Chcesz sie przysluzyc kregowi druidow. Poniewaz tak, jestem jednym z nich. Lecz wybralem pustynie, niz zielone tereny.',cid)
         selfSay('Jesli chcesz sie przysluzyc nam to zakradnij sie do obozu na polnocy, niedaleko wyspy piratow. Mieszkalem kiedys tam, ale przyszli bandyci i musialem uciekac daleko, az tutaj.',cid)
         selfSay('Gdzies niedaleko wody zakopalem tam kartke z zakleciem przywolujacym Nieumarlego niedzwiedzia.',cid)
         selfSay('Tylko zapamietaj czas i spal kartke jak najszybciej, na wszelki wypadek jakby cie zlapali po wykopaniu.',cid)
         selfSay('Jakbys nie mogl znalezc, to moze przyda ci sie {mapa}, mozesz ja dostac u mnie jesli chcesz.',cid)
         player:setStorageValue(11061,1) -- ustawienie questa
      end
   elseif (msgcontains(msg,"druid") or msgcontains(msg,"druidzi") 
                                or msgcontains(msg,"druidow")) 
      and player:getStorageValue(11061) == 3 then
      selfSay('Otoz na swiecie kiedys byl pokoj i my druidzi zylismy w dzungli, niestety nastaly zle czasy i z musilismy uciekac z naszej wioski i kazdy poszedl w inna strone',cid)
      selfSay('Zostalo nas 5, raz do roku spotykamy sie w wielkim drzewie. Jesli wykazesz sie wystarczajaca pomoca wobec nas, to rozwazymy twoje dolaczenie do naszej spolecznosci.',cid)
  elseif msgcontains(msg,"mapa") then
      if player:getItemCount(26393) < 1 then
        player:addItem(26393,1) -- dostaje mape
        selfSay('Trzymaj mape, powinna ci pomoc.',cid)
      else
        selfSay('Masz juz jedna mape!',cid)
      end
  end
  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 
