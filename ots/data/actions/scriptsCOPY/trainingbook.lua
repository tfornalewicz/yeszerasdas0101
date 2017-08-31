local text = "Szkolenie na statuetce jest darmowe. Nie potrzebujesz broni, aby trenowac. Wybierz wlasciwa statuetke!"

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:showTextDialog(item.itemid, text)
	return true
end