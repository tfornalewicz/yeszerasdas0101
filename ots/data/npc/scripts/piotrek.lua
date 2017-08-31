 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local ingredients = {
	[1] = {{2666, 2}, {8838, 20}, {8843, 1}, {9114, 1}, {2692, 5}, {2006, 2, 3}},
	[2] = {{7250, 2}, {2685, 2}, {8842, 1}, {2328, 2}, {2805, 1}, {2006, 1, 15}},
	[3] = {{4298, 1}, {8844, 3}, {2691, 5}, {2328, 2}, {2803, 1}, {2788, 5}},
	[4] = {{4265, 1}, {8841, 2}, {2675, 2}, {5097, 2}, {2006, 2, 14}, {2799, 1}},
	[5] = {{6574, 1}, {7966, 1}, {2676, 2}, {2006, 2, 6}, {2802, 1}, {2800, 1}},
	[6] = {{2684, 2}, {2685, 2}, {2686, 2}, {8842, 2}, {8843, 1}, {9114, 1}, {2696, 1}, {2787, 20}, {2789, 5}},
	[7] = {{8844, 10}, {2696, 2}, {2805, 1}, {2804, 1}, {2006, 1, 43}, {2328, 2}},
	[8] = {{2671, 1}, {8839, 5}, {8843, 1}, {8845, 2}, {2683, 1}, {8844, 2}},
	[9] = {{2669, 1}, {7158, 1}, {7159, 1}, {2670, 5}, {2690, 2}, {2801, 1}},
	[10] = {{2684, 5}, {2006, 1, 6}, {8841, 1}, {2692, 10}, {2328, 2}, {2687, 10}, {7910, 2}},
	[11] = {{2006, 5, 14}, {2789, 5}, {2788, 5}, {11246, 10}, {2670, 10}},
	[12] = {{11373, 5}, {2006, 2, 1}, {2684, 20}, {8838, 10}, {8844, 3}},
	[13] = {{6569, 3}, {2688, 3}, {6574, 2}, {6501, 15}, {6558, 1}},
	[14] = {{2328, 40}, {5097, 20}, {5902, 10}, {9674, 1}, {5942, 1}}
}

local function playerHasIngredients(cid)
	local player = Player(cid)
	local table = ingredients[player:getStorageValue(Storage.HotCuisineQuest.CurrentDish)]
	if table then
		for i = 1, #table do
			local itemCount = player:getItemCount(table[i][1], table[i][3] or -1)
			if itemCount < table[i][2] then
				itemCount = table[i][2] - itemCount
				return false
			end
		end
	end

	for i = 1, #table do
		player:removeItem(unpack(table[i]))
	end
	return true
end


