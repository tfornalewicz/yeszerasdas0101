function onRecord(current, old)
	addEvent(Game.broadcastMessage, 150, 'Nowy rekord: ' .. current .. ' graczy online.', MESSAGE_STATUS_DEFAULT)
	return true
end
