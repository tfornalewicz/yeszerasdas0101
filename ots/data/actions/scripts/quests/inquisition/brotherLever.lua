local config = {
	[9017] = {
		wallPositions = {
			Position(6839, 1819, 10),
			Position(6840, 1819, 10),
			Position(6841, 1819, 10),
			Position(6842, 1819, 10),
			Position(6843, 1819, 10),
			Position(6844, 1819, 10),
			Position(6845, 1819, 10),
			Position(6846, 1819, 10),
			Position(6847, 1819, 10),
			Position(6848, 1819, 10),
			Position(6849, 1819, 10),
			Position(6850, 1819, 10),
			Position(6851, 1819, 10)
		},
		wallDown = 1524,
		wallUp = 1050
	},
	[9018] = {
		wallPositions = {
			Position(6836, 1822, 10),
			Position(6836, 1823, 10),
			Position(6836, 1824, 10),
			Position(6836, 1825, 10),
			Position(6836, 1826, 10),
			Position(6836, 1827, 10),
			Position(6836, 1828, 10),
			Position(6836, 1829, 10),
			Position(6836, 1830, 10)
		},
		wallDown = 1526,
		wallUp = 1049
	},
	[9019] = {
		wallPositions = {
			Position(6839, 1833, 10),
			Position(6840, 1833, 10),
			Position(6841, 1833, 10),
			Position(6842, 1833, 10),
			Position(6843, 1833, 10),
			Position(6844, 1833, 10),
			Position(6845, 1833, 10),
			Position(6846, 1833, 10),
			Position(6847, 1833, 10),
			Position(6848, 1833, 10),
			Position(6849, 1833, 10),
			Position(6850, 1833, 10),
			Position(6851, 1833, 10)
		},
		wallDown = 1524,
		wallUp = 1050
	},
	[9020] = {
		wallPositions = {
			Position(6854, 1822, 10),
			Position(6854, 1823, 10),
			Position(6854, 1824, 10),
			Position(6854, 1825, 10),
			Position(6854, 1826, 10),
			Position(6854, 1827, 10),
			Position(6854, 1828, 10),
			Position(6854, 1829, 10),
			Position(6854, 1830, 10)
		},
		wallDown = 1526,
		wallUp = 1049
	}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local targetLever = config[item.uid]
	if not targetLever then
		return true
	end

	local tile, thing
	for i = 1, #targetLever.wallPositions do
		tile = Tile(targetLever.wallPositions[i])
		if tile then
			thing = tile:getItemById(item.itemid == 1945 and targetLever.wallDown or targetLever.wallUp)
			if thing then
				thing:transform(item.itemid == 1945 and targetLever.wallUp or targetLever.wallDown)
			end
		end
	end

	item:transform(item.itemid == 1945 and 1946 or 1945)
	return true
end