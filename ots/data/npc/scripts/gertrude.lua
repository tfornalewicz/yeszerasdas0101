local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

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
	
  local player = Player(cid)
  -- ============= YALAHARI MISSION 2 ================= 
   
    if (msgcontains(msg,"aloha")) then
    -- czy ma skonczon¹ pierwsza misje
      if player:getStorageValue(11002) == 9 then 
        selfSay('Widze ze poznales jednego z naszych braci. Witaj w takim razie w naszej rodzinie, niewielu nas zostalo na tym swiecie.',cid)
        selfSay('Ale jak chcesz to moge opowiedziec ci czesc naszej historii.',cid)
        npcHandler.topic[cid] = 1
        -- Czy zaczal misje misja 2
      else
        selfSay('Nie wiem skad znasz to haslo, ale odejdz',cid) 
      end
    elseif (msgcontains(msg,"yes") or msgcontains(msg,"tak")) then
            if player:getStorageValue(11044) < 1 and npcHandler.topic[cid] == 2 then
                selfSay('Na zachod od mojej chaty jaszczury maja pole dziwnej rosliny. Nie wiem do konca co to jest, ale wiem ze robia z tego potezna wodke.',cid)
                selfSay('Raz jednemu wylecial buklak, wypilam 2 lyki i spalam nastepne 2 dni. Szykuje sie na podroz do mojego przyjaciela Konmulda, a on jak sie nie napije to nie jest zbyt rozmowny.',cid)
                selfSay('Zdobadz dla mnie prosze butelke tego trunku. Trzymaj ta butelke, mozesz do niej nalac',cid)
                player:addItem(2007,1) -- dostaje zwykla butelke
                player:setStorageValue(11044,1)
            end
        elseif (msgcontains(msg,"mission") or msgcontains(msg,"misja") or msgcontains(msg,"historia")) and npcHandler.topic[cid] == 1  then
            if player:getStorageValue(11044) < 1 then    
                selfSay('Opowiem ci wszystko co pamietam jak mi pierw pomozesz, piszesz sie na to?',cid)
                npcHandler.topic[cid] = 2
            end
    elseif (msgcontains(msg,"mission") or msgcontains(msg,"misja") or msgcontains(msg,"historia")) and player:getStorageValue(11044) == 1 and player:getItemCount(26387) > 0 then
        selfSay('Uuuu, przez korek czuje jej won, swietnie Ci poszlo. Opowiem ci jak to bylo.',cid)
        selfSay('Bylam czeladnikiem u wielkiego alchemika, tego ktory pewnie jak juz wiesz wysadzil cala wyspe, ale nie ufaj tym co mowia ze byl szalony.',cid)
        selfSay('Tak naprawde konstruowal mechanizm, ktory zamknalby cala wyspe polem silowym i zmusilby rzadzacych do poddania sie. Chcial aby wszyscy zyli w zgodzie.',cid)
        selfSay('Niestety rzadzacy dowiedzieli sie poprzez szpiegow i zmusili go do zmiany planow, poczatkowo mialy byc 2 male bomby, do stlumienia najsilniejszych dzielnic.',cid)
        selfSay('Ale to nie wystarczalo rzadzacym i chcieli wiekszej bomby, ktora w ostatecznosci zniszczyla cala wyspe, teraz zostaly tam ruiny, ale dalej wierze, ze kiedys odbudujemy Yalahar',cid)
        selfSay('Dodatkowo u alchemika zajmowalam sie tworzeniem roznych wywarow na codzienne problemy, jakbys mial problem i potrzebowal jakiegos skutecznego srodka to jestem tu dla ciebie.',cid)
        player:setStorageValue(11044,2) -- koniec klesta
        -- Q5.1
        player:addExperience(150000,true) -- 150k expa
        -- Q5.1
    elseif (msgcontains(msg,"szczur") or msgcontains(msg,"szczury")) and player:getStorageValue(11044) == 2 then
        if player:getStorageValue(11046) < 1 then
            selfSay('Potrzebujesz srodka na szczury? U nas w Yalahr nie ostal sie ani jeden. Przyrzadze ci specjalny srodek, ale musisz mi przyniesc jeden skladnik: splesnialy ser',cid)
            selfSay('Perfekcyjnie zwabia szczury, zatruje go specjalna substancja przez co wszystkie padna w jedna noc',cid)
            player:setStorageValue(11046,1) -- zaczynamy klesta
        elseif player:getStorageValue(11046) == 1 and player:getItemCount(2235) > 0 then
            selfSay('Ale pachnie, idealny. W miedzy czasie jak cie nie bylo przygotowalam wywar. Wstrzykniemy i gotowe.',cid)
            selfSay('Postaw na noc gdzies w piwnicy, a rano ujrzysz cmentarz.',cid)
            player:setStorageValue(11046,2) -- Gotowe do zaniesienia biedronce
        end
    end
  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 
