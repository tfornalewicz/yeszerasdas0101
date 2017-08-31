--[[

Achievements Lib Created By Eduardo Montilva (Darkhaos) for TFS 1.0

LAST UPDATE: 16 July 2014 (Tibia Update 10.50)

Functions:
	getAchievementInfoById(achievement_id)
	getAchievementInfoByName(achievement_name)
	getSecretAchievements()
	getPublicAchievements()
	getAchievements()
	Player:addAchievement(achievement_id/name[, showMsg])
	Player:removeAchievement(achievement_id/name)
	Player:hasAchievement(achievement_id/name)
	Player:addAllAchievements([showMsg])
	Player:removeAllAchievements()
	Player:getSecretAchievements()
	Player:getPublicAchievements()
	Player:getAchievements()
	isAchievementSecret(achievement_id/name)
	Player:getAchievementPoints()

Note: 	This lib was created following the data found in tibia.wikia.com.
		Achievements with no points (or points equal to 0) are achievements with no available info about points in tibia.wikia.com. These achievements should be updated
]]

ACHIEVEMENTS_BASE = 300000 -- base storage
ACHIEVEMENTS_ACTION_BASE = 20000 	--this storage will be used to save the process to obtain the certain achievement
									--(Ex: this storage + the id of achievement 'Allowance Collector' to save...
									-- ...how many piggy banks has been broken

achievements =
{
	[1] = {name = "Jestem Hardcorem", grade = 1, points = 3, description = "Awansuj na poziom 100"},
	[2] = {name = "Daj kamienia", grade = 1, points = 3, description = "Osiagnij 100 poziom skilla"},
	[3] = {name = "Action Man", grade = 1, points = 3, description = "Zabij 1000 potworow"},
	[4] = {name = "Rolnik szuka zony", grade = 1, points = 3, description = "Wez slub"},	--najpierw sprawdzic natanka
	[5] = {name = "TFNWNOGF", grade = 1, points = 3, description = "Rozwiedz sie"},	--najpierw sprawdzic natanka
	[6] = {name = "Kolumb", grade = 1, points = 3, description = "Przeplyn na kazda wyspe"},	-- nie dodalem
	[7] = {name = "Jestem koniem", grade = 1, points = 3, description = "Zdobadz pierwszego wierzchowca"},
	[8] = {name = "Top Model", grade = 1, points = 3, description = "Ubierz pelny addon"},
	[9] = {name = "Bloger modowy", grade = 1, points = 3, description = "Ubierz jeden dodatek z addonu"},
	[10] = {name = "Bordo", grade = 1, points = 3, description = "Zaloguj sie 14 dni z rzedu"},	-- nie dodalem
	[11] = {name = "WykoParty", grade = 1, points = 3, description = "Dolacz do party razem z 9 innymi graczami"},	--przetestowac
	[12] = {name = "Powrot do przeszlosci", grade = 1, points = 3, description = "Zaloguj sie 7 dni z rzedu"},	-- nie dodalem
	[13] = {name = "Gdzie byli rodzice", grade = 1, points = 3, description = "Badz on-line razem 100 godzin"},	--nie dodalem, tabela(onlinetime)
	[14] = {name = "Moj pierwszy raz", grade = 1, points = 3, description = "Otworz quest box"},
	[15] = {name = "WykoPoczta", grade = 1, points = 3, description = "Wyslij list, paczke i zabij 100 potworow"},	--nie dodalem, po co zabijac potwory do tego osiagniecia?
	[16] = {name = "Otylia Jedrzejczak", grade = 1, points = 3, description = "Przeplyn 5.000 kratek"},	--nie dodalem
	[17] = {name = "Kulczyk", grade = 1, points = 3, description = "Wydaj 1.000.000 gp u NPC"},	-- ale u jednego npc czy moze sie sumowac kilku? Za jednym razem?
	[18] = {name = "Wyloguje sie jak koledzy pozwola", grade = 1, points = 3, description = "Badz on-line przez 10 godzin bez przerwy"},	-- nie dodalem
	[19] = {name = "Amber Gold", grade = 1, points = 3, description = "Zdeponuj 500.000 gp do banku"},
	[20] = {name = "Tomb Rider", grade = 1, points = 3, description = "Otworz 10 questowych skrzynek"},
	[21] = {name = "Pomaranczka", grade = 1, points = 3, description = "Zaloguj sie 3 dni pod rzad"},	-- nie dodalem
	[22] = {name = "Szambonurek", grade = 1, points = 3, description = "Przejdz pod woda 10.000 kratek"},
	[23] = {name = "The Tibia Sims", grade = 1, points = 3, description = "Kup dom"},	-- brak systemu kupowania domkow
	[24] = {name = "So it begins", grade = 1, points = 3, description = "Awansuj na poziom 30"},
	[25] = {name = "Dill with it", grade = 1, points = 3, description = "Handluj z innym graczem"},
	[26] = {name = "YOLO", grade = 1, points = 3, description = "Wydaj 10.000.000 gp u NPC"},	--jednego czy kilku?
	[27] = {name = "Herkules", grade = 1, points = 3, description = "Osiagnij 50 poziom skilla"},
	[28] = {name = "Chlopiec do bicia", grade = 1, points = 3, description = "Ponies smierc 50 razy"},	--nie dodalem
	[29] = {name = "Should I Stay Or Should I Go", grade = 1, points = 3, description = "Badz on- line przez 5 godzin bez przerwy"},	--nie dodalem
	[30] = {name = "Braveheart", grade = 1, points = 3, description = "Zdobadz 500.000 doswiadczenia za jednym logowaniem"},	-- nie dodalem
	[31] = {name = "Przed wyruszeniem w droge nalezy zebrac druzyne", grade = 1, points = 3, description = "Badz czlonkiem gildii"},
	[32] = {name = "Sluga Bozy", grade = 1, points = 3, description = "Zakup Blessy"},	--nie wiem czy dziala kupno blessow
	[33] = {name = "2KC", grade = 1, points = 3, description = "Zakup Amulet Of Loss"},	--u natanka tylko bedzie mozna?
	[34] = {name = "Janusz Biznesu", grade = 1, points = 3, description = "Wystaw przedmiot na Markecie"},	--nie dodalem
	[35] = {name = "Penetrator", grade = 1, points = 3, description = "Oczysc z rdzy 300 przedmiotow"},
	[36] = {name = "Prawdziwy Polak", grade = 1, points = 3, description = "Napij sie alkoholu"},
	[37] = {name = "Farmer", grade = 1, points = 3, description = "Zdobadz 5 mountow"},
	[38] = {name = "Czarnoksieznik z krainy Oz", grade = 1, points = 3, description = "Uzyj 5.000 mana potionow"},
	[39] = {name = "Power Gamer", grade = 1, points = 3, description = "Zdobadz 1.000.000 doswiadczenia za jednym logowaniem"},	--nie dodalem
	-- ponizszych nie dodawalem
	[40] = {name = "Gladiator", grade = 1, points = 3, description = "Awansuj na poziom 200"},
	[41] = {name = "Indiana Jones", grade = 1, points = 3, description = "Otworz 20 questowych skrzynek"},
	[42] = {name = "Dobry Samarytanin", grade = 1, points = 3, description = "Wspomoz serwer"},
	[43] = {name = "Swinobicie", grade = 1, points = 3, description = "Rozbij swinke skarbonke 100 razy"},
	[44] = {name = "Tupu tup po sniegu", grade = 1, points = 3, description = "Rzuc sniezka w innego gracza"},
	[45] = {name = "Jestes zwyciezca", grade = 1, points = 3, description = "Odbierz nagrode ze skrzyni z nagrodami"},
	[46] = {name = "Dumbledore", grade = 1, points = 3, description = "Uzyj 10.000 mana potionow"},
	[47] = {name = "Usain Bolt", grade = 1, points = 3, description = "Przebiegnij 30.000 kratek"},
	[48] = {name = "Nie przeszkadzac", grade = 1, points = 3, description = "Zamknij 100 razy okno w domku"},
	[49] = {name = "Przeciag", grade = 1, points = 3, description = "Otworz 100 razy okno w domku"},
	[50] = {name = "Rolnik sam w dolinie", grade = 1, points = 3, description = "Zetnij 100 snopkow zboza"},
	[51] = {name = "Fanatyk Wedkarstwa", grade = 1, points = 3, description = "Zlow 500 ryb"},
	[52] = {name = "Forever Alone", grade = 1, points = 3, description = "Zgas 5 swieczek na Party Cake"},
	[53] = {name = "Na tapczanie siedzi len", grade = 1, points = 3, description = "Poloz sie w lozku 50 razy"},
	[54] = {name = "Trollsky", grade = 1, points = 3, description = "Uzyj Obsidian Knife 100 razy"},
	[55] = {name = "Waszka G", grade = 1, points = 3, description = "Uzyj maczety 50 razy"},
	[56] = {name = "Robert Maklowicz", grade = 1, points = 3, description = "Upiecz i udekoruj 20 ciast"},
	[57] = {name = "La Vida Loca", grade = 1, points = 3, description = "Uzyj 5 razy Firework Rocket"},
	[58] = {name = "Zlota Rybka", grade = 1, points = 3, description = "Zlap rybke do Empty Goldfish Bowl"},
	[59] = {name = "Jack Sparrow", grade = 1, points = 3, description = "Uzyj Treasure Map"},
	[60] = {name = "Gumis", grade = 1, points = 3, description = "Zjedz 100 razy jagody z krzaku"},
	[61] = {name = "Mini Lotto", grade = 1, points = 3, description = "Otworz 50 razy Lottery Ticket"},
	[62] = {name = "ADHD", grade = 1, points = 3, description = "Podejdz do depozytu 500 razy"},
	[63] = {name = "Kac Vegas", grade = 1, points = 3, description = "Wez slub pod wplywem alkoholu"},
	[64] = {name = "Gornik", grade = 1, points = 3, description = "Wykop 50 dziur za pomoca lopaty"},
	[65] = {name = "Janko Muzykant", grade = 1, points = 3, description = "Uzyj 100 razy dowolnego instrumentu"},
	[66] = {name = "Archeolog", grade = 1, points = 3, description = "Wykop 50 razy Scarab Coin"},
	[67] = {name = "Dekorator Wnetrz", grade = 1, points = 3, description = "Otworz 50 paczek z meblami"},
	[68] = {name = "Bill Gates", grade = 1, points = 3, description = "Zdeponuj 1.000.000 gp do banku"},
	[69] = {name = "Multi Multi", grade = 1, points = 3, description = "Otworz 100x Lottery Ticket"},
	[70] = {name = "No-life", grade = 1, points = 3, description = "Stamina ponizej 20 godzin"},
	[71] = {name = "Przegryw", grade = 1, points = 3, description = "Badz oniline przez 20 godzin bez przerwy"},
	[72] = {name = "Crystals in Love", grade = 1, points = 1, description = "You brought two loving crystals together. Perhaps they might even name one of their children after you. To bad you forgot to leave your calling card."},
	[73] = {name = "Gnome Friend", grade = 1, points = 2, description = "The gnomes are warming up to you. One or two of them might actually bother to remember your name. You're allowed to access their gnomebase alpha. You are prepared to boldly put your gib feet into areas few humans have walked before."},
	[74] = {name = "Gnome Little Helper", grade = 1, points = 1, description = "You think the gnomes start to like you. A little step for a Bigfoot but a big step for humanity."},
	[75] = {name = "Gnomelike", grade = 1, points = 3, description = "You have become a household name in gnomish society! Your name is mentioned by gnomes more than once. Of course usually by gnomish mothers whose children refuse to eat their mushroom soup, but you are certainly making some tremendous progress."},
	[76] = {name = "Honorary Gnome", grade = 2, points = 4, description = "You accomplished what few humans ever will: you truly impressed the gnomes. This might not change their outlook on humanity as a whole, but at least you can bathe in gnomish respect! And don't forget you're now allowed to enter the warzones!"},
	[77] = {name = "Lord of the Elements", grade = 2, points = 5, description = "Ukonczyles surrealistyczna podroz po sferach czterech zywiolow."}
}

ACHIEVEMENT_FIRST = 1
ACHIEVEMENT_LAST = #achievements

function getAchievementInfoById(id)
	for k, v in pairs(achievements) do
		if k == id then
			local t = {}
			t.id = k
			t.actionStorage = ACHIEVEMENTS_ACTION_BASE + k
			for inf, it in pairs(v) do
				t[inf] = it
			end
			return t
		end
	end
	return false
end

function getAchievementInfoByName(name)
	for k, v in pairs(achievements) do
		if v.name:lower() == name:lower() then
			local t = {}
			t.id = k
			t.actionStorage = ACHIEVEMENTS_ACTION_BASE + k
			for inf, it in pairs(v) do
				t[inf] = it
			end
			return t
		end
	end
	return false
end

function getSecretAchievements()
	local t = {}
	for k, v in pairs(achievements) do
		if v.secret then
			t[#t + 1] = k
		end
	end
	return t
end

function getPublicAchievements()
	local t = {}
	for k, v in pairs(achivements) do
		if not v.secret then
			t[#t + 1] = k
		end
	end
	return t
end

function getAchievements()
	return achievements
end

function isAchievementSecret(ach)
	local achievement
	if isNumber(ach) then
		achievement = getAchievementInfoById(ach)
	else
		achievement = getAchievementInfoByName(ach)
	end
	if not achievement then return print("[!] -> Invalid achievement \"" .. ach .. "\".") and false end

	return achievement.secret
end

function Player.hasAchievement(self, ach)
	local achievement
	if isNumber(ach) then
		achievement = getAchievementInfoById(ach)
	else
		achievement = getAchievementInfoByName(ach)
	end
	if not achievement then return print("[!] -> Invalid achievement \"" .. ach .. "\".") and false end

	return self:getStorageValue(ACHIEVEMENTS_BASE + achievement.id) > 0
end

function Player.getAchievements(self)
	local t = {}
	for k = 1, #achievements do
		if self:hasAchievement(k) then
			t[#t + 1] = k
		end
	end
	return t
end

function Player.addAchievement(self, ach, denyMsg)
	local achievement
	if isNumber(ach) then
		achievement = getAchievementInfoById(ach)
	else
		achievement = getAchievementInfoByName(ach)
	end
	if not achievement then return print("[!] -> Invalid achievement \"" .. ach .. "\".") and false end

	if not self:hasAchievement(achievement.id) then
		self:setStorageValue(ACHIEVEMENTS_BASE + achievement.id, 1)
		if not denyMsg then
			self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations! You earned the achievement \"" .. achievement.name .. "\".")
		end
	end
	return true
end

function Player.removeAchievement(self, ach)
	local achievement
	if isNumber(ach) then
		achievement = getAchievementInfoById(ach)
	else
		achievement = getAchievementInfoByName(ach)
	end
	if not achievement then return print("[!] -> Invalid achievement \"" .. ach .. "\".") and false end

	if self:hasAchievement(achievement.id) then
		self:setStorageValue(ACHIEVEMENTS_BASE + achievement.id, -1)
	end
	return true
end

function Player.addAllAchievements(self, denyMsg)
	for i = ACHIEVEMENT_FIRST, ACHIEVEMENT_LAST do
		self:addAchievement(i, denyMsg)
	end
	return true
end

function Player.removeAllAchievements(self)
	for k = 1, #achievements do
		if self:hasAchievement(k) then
			self:removeAchievement(k)
		end
	end
	return true
end

function Player.getSecretAchievements(self)
	local t = {}
	for k, v in pairs(achievements) do
		if self:hasAchievement(k) and v.secret then
			t[#t + 1] = k
		end
	end
	return t
end

function Player.getPublicAchievements(self)
	local t = {}
	for k, v in pairs(achievements) do
		if self:hasAchievement(k) and not v.secret then
			t[#t + 1] = k
		end
	end
	return t
end

function Player.getAchievementPoints(self)
	local points = 0
	local list = self:getAchievements()
	if #list > 0 then --has achievements
		for i = 1, #list do
			local a = getAchievementInfoById(list[i])
			if a.points > 0 then --avoid achievements with unknow points
				points = points + a.points
			end
		end
	end
	return points
end

function Player.addAchievementProgress(self, ach, value)
	local achievement = isNumber(ach) and getAchievementInfoById(ach) or getAchievementInfoByName(ach)
	if not achievement then
		print('[!] -> Invalid achievement "' .. ach .. '".')
		return true
	end

	local storage = ACHIEVEMENTS_ACTION_BASE + achievement.id
	local progress = self:getStorageValue(storage)
	if progress < value then
		self:setStorageValue(storage, math.max(1, progress) + 1)
	elseif progress == value then
		self:setStorageValue(storage, value + 1)
		self:addAchievement(achievement.id)
	end
	return true
end
