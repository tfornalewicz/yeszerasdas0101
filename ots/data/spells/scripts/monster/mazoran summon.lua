local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_NONE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_BATS)

local area = createCombatArea(AREA_SQUARE1X1)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	for i = 1, math.random(6, 7) do
	local position = Position(math.random(7296, 7311), math.random(1721, 1735), 14)
		Game.createMonster("Rage Of Mazoran", position)
	end
return doCombat(cid, combat, var)
end

--{x = 7296, y = 1721, z = 14}
--{x = 7311, y = 1735, z = 14}