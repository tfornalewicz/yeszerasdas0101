local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 		npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "My name is Oldrak."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, text = "That's where we are. The world of Tibia."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, text = "I can offer you the holy tible for a small fee."})
keywordHandler:addKeyword({'trade'}, StdModule.say, {npcHandler = npcHandler, text = "I can offer you the holy tible for a small fee."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, text = "I can offer you the holy tible for a small fee."})
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, text = "I can offer you the holy tible for a small fee."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "Now, it is |TIME|."})

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, 'mission') or msgcontains(msg, 'demon oak') or msgcontains(msg, 'misja') or msgcontains(msg, 'demoniczny dab') then
		if player:getStorageValue(Storage.DemonOak.Done) < 1 and player:getStorageValue(Storage.DemonOak.Progress) < 2 then
			npcHandler:say("Skad o tym wiesz? Wszedles do zarazonej strefy?", cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(Storage.DemonOak.Progress) == 2 and player:getStorageValue(Storage.DemonOak.Done) < 1 then
			npcHandler:say("Lepiej tu nie wracaj, nim nie pokonasz Demonicznego Debu.", cid)
		elseif player:getStorageValue(Storage.DemonOak.Done) == 1 then
			npcHandler:say({
				"Znieszczyles demoniczny dab?!? Niesamowite!! Miejmy nadzieje, ze nie powroci. Do poki ziemia przesiaknieta bedzie zlem, nie mozemy byc pewni wygranej. Mimo wszystko demony poniosly strate, to pewne. ...",
				"Dzieki twojemu poczynaniu, wyjawie ci sekret, ktory byl ukrywany przez dziesiatki lat. Musisz udac sie na elficki cmentarz, kilka minut drogi na poludnie od Mirko Town. Na jednym z grobow napisane jest 'Grdhor Faelyn' czy cos takiego. ...",
				"Nalezy on do jednego z zasluzonych elfow, ktory polegl na wojnie z orkami. Grob prowadzi do skarbca, gdzie znajduje sie dobytek kilku pokolen jego rodu. Zasluzyles aby przygarnac jeden z przedmiotow, ktore sie tam znajduja. Powodzenia w poszukiwaniu!"
			}, cid)
			player:setStorageValue(Storage.DemonOak.Done, 2)
		end
	elseif msgcontains(msg, 'yes') or msgcontains(msg, 'tak') and npcHandler.topic[cid] == 1 then
		if player:getStorageValue(Storage.DemonOak.Progress) == 1 then
			npcHandler:say("Demoniczny Dab?!? Niech bogowie maja nas w opiece. Potrzebowal bedziesz {hallowed axe} aby pokonac to drzewo. Przynies mi zwykle {axe} a przygotuje je specjalnie dla ciebie.",cid)
			player:setStorageValue(Storage.DemonOak.Progress, 2)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Nie wierze w to! Jak smiesz oszukiwac mnicha!",cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'axe') or msgcontains(msg, 'topor') then
		if player:getStorageValue(Storage.DemonOak.Progress) == 2 then
			npcHandler:say("Ooo, masz je. Swietnie. Moge zrobic z niego hallowed axe. Zaplacisz mi za to... hmm... 1,000 zlota. W porzadku?",cid)
			npcHandler.topic[cid] = 2
		else
			npcHandler:say("Musimy porozmawiac o {demon oak} lub {mission} nim kontynuujemy.",cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'yes') or msgcontains(msg, 'tak') and npcHandler.topic[cid] == 2 then
		if player:getStorageValue(Storage.DemonOak.Progress) == 2 then
			if player:getMoney() >= 1000 then
				if player:removeItem(2386, 1) and player:removeMoney(1000) then
					npcHandler:say("Zobaczmy... o prosze. Blogoslawienstwa tego topora powinny pochlaniac zla energie. Nie wiem jak dlugo wytrzymaja, wiec lepiej sie pospiesz. Moge zaczarowac go ponownie kiedy tylko zechcesz.",cid)
					player:addItem(8293, 1)
					Npc():getPosition():sendMagicEffect(CONST_ME_YELLOWENERGY)
					npcHandler.topic[cid] = 0
				else
					npcHandler:say("Nie masz zadnego topora.",cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Nie posiadasz wystrarzcajaco pieniedzy.",cid)
				npcHandler.topic[cid] = 0
			end
		end
	elseif msgcontains(msg, 'no') or msgcontains(msg, 'nie') and npcHandler.topic[cid] == 1 then
		npcHandler:say("Daj znac jesli sie tam dostaniesz. Moze pomoge ci jesli dowiem sie z czym mamy do czynienia.",cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'no') or msgcontains(msg, 'nie') and npcHandler.topic[cid] == 2 then
		npcHandler:say("Nie to nie.",cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())