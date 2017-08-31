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
  -- ============= Fan Arnolda ================= 

   if (msgcontains(msg,"mission") or msgcontains(msg,"misja")) then
      if player:getStorageValue(11039) == 1 and player:getItemCount(10295) > 0 then
         player:setStorageValue(11039,2) -- wykonana misja
         player:removeItem(10295,1) -- zabieramy musician's bow
         player:addItem(21696,1) -- icycle bow
        --  Q5.1
        player:addExperience(50000,true) -- 50k expa
        -- Q5.1
         selfSay('To jest ten luk? Chyba mnie te elfy w chuja zrobily, zrobie im takie Dominando...',cid)
         selfSay('Ale dzieki, wypelniles swoja misje, trzymaj tutaj w podziece taki drobiazg.',cid)
      elseif player:getStorageValue(11039) < 1 and player:getStorageValue(11030) == 6 then
      player:setStorageValue(11039,1)
         selfSay('Jak chcesz mi pomoc to zamowilem u elfow specjalny luk, zebym mogl robic swoje Dominando.',cid)
         selfSay('Zalatw mi je to cos sie zalatwi.',cid)
         npcHandler.topic[cid] = 1
      end
  -- ============= MISJA TRUDNE POCZATKI ================= 
      
   elseif msgcontains(msg,"Informacja") or msgcontains(msg,"Informacje") then
      selfSay('Na wschod jest cmentarz Mirkotown i za woda wieza tajemniczego maga. Przedzierajac sie przez bagna na poludniu dojdziesz do obozu mysliwych.',cid)
   end

  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 
