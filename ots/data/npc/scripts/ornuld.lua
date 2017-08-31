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
  -- =============  ADDON QUEST ================= 


   if isInArray({"yes","tak","ok","dobrze","pewnie"},msg) and npcHandler.topic[cid] == 1 then
        selfSay('Ostatnio kolekcjonuje egzotyczne zwierzeta i od jednego handlarza dowiedzialem sie o jaju Wyrmy.',cid)
        selfSay('Zdobadz prosze dla mnie jedno, podobno mozna znalezc legowiska Wrym gdzies w dzungli.',cid)
        player:setStorageValue(11068,1) -- zaczynamy klesta
   elseif isInArray({"lekarstwo","receptura"},msg) and player:getStorageValue(11068) < 1 then
        selfSay('Lekarstwo powiadasz? Ale ono nie jest takie tanie i w zasadzie mozesz mi pomoc w zamian, co ty na to?',cid)
        npcHandler.topic[cid] = 1
   elseif isInArray({"jajko","jajo","egg","wyrm"},msg) and player:getStorageValue(11068) == 2 then
        selfSay('Wspaniale jajko, troche peklo. Ale wciaz jestem ci niezmiernie wdzieczny, prosze. Oto lekarstwo!',cid)
        player:addItem(26391,1) -- dostaje lekarstwo
        player:setStorageValue(11068,3)
        -- Q5.1
        player:addExperience(150000,true) -- 150k expa
        -- Q5.1
   end
  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 

