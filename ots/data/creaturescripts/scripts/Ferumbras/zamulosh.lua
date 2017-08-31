local monsters = {"zamulosh"}
 
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
		if attackerPlayer:getStorageValue(Storage.Ferumbras.Zamulosh48) ~= os.time() then
		attackerPlayer:setStorageValue(Storage.Ferumbras.ZamuloshTp, os.time() + 3 * 60)
		attackerPlayer:setStorageValue(Storage.Ferumbras.Zamulosh48, os.time() + 24 * 3600)
		attackerPlayer:say('Pozostaly ci 3 minuty aby przejsc dalej.', TALKTYPE_MONSTER_SAY)
		end
		return true
        end
    end
    return true
end