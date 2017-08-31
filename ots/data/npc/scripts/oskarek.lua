-- === REV: 01        DATE: 26 Jan 2017     By: W     Tag: Q1*

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
  -- *Q1* Begin
  -- ============= Bilety na mecz ================= 
   if (msgcontains(msg,"yes") or msgcontains(msg,"tak")) then
      if player:getStorageValue(11041) < 1 and npcHandler.topic[cid] == 1 then
         player:setStorageValue(11041,1)
         selfSay('XXD DXDX XX X DXD XDXX XX  DDX DXX DDXX XX X XXX  DX XD  XDD XXX DXDX XXXX DDD DXX.',cid)
         selfSay('DDXX DXX DDD DXXX XD DXX DDXX  DDX DDD  D DDD  XDDX DDD DDXX XDD DDD XDXX X  DXDX XX  XDDX XDXX DXDD XDD XD DXDX  DD DDD XDDD XD  XDXX DDD DXX DXD XD.',cid)
      end      
   elseif (msgcontains(msg,"mecz") or msgcontains(msg,"legia")) then

      if player:getStorageValue(11041) < 1 then
         selfSay('XD XXXX,  D XD DXD DDXXDD  DD XX XD XDXX X DD  XX XXX DXDX  DX XD  XDXX X DDX XX X DDXXDD  XD XDXX X  XDDX XDX DDXX DXDD XXX DDXX X DXX XDXX  DDD DX XDX  XX  DDXX XD DXXX XDX XD XDXX  DD XX  DXXX XX XDXX X D DXDD.',cid)
         npcHandler.topic[cid] = 1
      end
  -- ============= MISJA TRUDNE POCZATKI ================= 
   elseif msgcontains(msg,"bilet") and player:getStorageValue(11041) == 2 and player:getItemCount(26389) > 0 then
      player:setStorageValue(11041,3)
      player:removeItem(26389,1) -- zabieramy bilet 
      -- Q5.1
      player:addExperience(50000,true) -- 50k expa
      -- Q5.1
      selfSay('XDD  XXX XXD DD XX X  XX  D XD DXD  DD XD DD  DDXX XD DXD XD DDXX  XXX D XD DXX XX DDD DX DDD XDD DXDD DDXXDD  XDD X DDXX  XXX DDD DXXX XX X  DDX DDD.',cid)
      selfSay('DX DDD  XX  DD DDD DDXX X XXX DDXX  DXD DDD XDX DDXX DXDD XXX D XD DXDX  DDXX  DD DDD XDDD X XDDD  XDXX DDD DXX DXD XX  XDDD XD DXD  DXDX XXXX DXDX X XXX DDXX.',cid)
   end
  -- *Q1* End
  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 


