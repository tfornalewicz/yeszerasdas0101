local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end
 
local items = {
          item1 = {6500, 24838} -- item1 item que será pedido e que será dado na primeira troca
		 
}
local counts = {
          count1 = {30, 1}
		 
}
 
function creatureSayCallback(cid, type, msg)
          if(not npcHandler:isFocused(cid)) then
                    return false
          end
          local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
			local player = Player(cid)


	if msgcontains(msg, 'piekielna otchlan') or msgcontains(msg, 'piekielne otchlanie') then
		npcHandler:say({
			"Nigdy nie bylo to miejsce przyjazne smiertelnikom. Z tego powodu wlasnie ukryl sie tam jeden z najpotezniejszych magow naszych czasow.",
			"Nieznane nikomu korytarze wypelnione sa najstraszniejszymi kreaturami, podobno ukrywaja sie za nimi opetani {podwladni} poteznego maga, ktory przekazal im czesc swojej energii."
		}, cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'podwladni') then
		npcHandler:say({
			"Siedem poteznych bestii, ktorych nikt nawet nie podjal sie pokonac. Dopiero po pokonaniu ich wszystkich mozna dostac sie do glownej komnaty maga..",
			"Byc moze ty bedziesz pierwszy, ale na pewno nie uda ci sie to w pojedynke..",
			"Potwierdz jesli chcesz sie tego podjac."
		}, cid)
		npcHandler.topic[cid] = 1
	elseif npcHandler.topic[cid] == 1 and msgcontains(msg, "yes") or msgcontains(msg, "tak") or msgcontains(msg, "potwierdzam") then
		npcHandler:say({
			"Abym mial pewnosc, ze nie zginiesz tam zaraz po wejsciu, udowodnij mi swoje doswiadcznie, i pokonaj troche demonow znajdujacych sie po tej stronie swiata..",
			"Przynies mi 30 {demonicznych esencji} jako dowod, wtedy dam ci pozwolenie na przejscie.."
		}, cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'demoniczne esencje') or msgcontains(msg, 'demonic essence') then
		  if player:getStorageValue(88419) <= 0 then
			if getPlayerItemCount(cid, items.item1[1]) >= counts.count1[1] then
                              doPlayerRemoveItem(cid, items.item1[1], counts.count1[1])
                              doPlayerAddItem(cid, items.item1[2], counts.count1[2])
                              selfSay('Swietnie! Mozesz teraz uzyc mojego teleportu.', cid)
							 player:setStorageValue(88419, 1)
			else
                              selfSay('Potrzebujesz '.. counts.count1[1] ..' '.. getItemName(items.item1[1]) ..', aby uzyskac dostep.', cid)
			end
		else
          	selfSay('Posiadasz juz dostep.', cid)		
         end
          return TRUE
end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())