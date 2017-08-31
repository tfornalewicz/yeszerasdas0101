-- 

function onThink(interval, lastExecution)
    local MESSAGE = {
        "[KOMENDY] !buyhouse - !sellhouse - !serverinfo - !online - !uptime - !outfit .",
		"[BETA TEST] Znalazles jakis blad? Zglos to przez klienta lub napisz na forum!",
		"[UWAGA] Nikt z administracji NIGDY nie spyta Cie o haslo. Nie daj sie okrasc!",
    }
    Game.broadcastMessage(MESSAGE[math.random(1, #MESSAGE)], MESSAGE_EVENT_ADVANCE) 
    return true
end
