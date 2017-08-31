function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)


		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
		player:sendTextMessage(42, 'Test serwer- Faza II\n\nMapa zostala przesunieta, wiec zalecane jest usuniecie WykopOTS i instalacja od nowa. Niektore questy mogly przestac dzialac, prosze o zglaszanie tego.\nExp i loot zostal zwiekszony na okres testow.\n\n\nPrzypominamy o mozliwosci skladania propozycji na forum WykopOTS.pl')

	return true
end 