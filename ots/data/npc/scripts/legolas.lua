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
  
  if msgcontains(msg,"luk") then
    if player:getItemCount(2071) > 0 and player:getItemCount(5922) > 2 and player:getItemCount(2744) > 0 and player:getItemCount(7290) > 0 then
    -- 30/04/17 zmiana z icycle bow na musician
        player:addItem(10295,1) -- dostaje musicion bow ( do zamiany u kitza za icycle bow )
    -- 30/04/17 zmiana z icycle bow na musician
        player:removeItem(2071,1) -- zabieram lire
        player:removeItem(5922,3) -- zabieram 3 holyorchidy
        player:removeItem(2744,1) -- zabieram red rose
        player:removeItem(7290,1) -- zabieram shard
-- 07/05/16 zmiana tekstu
        selfSay('Trzymaj ten specjalny luk, stworzony dzieki magii elfow. I pozdrow Kitza.',cid)
-- 07/05/16 zmiana tekstu
    else
        selfSay('Aby wytworzyc luk potrzebuje liry, 3 holy orchidow, czerwonej rozy oraz odlamka lodu',cid)
    end
  end

  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 