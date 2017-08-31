local exitPosition = {Position(7276, 1965, 12)}

function onCastSpell(creature, target) -- albo np. onkill
	local spectators, spectator = Game.getSpectators(Position(7281,1937,11), false, true, 15, 15, 15, 15)
	for i = 1, #spectators do
		spectator = spectators[i]
		spectator:teleportTo(exitPosition[1])
		exitPosition[1]:sendMagicEffect(CONST_ME_TELEPORT)
        end
end