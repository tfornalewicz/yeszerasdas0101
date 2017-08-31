local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local voices = {
	{ text = 'Nie prowadze skupu detalicznego! Mniej niz sto butelek mnie nie interesuje.' },
	{ text = 'Jezeli chodzi o butelki alkoholowe, to tylko z zawartoscia...' },
	{ text = 'Wezme hurtem wszystkie butelki! Bedzie na amarene.' },
	{ text = 'Kierowniku zlociutki, ksieciuniu, daj dwa gp.' },
	{ text = 'VIP z Biedronki? Te siki? Pfff' },
	{ text = 'Wymiana pustych fiolek- butelek po miksturach!' }
}

npcHandler:addModule(VoiceModule:new(voices))

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if isInArray({"butelki", "vials", "flasks", "butelka", "flaszki", "wymiana", "empty vials"}, msg) then
		npcHandler:say("Dam Ci {lottery ticket} za 100 butelek, stoi?", cid)
		npcHandler.topic[cid] = 1
	elseif isInArray({"tak", "okej", "dobra", "yes", "stoi"}, msg) and npcHandler.topic[cid] == 1 then
		npcHandler.topic[cid] = 0
		if player:removeItem(7634, 100) or player:removeItem(7635, 100) or player:removeItem(7636, 100) then
			npcHandler:say("No i elegancko, o to Twoj {lottery ticket}.", cid)
			player:addItem(5957, 1)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Kogo ty chcesz oszukac? Przeciez nie masz stu butelek.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif  isInArray({"lottery ticket", "ticket", "lottery", "pomoc", "help", "informacje", "informacja"}, msg)  then
		npcHandler:say("Apropo defacto, za 100 pustych butelek, mozesz otrzymac ode mnie kupon lotto - Lottery Ticket... Jezeli masz odrobine szczescia, to zdobedziesz dodatek do stroju, mianowicie.", cid)
		npcHandler.topic[cid] = 0
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
