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

  -- PODPALACZ QUEST ---
  if (msgcontains(msg,"zapalniczke") or msgcontains(msg,"zapalniczka") 
                                     or msgcontains(msg,"bug") 
                                     or msgcontains(msg,"podpalic")) 
      and player:getStorageValue(11009) > 0 then
    selfSay('Jak chcesz zapalniczke to moge ci opchnac, wiecej za darmo nie dostaniesz. Jak cos to pisz {trade}.',cid)
  end
  if (msgcontains(msg,"jarac") or msgcontains(msg,"mission") or msgcontains(msg,"misja")) then
    if player:getStorageValue(11011) == 2 then
      player:setStorageValue(11011,3)
      player:addItem(2392) -- fire sword
      -- Q5.1
      player:addExperience(70000,true) -- 70k expa
      -- Q5.1
      selfSay('Eeeekstra to bylo, z daleka widze ten dym ktory zaraz bede wdychac.',cid)
      selfSay('Trzymaj za swoje zaslugi bron, ktora bedziesz mogl wszystko zawsze podpalac.',cid)
      selfSay('Odwiedz mnie jeszcze kiedys to cos jeszcze podpalimy.',cid)
      npcHandler.topic[cid] = 0
    end
    if player:getStorageValue(11010) == 3 and player:getStorageValue(11011) < 1 then
      selfSay('Raz z koleszkami mialem zabawe i sialismy w calym MirkoTown toksyczne kwiaty, jak sie pala to niezly z nich towar.',cid)
      selfSay('Niestety nie jestem w stanie ci powiedziec, ktore to dokladnie, bo wygladaja jak te zwykle czerwone kwiaty.',cid)
      selfSay('Jak je podpalisz to cale miasto bedzie na haju, zajmiesz sie tym?',cid)
      npcHandler.topic[cid] = 1
    end
    if player:getStorageValue(11010) == 2 then
      player:setStorageValue(11010,3)
      player:addItem(7430,1) -- dragonbone staff
      -- Q5.1
      player:addExperience(30000,true) -- 30k expa
      -- Q5.1
      selfSay('Szkoda, ze nie moge zobaczyc ich min jak to zobacza Xdd',cid)
      selfSay('Rozkrecasz sie, jak cie najdzie chetka to przyjdz po wiecej! Trzymaj za to laske prawdziwego jaracza!',cid)
      npcHandler.topic[cid] = 0
    end
    if player:getStorageValue(11009) == 3 and player:getStorageValue(11010) < 1 then
      selfSay('Jak jeszcze mieszkalem w MirkoTown to ogarnalem miejsce gdzie straznicy ida na przerwe, siedza przy ognisku i jedza.',cid)
      selfSay('Podpal im drzewo przy ktorym siedza, a napewno sie wkurza Xddd.',cid)
      selfSay('Piszesz sie na to?',cid)
      npcHandler.topic[cid] = 1
    end
    if player:getStorageValue(11009) == 2 then
      player:setStorageValue(11009,3)
      -- Q5.1
      player:addExperience(15000,true) -- 15k expa
      -- Q5.1
      selfSay('Zajebiscie sie jara stary, mam nadzieje ze straznicy nie beda za bardzo spaleni xDDD.',cid)
      selfSay('Widze ze spodobalo ci sie to, jak bedziesz miec ochote to pytaj, cos jeszcze podpalimy, a {zapalnicze} sobie zostaw.',cid)
      npcHandler.topic[cid] = 0
    end
    if player:getStorageValue(11009) < 1 then 
      selfSay('Oo tak, podpalil bym cos, moze te szczury z MirkoTown? Wyeksmitowali mnie przez moje zapedy pirotechniczne.',cid)
      selfSay('Chcesz cos ze mna podpalic?',cid)
      npcHandler.topic[cid] = 1
    end
  end
  if msgcontains(msg,"yes") or msgcontains(msg,"tak") then
    if npcHandler.topic[cid] == 1 and player:getStorageValue(11010) == 3 and player:getStorageValue(11011) < 1 then
      player:setStorageValue(11011,1)
      selfSay('Wiedzialem ze moge na ciebie liczyc, uwazaj tylko na ten stuff.',cid)
    end
    if npcHandler.topic[cid] == 1 and player:getStorageValue(11009) == 3 and player:getStorageValue(11010) < 1 then
      player:setStorageValue(11010,1)
      selfSay('Tylko nie traf na ich przerwe, bo nie mam dodatkowego lozka xD.',cid)
    end
    if npcHandler.topic[cid] == 1 and player:getStorageValue(11009) < 1 then
      player:setStorageValue(11009,1)
      player:addItem(5468,1) -- dostaje firebuga
      selfSay('To jak chcesz sie pobawic, to najpierw spal dla mnie ziolo, ktore zostalo w mojej chacie. Lepiej zeby straznicy nie znalezli go, bo bede musial jeszcze dalej uciekac.',cid)
      selfSay('Sam nie moge sie pokazywac w miescie, moja chata jest lezy na polnocy miasta, od razu poznasz ta meline xD.',cid)
      selfSay('Trzymaj {zapalniczke}, przyda ci sie.',cid)
    end
  end
  -- PODPALACZ QUEST ---

  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 
