local config = {
	[9520] = {
		boss = {name = "Mazoran", pos = Position(7303, 1727, 14), storage = Storage.Ferumbras.Mazoran48}, --{x = 7303, y = 1727, z = 14}
		players = {
			positions = {from = Position(7312, 1682, 14), to = Position(7312, 1686, 14)}, --{x = 7312, y = 1682, z = 14} {x = 7312, y = 1686, z = 14}
			teleportTo = Position(7303, 1731, 14) --{x = 7303, y = 1731, z = 14}
		}
	},
	[9521] = {
		boss = {name = "Razzagorn", pos = Position(7212, 1806, 14), storage = Storage.Ferumbras.Razzagorn48}, --{{x = 7212, y = 1806, z = 14}
		players = {
			positions = {from = Position(7174, 1795, 14), to = Position(7178, 1795, 14)}, --{x = 7174, y = 1795, z = 14} --{x = 7178, y = 1795, z = 14}
			teleportTo = Position(7206, 1807, 14) --{x = 7206, y = 1807, z = 14}
		}
	},
	[9522] = {
		boss = {name = "Plagirath", pos = Position(7468, 1731, 13), storage = Storage.Ferumbras.Plagirath48}, --{x = 7468, y = 1731, z = 13}
		players = {
			positions = {from = Position(7525, 1730, 13), to = Position(7525, 1734, 13)}, --{x = 7525, y = 1730, z = 13} --{x = 7525, y = 1734, z = 13}
			teleportTo = Position(7470, 1734, 13) --{x = 7470, y = 1734, z = 13}
		}
	},
	[9523] = {
		boss = {name = "Destabilized Ferumbras", pos = Position(7559, 1898, 14), storage = Storage.Ferumbras.FerumbrasMortal48}, --
		players = {
			positions = {from = Position(7544, 1803, 14), to = Position(7546, 1807, 14)}, --{x = 7544, y = 1803, z = 14} {x = 7546, y = 1807, z = 14}
			teleportTo = Position(7559, 1908, 14) --{x = 7559, y = 1908, z = 14}
		}
	},
	[9524] = {
		boss = {name = "Ragiaz", pos = Position(7268, 1672, 13)}, --{x = 7268, y = 1672, z = 13}
		players = {
			positions = {from = Position(7242, 1694, 13), to = Position(7246, 1694, 14), storage = Storage.Ferumbras.Ragiaz48}, --{x = 7242, y = 1694, z = 13} {x = 7246, y = 1694, z = 13}
			teleportTo = Position(7268, 1676, 13) --{x = 7268, y = 1676, z = 13}
		}
	},
	[9525] = {
		boss = {name = "Zamulosh", pos = Position(7362, 1794, 11)}, --{x = 7362, y = 1794, z = 11}
		players = {
			positions = {from = Position(7399, 1779, 11), to = Position(7399, 1783, 11), storage = Storage.Ferumbras.Zamulosh48}, --{x = 7399, y = 1779, z = 11} {x = 7399, y = 1783, z = 11}
			teleportTo = Position(7363, 1797, 11) --{x = 7363, y = 1800, z = 11}
		}
	},
	[9526] = {
		boss = {name = "Tarbaz", pos = Position(7281, 1936, 11)}, --{x = 7281, y = 1936, z = 11}
		players = {
			positions = {from = Position(7240, 1943, 11), to = Position(7240, 1947, 11), storage = Storage.Ferumbras.Tarbaz48}, --{x = 7240, y = 1943, z = 11} {x = 7240, y = 1947, z = 11}
			teleportTo = Position(7282, 1940, 11) --{x = 7282, y = 1944, z = 11}
		}
	},
	[9527] = {
		boss = {name = "Shulgrax", pos = Position(7307, 1879, 13)}, --{x = 7307, y = 1879, z = 13}
		players = {
			positions = {from = Position(7256, 1878, 13), to = Position(7256, 1882, 13), storage = Storage.Ferumbras.Shulgrax48}, --{x = 7256, y = 1878, z = 13} {x = 7256, y = 1882, z = 13}
			teleportTo = Position(7308, 1882, 13) --{x = 7308, y = 1882, z = 13}
		}
	},
	[9528] = {
		boss = {name = "The Shatterer", pos = Position(7202, 1758, 14)}, --{x = 7202, y = 1758, z = 14}
		players = {
			positions = {from = Position(7191, 1805, 14), to = Position(7195, 1805, 14)}, --{x = 7191, y = 1805, z = 13} {x = 7195, y = 1805, z = 13}
			teleportTo = Position(7183, 1773, 14) --{x = 7183, y = 1776, z = 14}
		}
	}
}

local function getPlayersInLever(uid_act)
	local p = 0
	for x = uid_act.players.positions.from.x, uid_act.players.positions.to.x do
		for y = uid_act.players.positions.from.y, uid_act.players.positions.to.y do
			local tile = Tile(Position(x, y, uid_act.players.positions.from.z))
			if tile then
				local creature = tile:getTopCreature()
				if creature and creature:isPlayer() then
					p = p + 1
				end
			end
		end
	end
	return p
end

function onUse(cid, item, fromPosition, itemEx) 
	local player = Player(cid)
		if not player then
		return true
	 end

	if player:getStorageValue(config.storage) == os.time() then
		player:sendCancelMessage("Ktorys z graczy pokonal bossa w ciagu ostatnich 48 godzin.")
		return true
	end

	if Game.getStorageValue(item.uid) > os.time() then
		player:sendCancelMessage("Please, wait "..Game.getStorageValue(item.uid) - os.time().." seconds counting the last use to start again.")
		return true
	end

	local uid_act = config[item.uid]

	if #Game.getSpectators(uid_act.boss.pos, false, true, 15, 15, 15, 15) > 0 then
		player:sendCancelMessage("There are players inside the room.")
		return true
	end

	if uid_act then
		local xx = uid_act.players.positions.to.x - uid_act.players.positions.from.x
		local yy = uid_act.players.positions.to.y - uid_act.players.positions.from.y
		local pneed = ((xx > 0) and xx+1 or yy+1)
		if getPlayersInLever(uid_act) == pneed then
			local c = 0
			for x = uid_act.players.positions.from.x, uid_act.players.positions.to.x do
				for y = uid_act.players.positions.from.y, uid_act.players.positions.to.y do
					local pos = Position(x, y, uid_act.players.positions.from.z)
					local tile = Tile(pos)
					if tile then
						local creature = tile:getTopCreature()
						if creature and creature:isPlayer() then
							local pos = Position(uid_act.players.teleportTo.x-c, uid_act.players.teleportTo.y, uid_act.players.teleportTo.z)
							creature:getPosition():sendMagicEffect(3)
							creature:teleportTo(pos)
							pos:sendMagicEffect(11)
							c = c + 1
						end
					end
				end
			end
		else
			local xx = uid_act.players.positions.to.x - uid_act.players.positions.from.x
			local yy = uid_act.players.positions.to.y - uid_act.players.positions.from.y
			player:sendCancelMessage("You need "..pneed.." players to do this quest.")		
			return true
		end
		Game.createMonster(uid_act.boss.name, uid_act.boss.pos)
		Game.setStorageValue(item.uid, os.time() + 20*60)
	end	
	return true
end