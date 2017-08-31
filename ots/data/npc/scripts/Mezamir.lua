local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = {
	{ text = "Nosz kurr.. maszyna chyba znow sie wlaczyla." },
	{ text = "...Nie warto bylo..." },
	{ text = "...oby znalazl sie ktos chcacy odwiedzic sfery..." },
}

npcHandler:addModule(VoiceModule:new(voices))

local greetMsg = {
	"..co by tu dzis... Oh hej! W jakim celu tu zawitales?"
}

local function greetCallback(cid)
	npcHandler:setMessage(MESSAGE_GREET, greetMsg[math.random(#greetMsg)])
	npcHandler.topic[cid] = 0
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "maszyna") or msgcontains(msg, "sfery") then
		npcHandler:say({
			"Poprzednie pokolenie tej wioski prowadzilo w podziemiach dziwne eksperymenty. Nikt nie wie dokladnie co tam sie dzialo. ...",
			"Prowadzili tam prace nad zywiolami, jednak ich badania wymknely sie spod kontroli. ...",
			"Tworzyli tam magiczne {kapliczki}, ktore jak sie okazalo wywoluja zle moce. Od czasu porzucenia badan nikt tam sie nie przedostal."
		}, cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "kapliczki") then
		npcHandler:say({
			"Poczatkowo mialy one sluzyc za zrodla elementarnej mocy wykorzystywanej do rozwijania zaklec i doskonalenia sztuki okielznywania zywiolow. ...",
			"Jednak jak juz wspominalem staly sie one zrodlem zlych mocy. W odpowiednich {sferach} strzega ich zywiolaki, ktorych odwagi pokonac nie mial nikt od porzucenia badan."
		}, cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "piekielna otchlan") or msgcontains(msg, "piekielne otchlanie") then
		npcHandler:say({"O to lepiej spytaj Mazariusa."}, cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "sferach") or msgcontains(msg, "sfery") or msgcontains(msg, "sfera") and player:getLevel() >= 80 then
		npcHandler:say({
			"Znane mi sa sfery czterech zywiolow, lodu, energii, ziemi oraz ognia. Trzeba przepedzic stamtad zle moce aby znow moc pozyskiwac energie zywiolow. Jestem jedyna osoba ktora wie jak sie tam przedostac ...",
			"Jest tam BARDZO niebezpiecznie, jednak wygladasz mi na osobe ktora mogla by temu podolac!!! Popros mnie o {misje} jesli jestes zainteresowany."
		}, cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "misja") or msgcontains(msg, "quest") then
		local value = player:getStorageValue(Storage.ElementalSphere.QuestLine)
		if value < 1 then
			if player:getLevel() >= 80 then
				if player:isSorcerer() then
					npcHandler:say({
						"No dobra, sluchaj wiec: Po pierwsze potrzebujesz zebrac 20 zaczarowanych rubinow jesli chcesz udac sie do ognistej sfery. Jesli udasz sie kilka pieter w glab mojej piwnicy znajdziesz tam maszyne, ktora przeniesie cie do niej. Aby ja uruchomic musisz wlozyc w nia wszystkie rubiny. ...",
						"Jesli juz tam sie przedostaniesz, zebrac musisz czastki zywiolu ognia. Na pewno zmierzysz sie z zwyiolakami ognia, jednak nie wiem dokladnie jak pozyskac z nich czesci zywiolow. ...",
						"Czastki te sluza do aktywowania kapliczki. Kiedy zostanie aktywowana zloz ktores cialo w jej obrebie, a pojawi sie strzegacy jej zywiolak. Pokonaj go i zbierz z niego skoncentrowany plomien. ...",
						"To tyle, jestes gotow?"
					}, cid)
				elseif player:isDruid() then
					npcHandler:say({
						"No dobra, sluchaj wiec: Po pierwsze potrzebujesz zebrac 20 zaczarowanych szmaragdow jesli chcesz udac sie do ziemnej sfery. Jesli udasz sie kilka pieter w glab mojej piwnicy znajdziesz tam maszyne, ktora przeniesie cie do niej. Aby ja uruchomic musisz wlozyc w nia wszystkie szmaragdy. ...",
						"Jesli juz tam sie przedostaniesz, zebrac musisz czastki zywiolu ziemi. Na pewno zmierzysz sie z zwyiolakami ziemi, jednak nie wiem dokladnie jak pozyskac z nich czesci zywiolow. ...",
						"Czastki te sluza do aktywowania kapliczki. Kiedy zostanie aktywowana zloz ktores cialo w jej obrebie, a pojawi sie strzegacy jej zywiolak. Pokonaj go i zbierz z niego skoncentrowana ziemie. ...",
						"To tyle, jestes gotow?"
					}, cid)
				elseif player:isPaladin() then
					npcHandler:say({
						"No dobra, sluchaj wiec: Po pierwsze potrzebujesz zebrac 20 zaczarowanych szafirow jesli chcesz udac sie do lodowej sfery. Jesli udasz sie kilka pieter w glab mojej piwnicy znajdziesz tam maszyne, ktora przeniesie cie do niej. Aby ja uruchomic musisz wlozyc w nia wszystkie szafiry. ...",
						"Jesli juz tam sie przedostaniesz, zebrac musisz czastki zywiolu lodu. Na pewno zmierzysz sie z zwyiolakami lodu, jednak nie wiem dokladnie jak pozyskac z nich czesci zywiolow. ...",
						"Czastki te sluza do aktywowania kapliczki. Kiedy zostanie aktywowana zloz ktores cialo w jej obrebie, a pojawi sie strzegacy jej zywiolak. Pokonaj go i zbierz z niego skoncentrowany lod. ...",
						"To tyle, jestes gotow?"
					}, cid)
				elseif player:isKnight() then
					npcHandler:say({
						"No dobra, sluchaj wiec: Po pierwsze potrzebujesz zebrac 20 zaczarowanych ametystow jesli chcesz udac sie do energetycznej sfery. Jesli udasz sie kilka pieter w glab mojej piwnicy znajdziesz tam maszyne, ktora przeniesie cie do niej. Aby ja uruchomic musisz wlozyc w nia wszystkie ametysty. ...",
						"Jesli juz tam sie przedostaniesz, zebrac musisz czastki zywiolu energii. Na pewno zmierzysz sie z zwyiolakami energii, jednak nie wiem dokladnie jak pozyskac z nich czesci zywiolow. ...",
						"Czastki te sluza do aktywowania kapliczki. Kiedy zostanie aktywowana zloz ktores cialo w jej obrebie, a pojawi sie strzegacy jej zywiolak. Pokonaj go i zbierz z niego skoncentrowana energie. ...",
						"To tyle, jestes gotow?"
					}, cid)
				end
			else
				npcHandler:say("Zadanie to jest dla ciebie zbyt niebezpiecznie, wroc do mnie jesli nabierzesz doswiadczenia.", cid)
				npcHandler.topic[cid] = 0
				return false
			end
			npcHandler.topic[cid] = 1
		elseif value == 1 then
			if player:getItemCount(player:isSorcerer() and 8304 or player:isDruid() and 8305 or player:isPaladin() and 8300 or player:isKnight() and 8306) > 0 then
				player:setStorageValue(Storage.ElementalSphere.QuestLine, 2)
				npcHandler:say({
					"Niesamowite! Niech spojrze.. Ach!, " .. (player:isSorcerer() and "WIECZNY PLOMIEN! Teraz potrzebujesz znalezc przedstawicieli innych profesji, ktorzy takze ukonczyli to zadanie. ..." or player:isDruid() and "MACIERZYSTA GLEBA! Teraz potrzebujesz znalezc przedstawicieli innych profesji, ktorzy takze ukonczyli to zadanie. ..." or player:isPaladin() and "NIESKAZITELNY KRYSZTAL LODU! Teraz potrzebujesz znalezc przedstawicieli innych profesji, ktorzy takze ukonczyli to zadanie. ..." or player:isKnight() and "CZYSTA ENERGIA! Teraz potrzebujesz znalezc przedstawicieli innych profesji, ktorzy takze ukonczyli to zadanie. ..."),
					"Udaj sie znow do piwnicy. Ponizej niej znajduje sie pomieszczenie, w ktorym powinno byc bezpiecznie. Waszym zadaniem jest naladowanie maszyn odpowiednich dla profesji skoncentrowanymi czastkami zywiolow. Wtedy uzyskacie mozliwosc przywolania Pana Zywiolow ...",
					"Na jego ciele uzyj obsydianowy noz, aby pozyskac czastke neutralnej materii. Ona posluzy jako dowod przywrocenia rownowagi i wygnania zlych mocy w sferach!!"
				}, cid)
			else
				npcHandler:say("Potrzebujesz czastke zywiolu " .. (player:isSorcerer() and "Ognistego" or player:isDruid() and "Ziemnego" or player:isPaladin() and "Lodowego" or player:isKnight() and "Energetycznego") .. " Pana Zywiolow. Wroc do mnie jesli ja zdobedziesz.", cid)
			end
			npcHandler.topic[cid] = 0
		elseif value == 2 then
			if player:removeItem(8310, 1) then
		npcHandler:say({
				"NIESAMOWITE! Sfery zywiolow sa teraz czyste od zlej energii. Bedzie mozna przywrocic pozyskiwanie energii zywiolow, jednak z wieksza ostroznoscia. Nalezy ci sie za to nagroda...",
				"Ah, i jeszcze jedno, mysle ze moge ci zdradzic sekret po tym wszystkim.. Natknales sie moze w podziemiach na ukryty teleport? Byl zabezpieczony magicznym zakleciem, ale specjalnie dla ciebie moge je sciagnac.",
				"Znajdziesz tam mojego znajomego, ktory od lat pilnuje w ukryciu przejscia do {piekielnych otchlani}. Byc moze pozwoli ci sie tam przedostac i pokonac najpotezniejszego z magow.."
				}, cid)
				player:addItem(player:isSorcerer() and 8867 or player:isDruid() and 8869 or player:isPaladin() and 8853 or player:isKnight() and 8883, 1)
				player:setStorageValue(Storage.ElementalSphere.QuestLine, 3)
			end
		end
	elseif npcHandler.topic[cid] == 1 and msgcontains(msg, "yes") or msgcontains(msg, "tak") then
		player:setStorageValue(Storage.ElementalSphere.QuestLine, 1)
		npcHandler:say("Swietnie, nie trac czasu! Wroc do mnie jesli zdobedziesz czastke zywiolu!", cid)
		npcHandler.topic[cid] = 0
	end
	return true
end


npcHandler:setMessage(MESSAGE_WALKAWAY, "Zegnaj")
npcHandler:setMessage(MESSAGE_FAREWELL, "Mam nadzieje ze jeszcze kiedys sie spotkamy.")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
