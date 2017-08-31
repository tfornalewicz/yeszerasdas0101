local miasta = {
	[1] = Position(5980, 1502, 6), 	--Mirko Town
	[2] = Position(6740, 1357, 6), 	--Pustynia
	[3] = Position(7074, 801, 6),	--Dzungla
	[4] = Position(5539, 1509, 6),	--Knurowo
	[5] = Position(6602, 1877, 7),	--Sybir

}

local miasta_szmugler = {
	[1] = Position(3280, 1502, 6), 	--Mirko Town
	--[2] = Position(175, 1008, 7), 	--Jaszczurze Miasto
	--[3] = Position(599, 267, 7),    --Smoki, wyrmy, behemothy
	[2] = Position(2850, 376, 7), 	--Kraina Aladyna
	--[5] = Position(1900, 380, 7), 	--Amazonia
	--[6] = Position(1451, 272, 7), 	--Atlantyda
	[3] = Position(2344, 1736, 7),	--Skala Barbarzyncow
	[4] = Position(4069, 1080, 7),	--Puerto de mogan
	[5] = Position(2425, 1673, 7),	--Fryst
	[6] = Position(3506, 738, 7),	--Kolobrzeg
	[7] = Position(3860, 1405, 7),	--Opuszczona Kolonia
	[8] = Position(2530, 645, 7), 	--Wyspa Horrorow
	--[9] = Position(1322, 2012, 7),	--Bagna
	[9] = Position(3294, 1950, 7),	--Cotopaxi
	[10] = Position(4410, 418, 7),	--Bananowo
	[11] = Position(3885, 2489, 7), -- Praga polnoc
	[12] = Position(3441, 1736, 7) -- Cebulahar
}


function onModalWindow(cid, modalWindowId, buttonId, choiceId, item, position, pos, toPosition, fromPosition, itemEx)
local player = Player(cid)

    if (modalWindowId == 1 and (buttonId == 3)) or (modalWindow == 1 and player:isPzLocked()) then --pomoc //
		player:showTextDialog(2113, "Mozesz plywac miedzy miastami, jezeli masz odpowiednia ilosc pieniadzy przy sobie.\nNie mozesz byc rowniez podejrzany o morderstwo. \nAktualny koszt podrozy to 200gp. \n\nPosiadasz przy sobie "..player:getMoney().." zlota.")
   elseif modalWindowId == 1 and buttonId == 2 then --wybierz//
		if player:removeMoneyNpc(200) then
			local pozycja = miasta[choiceId]
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(pozycja)
			pozycja:sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:sendCancelMessage("Nie masz kasy.")
		end
	elseif modalWindowId == 2 and ( buttonId == 3) then
		player:showTextDialog( 2113, "Szmugler pozwoli Ci na podroz miedzy\n kontynentami i wyspami, w momecnie, gdy jestes podejrzany o morderstwo.\nWtedy domyslny przewoznik (Jacek Wrobel)\n odmowi zabrania Cie na poklad.\nWada Szmuglera jest jego koszt - 10000 zlota za jedna podroz. W tym momencie\n posiadasz przy sobie " .. player:getMoney() .. " zlota.")
	elseif modalWindowId == 2 and buttonId == 2 then
		if player:removeMoney( 10000 ) then
			local pozycja = miasta_szmugler[choiceId]
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo( pozycja )
			pozycja:sendMagicEffect( CONST_ME_TELEPORT )
		else
			player:sendCancelMessage("Spadaj zielonko, nie masz monet.")
		end

   end


end
