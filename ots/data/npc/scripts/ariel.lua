local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

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
  -- ============= CZESC DO QUESTA "POMOC ARIELA" ================= 

  if (msgcontains(msg, "yes") or msgcontains(msg, "tak")) and npcHandler.topic[cid] == 1 and player:getStorageValue(11000) == 1 then   
    player:setStorageValue(11000, 2)
    selfSay('Bede ci bardzo wdzieczny i opowiem ci pewna historie jak mnie poprosisz!', cid)
    npcHandler.topic[cid] = 1
  end     

  if (msgcontains(msg, "yes") or msgcontains(msg, "tak")) and npcHandler.topic[cid] == 1 and player:getStorageValue(11000) < 1 then
    player:setStorageValue(11000, 1)
    selfSay('On uwielbial {heaven blossom}. Przynies mi prosze jedna sztuke.', cid)
    npcHandler.topic[cid] = 1
    end
   
  if (msgcontains(msg, "mission") or msgcontains(msg, "misja")) and player:getStorageValue(11000) == 3 then
    player:setStorageValue(11000, 4)
    player:addItem(7438, 1) -- dostaje Elvish Bow
    -- Q5.1
    player:addExperience(30000,true) -- 30k expa
    -- Q5.1
    selfSay('Az tutaj poczulem ten przyplyw pozytywnej energii, a kwiaty zaczely spiewac z radosci, dziekuje ci przyjacielu za pomoc. Oto twoja nagroda oraz jesli chcesz moge ci opowiedziec moja {historie}', cid)
    npcHandler.topic[cid] = 0
  end

  if (msgcontains(msg, "heaven blossom") or  msgcontains(msg, "mission") ) and player:getStorageValue(11000) == 1 and player:getItemCount(5921) > 0 then
    selfSay('Sa sliczne, jeszcze przed zlozeniem musze je poswiecic. Zrobisz dla mnie jeszcze jedna rzecz i zaniesiesz je na grob mojego przyjaciela?', cid)
    npcHandler.topic[cid] = 1
  end

  if (msgcontains(msg, "mission") or msgcontains(msg, "misja")) and player:getStorageValue(11000) < 1 then
    selfSay('Od tygodnia mialem isc zerwac ulubione kwiaty przyjaciela i zlozyc na jego grobie, ale taki zabiegany jestem. Pomozesz mi?', cid)
    npcHandler.topic[cid] = 1
    end
  
  -- =========== KONIEC CZESCI QUESTA "POMOC ARIELA" =============
  -- ========== TU ZACZYNA SIE CZEsC DO 1 MISJI YALAHARI QUESTA ============
  if (msgcontains(msg, "historia") or msgcontains(msg, "historie")) and player:getStorageValue(11000) == 4 then
    selfSay('Ah tak, obiecalem ci opowiedziec swoja historie. Otoz pochodze z legendarnego miasta Yalahar, ktore znajdowalo sie na wyspie. Jednak wladcy tego miasta byli zbyt chciwi i wkoncu wszystkie nasze dzielnice sie zbuntowaly. Doszlo do wielkiej bitwy, ktora zostala zakonczona wybuchem bomby skonstruowanej przez szalonego alchemika.', cid)
    selfSay('Ja przezylem, poniewaz wyplynalem stamtad gdy tylko wybuchly zamieszki, niestety cala moja rodzina zginela. Oprocz mnie ucieklo jeszcze paru mieszkancow. Na poczatku trzymalismy sie razem, lecz potem oni woleli sie rozlaczyc. Ostatni raz widzialem Gertrude w dzungli. Konmuld natomiast poszedl zla droga i postanowil oddac sie czarnej magii. Reszty z mieszkancow nie znalem, ale moze Gertruda lub Konmuld beda wiedziec gdzie sa.', cid)
    selfSay('Natomiast nie wiem czy beda chcieli z toba rozmawiac, Yalaharianie sa strasznie nieufni do obcych, natomiast moge ci wyjawic nasze powitanie, lecz najpierw pomoz mi prosze zdobyc serce mojej ukochanej, zrobisz to dla mnie?', cid)
    npcHandler.topic[cid] = 1
    end
  if (msgcontains(msg, "yes") or msgcontains(msg, "tak")) and npcHandler.topic[cid] == 1 and player:getStorageValue(11000) == 4 then   
    player:setStorageValue(11002, 1) -- zaczynamy nowe id do questa
    -- createInvitation(player)
    player:addItem(26382,1) -- zaproszenie 
   -- player:addItem(ItemType(2333):getId(), 1) -- dostajemy list z zaproszeniem, na razie prowizoryczny
    selfSay('Wiedzialem, ze moge liczyc na twoja pomoc, ma na imie Madame Malkin, zajmuje sie sprzedarza roznych sukien dla magow. Przekaz prosze jej to zaproszenie na impreze i wroc do mnie z odpowiedzia.', cid)
    npcHandler.topic[cid] = 1
  end     
  if (msgcontains(msg, "zaproszenie") or msgcontains(msg, "madame") or msgcontains(msg, "mission")) 
          and player:getStorageValue(11002) == 2 
  then
      player:setStorageValue(11002,3)
      selfSay('Spodziewalem sie tego, ze nie bedzie chciala isc. Musze ja jakos do tego przekonac, ale brakuje mi pomyslow. Udaj sie prosze do mojego kolegi Old Postmana, on zawsze ma jakies dobre pomysly.',cid)
  end
  if (msgcontains(msg, "zaproszenie") or msgcontains(msg, "madame") or msgcontains(msg, "mission")) 
          and player:getStorageValue(11002) == 8 
  then
      player:setStorageValue(11002,9)
      selfSay('Zgodzila sie? Jak tego dokonaliscie? Zreszta to juz teraz nie wazne, dziekuje ci z calego serca. Prosze, przyjmij ten skromny podarunek oraz zgodnie z obietnica podaje ci nasze tajne haslo: Aloha',cid)
      selfSay('Wroc jeszcze do mnie kiedys z wizyta.',cid)
      player:addItem(5922, 5) -- dostaje Holy Orchid
      -- Q5.1
      player:addExperience(100000,true) -- 100k expa
      -- Q5.1
  end
  -- ========= A TUTAJ KONCZY =============
  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 

