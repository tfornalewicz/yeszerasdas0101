local holes = {468, 481, 483, 7932, 23712}
local pools = {2016, 2017, 2018, 2019, 2020, 2021, 2025, 2026, 2027, 2028, 2029, 2030}

function onUse(cid, item, fromPosition, itemEx, toPosition)
local target = itemEx
    local player = Player(cid)
    local iEx = Item(itemEx.uid)
    if isInArray(holes, itemEx.itemid) then
        iEx:transform(itemEx.itemid + 1)
        iEx:decay()
    elseif isInArray(pools, target.itemid) then
        local hole = 0
        for i = 1, #holes do
            local tile = Tile(target:getPosition()):getItemById(holes[i])
            if tile then
                hole = tile
            end
        end
        if hole ~= 0 then
            hole:transform(hole:getId() + 1)
            hole:decay()
        else
            return false
        end   
    elseif itemEx.itemid == 231 or itemEx.itemid == 9059 then
        local rand = math.random(1, 100)
        -- Q2 do sandnigger questa
        if iEx.uid == 11061 and player:getStorageValue(11061) == 1 and player:getStorageValue(11062) < 1 then
            toPosition:sendMagicEffect(CONST_ME_FIREAREA)
            player:setStorageValue(11062,1) -- lock piasku
            player:setStorageValue(11061,2) -- wykopanie i spalenie kartki
            doCreatureSay(cid, 'Ciekawy czar, nawet sam sie spalil po przeczytaniu', TALKTYPE_ORANGE_1)
        -- Q2
        elseif(itemEx.actionid  == 100 and rand <= 20) then
            iEx:transform(489)
            iEx:decay()
        elseif rand == 1 then
            Game.createItem(2159, 1, toPosition)
        elseif rand > 95 then
            Game.createMonster("Scarab", toPosition, true, true)
        end
        toPosition:sendMagicEffect(CONST_ME_POFF)
    -- 02/05/17 na razie nie aktywne
       elseif target.itemid == 1406 and target:getUniqueId() > 11048 and target:getUniqueId() < 11059 and cid:getStorageValue(11049) == 2 and player:getStorageValue(target:getUniqueId()) < 1 then
            cid:setStorageValue(target:getUniqueId(), 1)
            doCreatureSay(cid, '*aaaaaaaaaoooooouoouo* - to chyba dzwiek uciekajacych dusz', TALKTYPE_ORANGE_1)
            random = math.random()
            print(random)
            if random >= (player:getStorageValue(11059) * 0.1) then
                doCreatureSay(cid,'Udalo ci sie zdobyc dusze!',TALKTYPE_ORANGE_1)
                player:setStorageValue(11049,3) -- udal sie quest, wracamy do Konmulda
            else
                doCreatureSay(cid,'Nie udalo sie zlapac duszy!',TALKTYPE_ORANGE_1)
                player:setStorageValue(11059,player:getStorageValue(11059) - 1) -- dodajemy 10% do szansy przy nastepnym grobie
            end

            if math.random() < 0.5 then
                Game.createMonster("Grim Reaper",toPosition) -- spawn grima
                Game.createMonster("Grim Reaper",toPosition) -- spawn grima
                Game.createMonster("Grim Reaper",toPosition) -- spawn grima
            end
    -- 02/05/17   
    else
        return false
    end
    return true
end