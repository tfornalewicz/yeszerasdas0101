local monsters = {"ragiaz"}
 
function onKill(creature, target)
    local targetMonster = target:getMonster()
    if not targetMonster then
        return true
    end

    if not isInArray( monsters, targetMonster:getName():lower()) then
        return true
    end
   
    for pid, _ in pairs(targetMonster:getDamageMap()) do
        local attackerPlayer = Player(pid)
        if attackerPlayer then
		attackerPlayer:setStorageValue(Storage.Ferumbras.RagiazTp, os.time() + 3 * 60)
		attackerPlayer:setStorageValue(Storage.Ferumbras.Ragiaz48, os.time() + 24 * 3600)
		attackerPlayer:say('Pozostaly ci 3 minuty aby przejsc dalej.', TALKTYPE_MONSTER_SAY)
        end
    end
    return true
end