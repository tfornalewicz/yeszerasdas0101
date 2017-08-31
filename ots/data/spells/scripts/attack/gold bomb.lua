local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, 173)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EXPLOSION)
combat:setParameter(COMBAT_PARAM_CREATEITEM, 2160)
combat:setArea(createCombatArea(AREA_SQUARE13X13))

function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end
