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
  -- ============= Do questa na pick Axe =================
  if isInArray({"lodowe","lodowy","krysztaly","krysztal","kawalek","kawalki"},msg) then
        selfSay('Szukasz lodowego krysztalu? Musisz jej szukac w glebiach gory na poludniu wyspy.',cid)
        selfSay('Ale pamietaj, ze to nie jest zwykly krysztal i potrzebny ci bedzie {Lodowy kilof}, aby wydobyc choc kawalek tego krysztalu.',cid)
  elseif isInArray({"lodowy","kilof"},msg) and player:getStorageValue(11076) < 1 then
        selfSay('Mam jeden swoj lodowy kilof z dawnych czasow, ale napewno nie dam ci go za darmo.',cid)
        selfSay('Ale jak chcesz to mozesz pomoc mi i w zamian dostaniesz go, dobra?',cid)
        npcHandler.topic[cid] = 1
  elseif isInArray({"tak","yes","ok","pewnie"},msg) and npcHandler.topic[cid] == 1 and player:getStorageValue(11076) < 1 then
        player:setStorageValue(11076,1) -- zaczynamy questa
        selfSay('Jeszcze pare lat temu byl spokoj na wyspie, ale niestety musieli tutaj przybyc ci {barbarzyncy}. Panosza sie po calej wyspie i nie daja spokoju.',cid)
        selfSay('Sprobuj sie nimi zajac. Wiem, ze trudno bedzie wykurzyc wszystkich, ale przynies mi 20 ich czaszek, to przynajmniej troche ich ubedzie.',cid)
  elseif isInArray({"barbarian","Barbarzyncy","czaszki"},msg) then
        if player:getStorageValue(11076) == 1 and player:getItemCount(2229) > 19 then
            selfSay('Bardzo dobrze, niech gina. Trzymaj zaplate, tak jak sie umowilismy.',cid)
            player:setStorageValue(11076,2) -- koniec questa
            player:removeItem(2229,20) -- zabieramy czaszki
            player:addItem(4856,1) -- dostaje ice pickaxe
            -- Q5.1
            player:addExperience(100000,true) -- 100k expa
        else
            selfSay('Nie masz nawet 20 czaszek!',cid)
            -- Q5.1
        end
  end

  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 

