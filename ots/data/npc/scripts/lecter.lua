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
  -- ============= MILCZENIE OWIEC QUEST ================= 
    if isInArray({"mieso","ludzkie","ludzie","dusze","dusza","duszy"}, msg) then
        if player:getStorageValue(11065) < 1 then
            selfSay('Uwielbiam ludzkie miesko. Moze mi sprzedasz swoja rodzinke na zupe?',cid)
            selfSay('Albo chcesz zostac moim asystentem?',cid)
            selfSay('Niewazne, pierw musisz udowodnic, ze jestes silny to dam ci moje stare narzedzie, ktore uzywalem zanim zasmakowalo mi ludzkie miesko.',cid)
            selfSay('Przynies mi prosze 5 wampirzych zebow, bardzo dobre z nich igly sie robi.',cid)
            selfSay('Lec juz, bo zaraz sie na ciebie rzuce!',cid)
            player:setStorageValue(11065,1) -- zaczynamy klesta i misje 1
        elseif player:getStorageValue(11065) == 2 and player:getStorageValue(11066) < 1 then
            selfSay('A wiec chcesz mi dalej pomoc? To sluchaj, ostatnio oddalem sie szyciu, tylko nie zawsze pasuje sama ludzka skora.',cid)
            selfSay('Potrzebuje zatem jakis innych kolorow i materialow. Przynies mi prosze po 20 z kazdego rodzaju skory jaka znajdziesz.',cid)
            selfSay('Jak to zrobisz to naucze cie wszystkiego o skorowaniu.',cid)
            player:setStorageValue(11066,1) -- zaczynamy misje 2
        end
    elseif isInArray({"mission","misja","vampir","zeby"}, msg) and player:getStorageValue(11065) == 1 then
        if player:getItemCount(10602) > 4 then
            selfSay('Super sie spisales, napewno dobrze wykorzystasz to narzedzie!',cid)
            player:removeItem(10602,5) -- zabieramy 5 zebow wampirow
            player:addItem(5942,1) -- dostaje wooden stejka
            -- Q5.1
            player:addExperience(30000,true) -- 30k expa
            -- Q5.1
            selfSay('Wroc do mnie jak bedziesz chcial poznac prawdziwy smak!',cid)
            player:setStorageValue(11065,2) -- konczymy ta czesc questa
        else
            selfSay('No i po co mi przychodzisz bez zebow wampirow? Mam ci twoje zabrac?',cid)
            selfSay('Wroc jak tylko wykazesz, ze bedziesz silny na uzywanie tego narzedzia.',cid)
        end
    elseif isInArray({"mission","misja","skory","skora"}, msg) and player:getStorageValue(11066) == 1 then 
        if player:getItemCount(5876) > 19 -- lizard 
            and player:getItemCount(5877) > 19 -- green dragon
            and player:getItemCount(5878) > 19 -- minotaur
            and player:getItemCount(5948) > 19 -- red dragon
            and player:getItemCount(11196) > 19 -- crocodile leather
            and player:getItemCount(12435) > 19 -- orc leather
        then
            player:removeItem(5876,20)
            player:removeItem(5877,20)
            player:removeItem(5878,20)
            player:removeItem(5948,20)
            player:removeItem(11196,20)
            player:removeItem(12435,20)
            selfSay('Ooooo, ale bede miec teraz asortyment, jeszcze dla ciebie zaraz cos uszyje w zamian.',cid)
            selfSay('Apropo skorowanie to poradziles sobie dobrze, ale napewno nigdy nie skorowales ludzi.',cid)
            selfSay('Pamietaj, zeby zaczynac zawsze nacinanie pod pacha i ciagnac w dol.',cid)
            selfSay('To teraz jak juz wiesz jak skorowac ludzi, to idz pocwicz. A jak chcesz jeszcze cos to zglos sie do mnie po inne zadanie.',cid)
            player:setStorageValue(11066,2) -- koniec klesta -- to daje przepustke do skorowania ludzi
            -- Q5.1
            player:addExperience(150000,true) -- 150k expa
            -- Q5.1
        else
            selfSay('Nie masz wszystkich po 20. Wroc ze wszystkimi od razu!',cid)
        end
    elseif isInArray({"mission","misja","skory","skora"}, msg) and player:getStorageValue(11066) == 2 and player:getStorageValue(11067) < 1 then 
        selfSay('Aaa tak, cos do roboty? Wybieram sie na coroczne zebranie Kannibali i bym potrzebowal przygotowac jakies jedzonka, zeby tak nie przyjsc z pustymi rekami.',cid)
        selfSay('Dlatego jak juz znasz tajna sztuke skorowania ludzi, to pomozesz mi zebrac skladniki. Pozbieraj dla mnie 50 serc i 100 watrob ludzkich.',cid)
        player:setStorageValue(11073,1) -- zaczynamy questa
        player:setStorageValue(11074,0) -- 0 serc
        player:setStorageValue(11075,0) -- 0 watrob
    elseif isInArray({"mission","misja","skory","skora"}, msg) and player:getStorageValue(11073) == 1 and player:getStorageValue(11074) > 49 and player:getStorageValue(11075) > 99 then
        selfSay('Musisz bardziej uwazac wyciagajac je, bo niektore niezle pogniecione.',cid)
        selfSay('Uuu, ta jedna to niezle zapita watraba tibijska. Dobra, mimo wszystko zapraszam cie do klubu kanibali. Trzymaj swoj stroj!',cid)
        selfSay('I pamietaj, ze tylko ja jestem taki towarzyski dla obcych, inni kanibale nie beda z toba rozmawiac jak nie beda widziec, ze jestes jednym z nas.',cid)
        player:addOutfitAddon(366,0) -- wayfarer outfit
        player:setStorageValue(11073,2) -- koniec questa
        -- Q5.1
        player:addExperience(500000,true) -- 500k expa
        -- Q5.1
    end
  -- ============= MILCZENIE OWIEC QUEST ================= 
  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 
