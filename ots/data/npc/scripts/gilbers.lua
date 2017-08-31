local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)     npcHandler:onCreatureAppear(cid)     end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)     end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()     npcHandler:onThink()     end
-- function createInvitation(player)
--    local intitation = player:addItem(12466,1)
-- 	if intitation then
--     intitation:setText("Zaproszenie na impreze dla Madame Malkin")
-- 		intitation:setDescription("Papier pachnacy kwiatami zawiniety blyszczaca wstazka")
-- 		intitation:setActionId(11006)
-- 		return true		
-- 	end
-- 	return false
-- end
function  creatureSayCallback(cid, type, msg)
   if(not npcHandler:isFocused(cid)) then
  return false
end

  local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
  local player = Player(cid)
  -- =============  ================= 
    if player:getStorageValue(11081) < 1 then
        player:setStorageValue(11081,0) -- zerowanie jak ktos dopiero zaczyna
    end
    if msgcontains("uklad",msg) then
        selfSay('No to sluchaj, mam pewne wtyki w administracji i jesli zrobisz cos dla mnie to moze uda mi sie ogarnac jakies bonusy na pewien czas.',cid)
        selfSay('Chodzi mi konkretniej o {skory} orkow, i ich {zeby}. Jak jakies zdobedziesz to zglos sie do mnie.',cid)
        selfSay('Jak cos to moge ci podac pelna {tabele} za ile punktow jaki bonus bedzie. No i zawolaj kolegow, im wiecej dostane tym lepszy bonus uzyskacie.',cid)
    elseif msgcontains("tabela",msg) or msgcontains("tabele",msg) then
        selfSay('No to sluchaj, skore orkow liczmy za 1 punkt, a ich zeby za 2 punkty. I tak jak mowilem, im wiecej tym lepszy {bonus} bedzie.',cid)
        selfSay('Jesli chcesz sprawdzic jak sobie radzicie to pytaj o {wynik}.',cid)
    elseif msgcontains("bonus",msg) then
	selfSay('Przez caly wtorek od 4 rano oraz srode bedziesz zdobywac wieksza ilosc doswiadczenia. Zbieranie trwa caly poniedzialek. Zdobywajac 1000pkt ilosc doswiadczenia zwiekszy sie o 30%, o 60% przy 2500pkt, oraz podwoi sie po uzyskaniu 5000pkt.',cid)
    elseif msgcontains("skory",msg) or msgcontains("skora",msg) or msgcontains("zeby",msg) or msgcontains("zab",msg) then
        if player:getItemCount(11113) > 0 or player:getItemCount(12435) > 0 then
            local count = player:getItemCount(12435)
            local count2 = player:getItemCount(11113)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Za oddanie "..count.." skor orkow otrzymujesz "..count.. " pkt.")
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Za oddanie "..count2.." zebow orkow otrzymujesz "..(count2*2).. " pkt.")
            player:setStorageValue(11081,player:getStorageValue(11081) + count) -- dodanie punktow za orc leather
            player:setStorageValue(11081,player:getStorageValue(11081) + (count2*2)) -- dodanie punktow za ork tooth
            player:removeItem(12435,count) -- zabieramy orc leather
            player:removeItem(11113,count2) -- zabieramy orc tooth
        end
    elseif msgcontains("wynik",msg) then
        local resultQuery = db.storeQuery("select sum(value) as result from player_storage as a where a.key = '11081'" )
        if resultQuery ~= false then
            local ret = result.getDataInt(resultQuery, "result")
            result.free(resultQuery)
            selfSay('Do tej pory macie ' ..ret.. ' pkt. Co jakis czas zliczam, bo zajmuje mi to chwile.',cid)
        end
    end
  return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 