local function greetCallback(cid)
	local player = Player(cid)
	if player:getStorageValue(Storage.HotCuisineQuest.QuestStart) < 1 then
		npcHandler:setMessage(MESSAGE_GREET, "Siemanko, witam w mojej {kuchni} Czego tu szukasz, |PLAYERNAME|?, Przyprowadzil cie ten piekny zapach?")
	else
		npcHandler:setMessage(MESSAGE_GREET, "Siemanko, witam ponownie w mojej kuchni, |PLAYERNAME|! Znow przyszedles zasiegnac troche sztuki kulinarnej godnej mistrza kuchni? Spytaj o {przepis} jesli chcesz kontynuowac.")
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "cook") or msgcontains(msg, "kuchnia") or msgcontains(msg, "kucharz") or msgcontains(msg, "kuchni") then
		if player:getStorageValue(Storage.HotCuisineQuest.QuestStart) < 1 then
			npcHandler:say({
					"Kocham gotowac i poznawac nowe smaki. Na co dzien pracuje we wloskiej restauracji jaki szef kuchni, gdzie oddaje sie swojej pasji.",
					"Uwielbiam dzielic sie swoimi {przepisami}, jesli takze chcesz troche poeksperymentowac w kuchni, to zapraszam."
 					}, cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "recipe") or msgcontains(msg, "menu") or msgcontains(msg, "przepis") or msgcontains(msg, "przepisami") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("Jestes nimi zainteresowany? No coz, nie dziwie sie. Nie sa one na sprzedaz, jednak mozesz zostac moim {pomocnikiem}, i poznac je od prawdziwego mistrza kuchni. Piszesz sie na to?", cid)
			npcHandler.topic[cid] = 2
		end
		if player:getStorageValue(Storage.HotCuisineQuest.QuestStart) == 1 then
			if player:getStorageValue(Storage.HotCuisineQuest.CurrentDish) == 1 then
				npcHandler:say({
					"Pierwsza potrawa, ktora przygotujemy jest {Rotworm Stew}.",
					"Przynies mi ponizsze skladniki, a pokaze ci jak to zrobic. ...",
					"Dwa miesa, dwie flaszki piwa, dwadziescia ziemniakow, cebulke, zabek czosnku i piec uncji maki."
				}, cid)
				npcHandler.topic[cid] = 4
			elseif player:getStorageValue(Storage.HotCuisineQuest.CurrentDish) == 2 then
				npcHandler:say({
					"Kolejna potrawa, ktora przygotujemy jest {Hydra Tongue Salad}.",
					"Przynies mi ponizsze skladniki, a pokaze ci jak to zrobic. ...",
					"Dwa hydra tongue, dwa pomidory, ogorek, dwa jaja, ziolo troll green oraz flaszke wina."
				}, cid)
				npcHandler.topic[cid] = 6
			elseif player:getStorageValue(Storage.HotCuisineQuest.CurrentDish) == 3 then
				npcHandler:say({
					"Kolejna potrawa, ktora przygotujemy jest {Roasted Dragon Wings}.",
					"Przynies mi ponizsze skladniki, a pokaze ci jak to zrobic. ...",
					"Martwy nietoperz, trzy papryczki jalapeno, piec chlebow razowych, dwa jaja, jeden powder herb i piec czerwonych muchomorow."
				}, cid)
				npcHandler.topic[cid] = 8
			elseif player:getStorageValue(Storage.HotCuisineQuest.CurrentDish) == 4 then
				npcHandler:say({
					"Kolejna potrawa, ktora przygotujemy jest {Tropical Fried Terrorbird}.",
					"Przynies mi ponizsze skladniki, a pokaze ci jak ja zrobic: Swiezy martwy kurczak, dwie cytryny, dwie pomarancze, dwa mango, jeden stone herb oraz dwie flaszki mleka kokosowego."
				}, cid)
				npcHandler.topic[cid] = 10
			elseif player:getStorageValue(Storage.HotCuisineQuest.CurrentDish) == 5 then
				npcHandler:say({
					"Kolejna potrawa, ktora przygotujemy jest {Banana Chocolate Shake}.",
					"Przynies mi ponizsze skladniki, a pokaze ci jak ja zrobic: tabliczka czekolady, ciasto kremowe, dwa banany, dwie flaszki mleka, jeden sling herb oraz star herb."
				}, cid)
				npcHandler.topic[cid] = 12
			elseif player:getStorageValue(Storage.HotCuisineQuest.CurrentDish) == 6 then
				npcHandler:say({
					"Kolejna potrawa, ktora przygotujemy jest {Veggie Casserole}.",
					"Przynies mi ponizsze skladniki, a pokaze ci jak to zrobic. ...",
					"Dwie marchwie, dwie pyry, dwie kolby kukurydzy, dwa ogorki, cebule, zabek czosnku, kawalek sera, dwadziescia bialych grzybow i piec brazowych."
				}, cid)
				npcHandler.topic[cid] = 14
			elseif player:getStorageValue(Storage.HotCuisineQuest.CurrentDish) == 7 then
				npcHandler:say({
					"Kolejna potrawa, ktora przygotujemy jest {Filled Jalapeno Peppers}.",
					"Przynies mi ponizsze skladniki, a pokaze ci jak to zrobic: Dziesiec papryczek jalapeno, dwa sery, jeden troll green oraz shadow herb, jeden vial of mead oraz dwa jaja."
				}, cid)
				npcHandler.topic[cid] = 16
			elseif player:getStorageValue(Storage.HotCuisineQuest.CurrentDish) == 8 then
				npcHandler:say({
					"Kolejna potrawa, ktora przygotujemy jest {Blessed Steak}.",
					"Przynies mi: szynke, piec sliwek, cebule, dwa buraki, dynie oraz dwie papryczki jalapeno."
				}, cid)
				npcHandler.topic[cid] = 18
			elseif player:getStorageValue(Storage.HotCuisineQuest.CurrentDish) == 9 then
				npcHandler:say({
					"Kolejna potrawa, ktora przygotujemy jest {Northern Fishburger}.",
					"Przynies mi ponizsze skladniki, a pokaze ci jak to zrobic: jedna northern pike, jedna rainbow trout, jedna green perch, piec krewetek, dwie bulki oraz lisc paproci."
				}, cid)
				npcHandler.topic[cid] = 20
			elseif player:getStorageValue(Storage.HotCuisineQuest.CurrentDish) == 10 then
				npcHandler:say({
					"Kolejna potrawa, ktora przygotujemy jest {Carrot Cake}.",
					"Przynies mi dane skladniki: piec marchewek, flaszke mleka, cytryne, dwie uncje maki, dwa jaja, dziesiec ciastek i dwa orzeszki ziemne."
				}, cid)
				npcHandler.topic[cid] = 22
			elseif player:getStorageValue(Storage.HotCuisineQuest.CurrentDish) == 11 then
				npcHandler:say({
					"Kolejna potrawa, ktora przygotujemy jest {Coconut Shrimp Bake}.",
					"Przynies mi dane skladniki: piec flaszek mleka kokosowego, piec brazowych grzybow, piecz czerwonawych grzybow, dziesiec kulek ryzowych oraz dziesiec krewetek."
				}, cid)
				npcHandler.topic[cid] = 24
			elseif player:getStorageValue(Storage.HotCuisineQuest.CurrentDish) == 12 then
				npcHandler:say({
					"Kolejna potrawa, ktora przygotujemy jest {Blackjack}.",
					"Przynies mi dane skladniki: Piec pancerzy sandcrawlera, dwie flaszki wody, dwadziescia marchewek, dziesiec ziemniakow oraz trzy papryczki jalapeno."
				}, cid)
				npcHandler.topic[cid] = 26
			elseif player:getStorageValue(Storage.HotCuisineQuest.CurrentDish) == 13 then
				npcHandler:say({
					"Kolejna potrawa, ktora przygotujemy jest {Demonic Candy Balls}.",
					"Przynies mi dane skladniki: Dziesiec cukierkow, trzy laski cukrowe, dwie tabliczki czekolady, pietnascie piernikowych ludzikow oraz flaszke skoncentrowanej demonicznej krwii."
				}, cid)
				npcHandler.topic[cid] = 28
			elseif player:getStorageValue(Storage.HotCuisineQuest.CurrentDish) == 14 then
				npcHandler:say({
					"Kolejna potrawa, ktora przygotujemy jest {Sweet Mangonaise Elixir}.",
					"Przynies mi dane skladniki: Czterdziesci jajek, 20 mango, 10 platow miodu, jedna bootle of bug milk oraz blessed wooden stake."
				}, cid)
				npcHandler.topic[cid] = 30
			end
		elseif player:getStorageValue(Storage.HotCuisineQuest.QuestStart) == 2 then
			npcHandler:say("Mozesz teraz ugotowac kazda potrawe z listy, ktora zechcesz: {Rotworm Stew, Hydra Tongue Salad, Roasted Dragon Wings, Tropical Fried Terrorbird, Banana Chocolate Shake, Veggie Casserole, Filled Jalapeno Peppers, Blessed Steak, Northern Fishburger, Carrot Cake, Coconut Shrimp Bake, Blackjack, Demonic Candy Balls, Sweet Mangonaise Elixir}.", cid)
		end
	elseif msgcontains(msg, "apprentice") or msgcontains(msg, "pomocnik") or msgcontains(msg, "pomocnikiem") then
		if npcHandler.topic[cid] == 2 then
			npcHandler:say("No, wygladasz obiecujaco. Moge dac ci szance. Na pewno chcesz zostac pomocnikiem, |PLAYERNAME|?", cid)
			npcHandler.topic[cid] = 3
		end
	elseif msgcontains(msg, "yes") or msgcontains(msg, "tak") then
		if npcHandler.topic[cid] == 3 then
			npcHandler:say("No dobra. Spytaj mnie o {przepis} a postaram ci przekazac niezbedna wiedze. Niektore skladniki sa ciezkie do zdobycia, ale moze podpowiem ci cos o nich.", cid)
			player:setStorageValue(Storage.HotCuisineQuest.QuestStart, 1)
			player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 1)
			player:setStorageValue(Storage.HotCuisineQuest.QuestLog, 1)
		elseif npcHandler.topic[cid] == 5 then
			if playerHasIngredients(cid) then
				npcHandler:say({
					"Zaczynajmy wiec ...",
					"Troche tego, pokroic to... wrzucamy tutaj ...",
					"O prosze!",
					"Mysle ze wszystko zrozumiale. Oto twoja potrawa!"
				}, cid)
				player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 2)
				player:setStorageValue(Storage.HotCuisineQuest.QuestLog, 2)
				player:addItem(9992, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Upewnij sie, ze masz wszystkie skladniki.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 7 then
			if playerHasIngredients(cid) then
				npcHandler:say({
					"Zaczynajmy wiec ...",
					"Troche tego, pokroic to... wrzucamy tutaj ...",
					"O prosze!",
					"Mysle ze wszystko zrozumiale. Oto twoja potrawa!"
				}, cid)
				player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 3)
				player:setStorageValue(Storage.HotCuisineQuest.QuestLog, 3)
				player:addItem(9993, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Upewnij sie, ze masz wszystkie skladniki.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 9 then
			if playerHasIngredients(cid) then
				npcHandler:say({
					"Zaczynajmy wiec ...",
					"Troche tego, pokroic to... wrzucamy tutaj ...",
					"O prosze!",
					"Mysle ze wszystko zrozumiale. Oto twoja potrawa!"
				}, cid)
				player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 4)
				player:setStorageValue(Storage.HotCuisineQuest.QuestLog, 4)
				player:addItem(9994, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Upewnij sie, ze masz wszystkie skladniki.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 11 then
			if playerHasIngredients(cid) then
				npcHandler:say({
					"Zaczynajmy wiec ...",
					"Troche tego, pokroic to... wrzucamy tutaj ...",
					"O prosze!",
					"Mysle ze wszystko zrozumiale. Oto twoja potrawa!"
				}, cid)
				player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 5)
				player:setStorageValue(Storage.HotCuisineQuest.QuestLog, 5)
				player:addItem(9995, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Upewnij sie, ze masz wszystkie skladniki.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 13 then
			if playerHasIngredients(cid) then
				npcHandler:say({
					"Zaczynajmy wiec ...",
					"Troche tego, pokroic to... wrzucamy tutaj ...",
					"O prosze!",
					"Mysle ze wszystko zrozumiale. Oto twoja potrawa!"
				}, cid)
				player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 6)
				player:setStorageValue(Storage.HotCuisineQuest.QuestLog, 6)
				player:addItem(9996, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Upewnij sie, ze masz wszystkie skladniki.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 15 then
			if playerHasIngredients(cid) then
				npcHandler:say({
					"Zaczynajmy wiec ...",
					"Troche tego, pokroic to... wrzucamy tutaj ...",
					"O prosze!",
					"Mysle ze wszystko zrozumiale. Oto twoja potrawa!"
				}, cid)
				player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 7)
				player:setStorageValue(Storage.HotCuisineQuest.QuestLog, 7)
				player:addItem(9997, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Upewnij sie, ze masz wszystkie skladniki.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 17 then
			if playerHasIngredients(cid) then
				npcHandler:say({
					"Zaczynajmy wiec ...",
					"Troche tego, pokroic to... wrzucamy tutaj ...",
					"O prosze!",
					"Mysle ze wszystko zrozumiale. Oto twoja potrawa!"
				}, cid)
				player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 8)
				player:setStorageValue(Storage.HotCuisineQuest.QuestLog, 8)
				player:addItem(9998, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Upewnij sie, ze masz wszystkie skladniki.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 19 then
			if playerHasIngredients(cid) then
				npcHandler:say({
					"Zaczynajmy wiec ...",
					"Troche tego, pokroic to... wrzucamy tutaj ...",
					"O prosze!",
					"Mysle ze wszystko zrozumiale. Oto twoja potrawa!"
				}, cid)
				player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 9)
				player:setStorageValue(Storage.HotCuisineQuest.QuestLog, 9)
				player:addItem(9999, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Upewnij sie, ze masz wszystkie skladniki.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 21 then
			if playerHasIngredients(cid) then
				npcHandler:say({
					"Zaczynajmy wiec ...",
					"Troche tego, pokroic to... wrzucamy tutaj ...",
					"O prosze!",
					"Mysle ze wszystko zrozumiale. Oto twoja potrawa!"
				}, cid)
				player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 10)
				player:setStorageValue(Storage.HotCuisineQuest.QuestLog, 10)
				player:addItem(10001, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Upewnij sie, ze masz wszystkie skladniki.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 23 then
			if playerHasIngredients(cid) then
				npcHandler:say({"Mysle ze wszystko zrozumiale. Oto twoja potrawa! Jesli chcesz to mozesz wziac ze soba moja {ksiazke kucharska}, lezy o, tu na polce."}, cid)
				player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 11)
				player:setStorageValue(Storage.HotCuisineQuest.QuestLog, 11)
				player:setStorageValue(Storage.HotCuisineQuest.CookbookDoor, 1)
				player:addItem(10000, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Upewnij sie, ze masz wszystkie skladniki.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 25 then
			if playerHasIngredients(cid) then
				npcHandler:say({
					"Zaczynajmy wiec ...",
					"Troche tego, pokroic to... wrzucamy tutaj ...",
					"O prosze!",
					"Mysle ze wszystko zrozumiale. Oto twoja potrawa!"
				}, cid)
				player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 12)
				player:setStorageValue(Storage.HotCuisineQuest.QuestLog, 13)
				player:addItem(12540, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Upewnij sie, ze masz wszystkie skladniki.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 27 then
			if playerHasIngredients(cid) then
				npcHandler:say({
					"Zaczynajmy wiec ...",
					"Troche tego, pokroic to... wrzucamy tutaj ...",
					"O prosze!",
					"Mysle ze wszystko zrozumiale. Oto twoja potrawa!"
				}, cid)
				player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 13)
				player:setStorageValue(Storage.HotCuisineQuest.QuestLog, 14)
				player:addItem(12542, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Upewnij sie, ze masz wszystkie skladniki.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 29 then
			if playerHasIngredients(cid) then
				npcHandler:say({
					"Zaczynajmy wiec ...",
					"Troche tego, pokroic to... wrzucamy tutaj ...",
					"O prosze!",
					"Mysle ze wszystko zrozumiale. Oto twoja potrawa!"
				}, cid)
				player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 14)
				player:setStorageValue(Storage.HotCuisineQuest.QuestLog, 15)
				player:addItem(12543, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Upewnij sie, ze masz wszystkie skladniki.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 31 then
			if playerHasIngredients(cid) then
				npcHandler:say({
					"Zaczynajmy wiec ...",
					"Troche tego, pokroic to... wrzucamy tutaj ...",
					"O prosze!",
					"Mysle ze wszystko zrozumiale. Oto twoja potrawa!"
				}, cid)
				player:setStorageValue(Storage.HotCuisineQuest.QuestStart, 2)
				player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 15)
				player:setStorageValue(Storage.HotCuisineQuest.QuestLog, 16)
				player:addItem(12544, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Upewnij sie, ze masz przy sobie niezbedne skladniki.", cid)
				npcHandler.topic[cid] = 0
			end
		end
	--Dishes first time
	elseif msgcontains(msg, "rotworm stew") then
		if npcHandler.topic[cid] == 4 or player:getStorageValue(Storage.HotCuisineQuest.QuestStart) == 2 then
			npcHandler:say("Przyniosles wszystkie niezbedne skladniki?", cid)
			player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 1)
			npcHandler.topic[cid] = 5
		end
	elseif msgcontains(msg, "hydra tongue salad") then
		if npcHandler.topic[cid] == 6 or player:getStorageValue(Storage.HotCuisineQuest.QuestStart) == 2 then
			npcHandler:say("Przyniosles wszystkie niezbedne skladniki?", cid)
			player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 2)
			npcHandler.topic[cid] = 7
		end
	elseif msgcontains(msg, "roasted dragon wings") then
		if npcHandler.topic[cid] == 8 or player:getStorageValue(Storage.HotCuisineQuest.QuestStart) == 2 then
			npcHandler:say("Przyniosles wszystkie niezbedne skladniki?", cid)
			player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 3)
			npcHandler.topic[cid] = 9
		end
	elseif msgcontains(msg, "tropical fried terrorbird") then
		if npcHandler.topic[cid] == 10 or player:getStorageValue(Storage.HotCuisineQuest.QuestStart) == 2 then
			npcHandler:say("Przyniosles wszystkie niezbedne skladniki?", cid)
			player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 4)
			npcHandler.topic[cid] = 11
		end
	elseif msgcontains(msg, "banana chocolate shake") then
		if npcHandler.topic[cid] == 12 or player:getStorageValue(Storage.HotCuisineQuest.QuestStart) == 2 then
			npcHandler:say("Przyniosles wszystkie niezbedne skladniki?", cid)
			player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 5)
			npcHandler.topic[cid] = 13
		end
	elseif msgcontains(msg, "veggie casserole") then
		if npcHandler.topic[cid] == 14 or player:getStorageValue(Storage.HotCuisineQuest.QuestStart) == 2 then
			npcHandler:say("Przyniosles wszystkie niezbedne skladniki?", cid)
			player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 6)
			npcHandler.topic[cid] = 15
		end
	elseif msgcontains(msg, "filled jalapeno peppers") then
		if npcHandler.topic[cid] == 16 or player:getStorageValue(Storage.HotCuisineQuest.QuestStart) == 2 then
			npcHandler:say("Przyniosles wszystkie niezbedne skladniki?", cid)
			player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 7)
			npcHandler.topic[cid] = 17
		end
	elseif msgcontains(msg, "blessed steak") then
		if npcHandler.topic[cid] == 18 or player:getStorageValue(Storage.HotCuisineQuest.QuestStart) == 2 then
			npcHandler:say("Przyniosles wszystkie niezbedne skladniki?", cid)
			player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 8)
			npcHandler.topic[cid] = 19
		end
	elseif msgcontains(msg, "northern fishburger") then
		if npcHandler.topic[cid] == 20 or player:getStorageValue(Storage.HotCuisineQuest.QuestStart) == 2 then
			npcHandler:say("Przyniosles wszystkie niezbedne skladniki?", cid)
			player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 9)
			npcHandler.topic[cid] = 21
		end
	elseif msgcontains(msg, "carrot cake") then
		if npcHandler.topic[cid] == 22 or player:getStorageValue(Storage.HotCuisineQuest.QuestStart) == 2 then
			npcHandler:say("Przyniosles wszystkie niezbedne skladniki?", cid)
			player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 10)
			npcHandler.topic[cid] = 23
		end
	elseif msgcontains(msg, "coconut shrimp bake") then
		if npcHandler.topic[cid] == 24 or player:getStorageValue(Storage.HotCuisineQuest.QuestStart) == 2 then
			npcHandler:say("Przyniosles wszystkie niezbedne skladniki?", cid)
			player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 11)
			npcHandler.topic[cid] = 25
		end
	elseif msgcontains(msg, "blackjack") then
		if npcHandler.topic[cid] == 26 or player:getStorageValue(Storage.HotCuisineQuest.QuestStart) == 2 then
			npcHandler:say("Przyniosles wszystkie niezbedne skladniki?", cid)
			player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 12)
			npcHandler.topic[cid] = 27
		end
	elseif msgcontains(msg, "demonic candy ball") then
		if npcHandler.topic[cid] == 28 or player:getStorageValue(Storage.HotCuisineQuest.QuestStart) == 2 then
			npcHandler:say("Przyniosles wszystkie niezbedne skladniki?", cid)
			player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 13)
			npcHandler.topic[cid] = 29
		end
	--elseif msgcontains(msg, "sweet mangonaise elixir") then
	--	if npcHandler.topic[cid] == 30 or player:getStorageValue(Storage.HotCuisineQuest.QuestStart) == 2 then
		--	npcHandler:say("Przyniosles wszystkie niezbedne skladniki?", cid)
		--	player:setStorageValue(Storage.HotCuisineQuest.CurrentDish, 14)
		--	npcHandler.topic[cid] = 31
		--end
	elseif msgcontains(msg, "no") or msgcontains(msg, "nie") then
		npcHandler:say("Nie?, wroc jak bedziesz gotow.", cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "bottle of bug milk") then
			npcHandler:say("Mozesz ja kupic u mojego przyjaciela w naszej wiosce.", cid)
	elseif msgcontains(msg, "coconut milk") or msgcontains(msg, "mleko kokosowe") then
			npcHandler:say("Musisz wycisnac kokosa aby zdobyc z niego mleko.", cid)
	elseif msgcontains(msg, "vial of mead") then
			npcHandler:say("Wiem ze lubuja sie w nim ogry. Ktos mi kiedys wspolminal, ze przechowuja go w beczkach po piwie.", cid)
	elseif msgcontains(msg, "hydra tongue") then
			npcHandler:say("Mozna pozyskac je z lezy hydr. Wiem ze jedno takie znajduje sie w poblizu wodospadu w dzunglii, gdzie kreci sie sporo krokodyli.", cid)
	elseif msgcontains(msg, "kulka ryzowa") then
			npcHandler:say("Moj przyjaciel z wioski potrafi je przygotowywac.", cid)
	elseif msgcontains(msg, "ksiazka kucharska") then
			npcHandler:say("Kazdy mistrz kuchni przygotowuje swoja wlasna ksiege najlepszych przepisow.", cid)
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())