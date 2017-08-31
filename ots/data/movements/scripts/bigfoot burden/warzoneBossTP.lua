if not warzoneConfig then
    warzoneConfig = {
        -- Warzone 
        [45700] = {  -- action do movement
            center = Position(7530, 1456, 10),   -- {x = 7530, y = 1456, z = 10}
            rangeX = 27, rangeY = 25,
 
            boss = "Gnomevil",   -- nome do boss 
            teleportTo = Position(7519, 1455, 10),   -- {x = 7519, y = 1455, z = 10}
            locked = false,
 
            storage = 790014,    -- storage 
            interval = 10 * 60 * 60,
 
            exit = Position(7414, 1400, 8)   -- {x = 7414, y = 1400, z = 8}
        },
		
		
		-- Warzone 
        [45702] = {  -- action do movement
            center = Position(7523, 1465, 9), -- {x = 7523, y = 1465, z = 9}
            rangeX = 26, rangeY = 25,
 
            boss = "Deathstrike",   -- nome do boss 
            teleportTo = Position(7509, 1455, 9),   -- {x = 7509, y = 1455, z = 9}
            locked = false,
 
            storage = 790015,    -- storage 
            interval = 10 * 60 * 60,
 
            exit = Position(7414, 1400, 8)   -- {x = 7414, y = 1400, z = 8}
        },
		
		-- Warzone 
        [45701] = {  -- action do movement
            center = Position(7503, 1410, 11), --{x = 7503, y = 1410, z = 11}
            rangeX = 20, rangeY = 20,
 
            boss = "Abyssador",   -- nome do boss 
            teleportTo = Position(7496, 1404, 11),  -- {x = 7496, y = 1404, z = 11}
            locked = false,
 
            storage = 790016,    -- storage 
            interval = 10 * 60 * 60,
 
            exit = Position(7414, 1400, 8)   -- {x = 7414, y = 1400, z = 8}
        }
		
		
    }
 
    warzoneConfig.findByName = function(name, last)
        local i, v = next(warzoneConfig, last)
        if type(v) == 'table' and v.boss == name then
            return v
        elseif not i then
            return nil
        end
        return warzoneConfig.findByName(name, i)
    end
end
 
local function filter(list, f, i)
    if i < #list then
        if f(list[i]) then
            return list[i], filter(list, f, i + 1)
        else
            return filter(list, f, i + 1)
        end
    elseif list[i] and f(list[i]) then
        return list[i]
    end
end
 
function onStepIn(creature, item, pos, fromPosition)
    if not creature:isPlayer() then
        creature:teleportTo(fromPosition)
        return false
    end
 
    local info = warzoneConfig[item:getActionId()]
    if not info then
        return false
    end
 
    if  creature:getStorageValue(info.storage) > os.time() then
        creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Powroc za 10 godzin.")
        creature:teleportTo(fromPosition)
        return false
    end
 
    if info.locked then
        creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Prosze poczekac na wyczyszczenie pokoju.")
        creature:teleportTo(fromPosition)
        return false
    end
 
    creature:teleportTo(info.teleportTo)
    local spectators = Game.getSpectators(info.center, false, false, 0, info.rangeX, 0, info.rangeY)
    if not filter(spectators, function(c) return c:isMonster() end, 1) then
        local boss = Game.createMonster(info.boss, info.center)
        boss:registerEvent('WarzoneBossDeath')
    end
 
    return true
end