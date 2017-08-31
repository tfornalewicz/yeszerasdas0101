function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if target.itemid == 8633 and target:getUniqueId() >= 11069 and target:getUniqueId() <= 11071 and player:getStorageValue(11069) == 1 then
        player:setStorageValue(11069,2) -- kolejny stage questa
        toPosition:sendMagicEffect(38)
    end
end 