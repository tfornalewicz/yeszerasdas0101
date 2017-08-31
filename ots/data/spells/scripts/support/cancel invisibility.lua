local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_INVISIBLE)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

function onCastSpell(creature, variant)
	--local item = getPlayerSlotItem(variant,CONST_SLOT_RING)
	--print(item.itemid)
	--local player = Player(variant)
	--if item.itemid == 2202 then
	--	local _item = player:getItemById(item.itemid,true)
	--	_item:remove()
	--end	
	return combat:execute(creature, variant)
end
