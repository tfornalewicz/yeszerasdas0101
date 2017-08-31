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


  local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
  local player = Player(cid)
  -- ============= YALAHARI MISSION 2 ================= 
   
    if (msgcontains(msg,"aloha")) then
    -- czy ma skonczoną pierwsza misje
      selfSay('Nie mam humoru na rozmowe z toba',cid)
    elseif isInArray({"yes","tak","ok"},msg) and npcHandler.topic[cid] == 3 and player:getStorageValue(11060) < 1 then
      if player:removeMoney(100000) then
        selfSay('Dzieki bro, teraz mam z czego zyc. To co ty chciales?',cid)
        player:setStorageValue(11060,1) 
      else
        selfSay('Sorki, ale nie masz tyle kasy',cid)
      end
    elseif isInArray({"maska","armor","spodnie"},msg) and npcHandler.topic[cid] > 1 then
      if isInArray({"Ptaaq","Wolf Sky","Wolfy","Hue hue"},player:getName()) and player:getStorageValue(11060) < 1 then
        selfSay('Wiesz co, brakuje mi kasy, jak chcesz ten item to dorzuc jeszcze 100k i bedzie git, ok?',cid)
        npcHandler.topic[cid] = 3
      else
        if msgcontains(msg,"maska") then
          player:addItem(9778,1) -- yalahari mask
          player:setStorageValue(11049,4)
        elseif msgcontains(msg,"armor") then
          player:addItem(9776,1) -- yalahari armor
          player:setStorageValue(11049,4)
        elseif msgcontains(msg,"spodnie") then
          player:addItem(9777,1) -- yalahari legs
          player:setStorageValue(11049,4)
        end
      end
    elseif isInArray({"mission", "misja", "yalahar", "gertruda", "yalahari"}, msg) and npcHandler.topic[cid] == 1 then
      if player:getStorageValue(11049) == 3 then
        selfSay('WSPANIALA! Stworze sobie z tej duszy, swoja wlasna dziewice.',cid)
        selfSay('Tak jak obiecalem, masz do wyboru: maska,spodnie,armor. Ktore wybierasz?',cid)
        npcHandler.topic[cid] = 2
      elseif player:getStorageValue(11049) < 1 then
        player:setStorageValue(11049,1) -- zaczynamy questa
        selfSay('Powiem ci jak zrobimy. Od paru lat zaglebiam sie w tajemna sztuke czarnej magii. Brakuje mi caly czas duszy dziewicy.',cid)
        selfSay('Nie wiem jak ja zdobyc, ale ktos napewno bedzie wiedzial. Dowiedz sie i przynies mi takowa. A obdaruje cie jedna z czesci z mojego starego stroju.',cid)
        -- if isInArray({"Ptaaq","Wolf Sky","Wolfy","Hue hue"},player:getName() then
        --     selfSay('Jesli chcesz zebym ci zlecil tego questa to zaplac 100k',cid)
        -- end
      end
    elseif (msgcontains(msg,"wodka") and player:getStorageValue(11002) == 9 and player:getItemCount(26387) > 0) and player:getStorageValue(11044) == 2 then
        player:removeItem(26387,1) -- zabieramy 1 wodke leszke
        selfSay('Teraz to mozemy rozmawiac. Co cie tu sprowadza?',cid)
        npcHandler.topic[cid] = 1
    end
  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 
