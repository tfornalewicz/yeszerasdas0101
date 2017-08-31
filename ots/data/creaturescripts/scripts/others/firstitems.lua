-- Without Rookgaard
local config = {
	[0] = {
		--club, coat
		items = {{2398, 1}, {2651, 1}, {2643, 1}, {2530, 1}},
		--container rope, shovel, red apple
		container = {{2120, 1}}
	},	
	[1] = { --Sorcerer
		--equipment spellbook, wand of vortex, magician's robe, mage hat, studded legs, leather boots, scarf
		items = {{2175, 1}, {2190, 1}, {8819, 1}, {8820, 1}, {2468, 1}, {2643, 1}, {2661, 1}},
		--container rope, mana potion
		container = {{2120, 1}, {7620, 1}, {2674, 20}}
	},
	[2] = { -- Druid
		--equipment spellbook, snakebite rod, magician's robe, mage hat, studded legs, leather boots, scarf
		items = {{2175, 1}, {2182, 1}, {8819, 1}, {8820, 1}, {2468, 1}, {2643, 1}, {2661, 1}},
		--container rope, mana potion
		container = {{2120, 1}, {7620, 1}, {2674, 20}}
	},
	[3] = { --Paladin
		--equipment steel shield, 5 spear, ranger's cloak, ranger legs, scarf, brass helmet
		items = {{2509, 1}, {2389, 5}, {2660, 1}, {8923, 1}, {2643, 1}, {2661, 1}, {2460, 1}},
		--container rope, health potion, mana potion
		container = {{2120, 1}, {7618, 1}, {7620, 1}, {2674, 20}}
	},
	[4] = { --Knight
		--equipment steel shield, brass armor, brass helmet, brass legs, scarf
		items = {{2509, 1}, {2465, 1}, {2460, 1}, {2478, 1}, {2643, 1}, {2661, 1}},
		--container rope, health potion, mana potion
		container = {{2120, 1}, {7618, 1}, {7620, 1}, {2674, 20}}
	}
}

function onLogin(player)
	local targetVocation = config[player:getVocation():getId()]
	if not targetVocation then
		return true
	end
	
	if player:getLastLoginSaved() ~= 0 then
		return true
	end

	for i = 1, #targetVocation.items do
		player:addItem(targetVocation.items[i][1], targetVocation.items[i][2])
	end

	local backpack = player:getVocation():getId() == 0 and player:addItem(1987) or player:addItem(1988)
	if not backpack then
		return true
	end

	for i = 1, #targetVocation.container do
		backpack:addItem(targetVocation.container[i][1], targetVocation.container[i][2])
	end
	
	if player:getVocation():getId() == 4 then
		local modal = ModalWindow (30, "Wybor broni", "Jaka bron chcesz dostac? ")
		modal:addButton(1, "Sword")
		modal:addButton(2, "Club")
		modal:addButton(3, "Axe")
		modal:sendToPlayer(player)
	end
	
	return true
end