local cleanMapAtSave = false

local function serverSave(interval)
	if cleanMapAtSave then
		cleanMap()
	end

	saveServer()
	Game.broadcastMessage('Server save complete. Next save in ' .. math.floor(interval / 60000) .. ' minutes!', MESSAGE_STATUS_WARNING)
end

function onThink(interval)
	Game.broadcastMessage('W ciagu minuty nastapi zapis serwera. Mozecie odczuc male lagi przez sekunde, za co przepraszamy.', MESSAGE_STATUS_WARNING)
	addEvent(serverSave, 60000, interval)
	return true
end