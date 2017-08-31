dofile('data/weekly.lua')


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
local function doPlayerAddPremiumPoints(cid, count)
		db.query('UPDATE accounts SET premium_points = premium_points+'.. count ..' WHERE id = ' .. getAccountNumberByPlayerName(getCreatureName(cid)))
end
  local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
  local player = Player(cid)

    if msgcontains("ogloszenie",msg) then
        for i = 1,#qconfig do
            if os.time() > qconfig[i].startdate and os.time() < qconfig[i].enddate then
                if player:getStorageValue(400+qconfig[i].questid) == 1 then
                    if player:getItemCount(qconfig[i].item) > (qconfig[i].required - 1) then
                        player:addExperience(qconfig[i].exp,true)
                        player:addMoney(qconfig[i].money)
                        doPlayerAddPremiumPoints(cid,qconfig[i].tc)
                        player:removeItem(qconfig[i].item,qconfig[i].required)
                        player:setStorageValue(400+qconfig[i].questid,2)
                        selfSay('Prosze, oto twoja zaplata!',cid)
                    else
                        selfSay('Nie masz wystarczajacej ilosci dowodow.',cid)
                    end
                end
            end
        end
    end

  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 

