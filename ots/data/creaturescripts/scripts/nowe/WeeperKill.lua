local positions = {
	Position(7510, 1476, 10), --{x = 7510, y = 1476, z = 10}
	Position(7510, 1477, 10),
	Position(7510, 1478, 10),
	Position(7510, 1479, 10)
}
 
local barrierPositions = {
	Position(7511, 1476, 10),
	Position(7511, 1477, 10),
	Position(7511, 1478, 10),
	Position(7511, 1479, 10)
}
 
local function clearArena()
	local spectators = Game.getSpectators(Position(7527, 1456, 10), false, false, 10, 10, 13, 13)
	local exitPosition = Position(7424, 1437, 10)
    for i = 1, #spectators do
        local spectator = spectators[i]
        if spectator:isPlayer() then
            spectator:teleportTo(exitPosition)
            exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
            spectator:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Zostales teleportowany przez systemy bezpieczenstwa.')
        else
            spectator:remove()
        end
    end
end
 
local function removeWall(itemid, count, position, itemUid)
    local targetWall = Item(itemUid)
    if targetWall then
        targetWall:remove()
    end
    Game.createItem(itemid, count, position)
end
 
function onKill(creature, target)
    print("onKill")
    local targetMonster = target:getMonster()
    if not targetMonster then
        print("1")
        return true
    end
 
    if targetMonster:getName():lower() ~= 'parasite' or Game.getStorageValue(GlobalStorage.Weeper) >= 1 then
        print("2")
        return true
    end
 
    local targetPosition = targetMonster:getPosition()
    local barrier = false
    for i = 1, #positions do
        if targetPosition == positions[i] then
            barrier = true
            break
        end
    end
 
    if not barrier then
        print("3")
        return true
    end
 
    local last = false
    local tile, item
    for i = 1, #barrierPositions do
        tile = Tile(barrierPositions[i])
        if tile then
            item = tile:getItemById(18459)
            if item then
                item:transform(18460)
                addEvent(removeWall, 30 * 60 * 1000, 18459, 1, barrierPositions[i], item:getUniqueId())
                last = true
            end
 
            item = tile:getItemById(18460)
            if item then
                item:transform(18461)
            end

            item = tile:getItemById(18461)
            if item then
                item:remove()
            end
        end
    end
 
    if not last then
        print("4")
        return true
    end
 
    Game.setStorageValue(GlobalStorage.Weeper, 1)
    addEvent(Game.setStorageValue, 30 * 60 * 1000, GlobalStorage.Weeper, 0)
    --Game.createMonster('gnomevil', Position(33114, 31953, 11))
    addEvent(clearArena, 32 * 60 * 1000)
    print("5")
    return true
end