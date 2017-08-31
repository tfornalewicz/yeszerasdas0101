function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local itemId = target:getId()
	if target.uid <= 65535 or target.actionid > 0 then
		return false
	end
	
	if itemId == 2034 then
		target:remove()
		toPosition:sendMagicEffect(CONST_ME_POFF)
		return true
	end
	--chest,crate,barrel...
	if (itemId >= 1724 and itemId <= 1741) or (itemId >= 2581 and itemId <= 2588) or itemId == 1770 or itemId == 2098 or itemId == 1774 or itemId == 1775 or itemId == 2064 or (itemId >= 1747 and itemId <= 1753) or (itemId >= 1714 and itemId <= 1717) or (itemId >= 1650 and itemId <= 1653) or (itemId >= 1666 and itemId <= 1677) or (itemId >= 1614 and itemId <= 1616) or (itemId >= 3813 and itemId <= 3820) or (itemId >= 3807 and itemId <= 3810) or (itemId >= 2080 and itemId <= 2085) or (itemId >= 2116 and itemId <= 2119) or itemId == 2094 or itemId == 2095 or itemId == 1619 or itemId == 2602 or itemId == 3805 or itemId == 3806 then
		if math.random(1, 3) == 1 then
			if itemId == 1738 or itemId == 1739 or (itemId >= 2581 and itemId <= 2588) or itemId == 1770 or itemId == 2098 or itemId == 1774 or itemId == 1775 or itemId == 2064 then
				target:transform(2250)
			elseif (itemId >= 1747 and itemId <= 1749) or itemId == 1740 then
				target:transform(2251)
			elseif (itemId >= 1714 and itemId <= 1717) then
				target:transform(2252)
			elseif (itemId >= 1650 and itemId <= 1653) or (itemId >= 1666 and itemId <= 1677) or (itemId >= 1614 and itemId <= 1616) or (itemId >= 3813 and itemId <= 3820) or (itemId >= 3807 and itemId <= 3810) then
				target:transform(2253)
			elseif (itemId >= 1724 and itemId <= 1737) or (itemId >= 2080 and itemId <= 2085) or (itemId >= 2116 and itemId <= 2119) or itemId == 2094 or itemId == 2095 then
				target:transform(2254)
			elseif (itemId >= 1750 and itemId <= 1753) or itemId == 1619 or itemId == 1741 then
				target:transform(2255)
			elseif itemId == 2602 then
				target:transform(2257)
			elseif itemId == 3805 or itemId == 3806 then
				target:transform(2259)
			end
		end
		toPosition:sendMagicEffect(CONST_ME_POFF)
		return true
	end
	--spiderweb
	if itemId == 7538 or itemId == 7539 then 
		if math.random(1, 3) == 1 then
			if itemId == 7538 then
				target:transform(7544)
			elseif itemId == 7539 then
				target:transform(7545)
			end
			target:decay()
		end
		toPosition:sendMagicEffect(CONST_ME_POFF)
		return true
	end
	--wooden bar
	if itemId == 3798 or itemId == 3799 then 
		if math.random(1, 3) == 1 then
			if itemId == 3798 then
				target:transform(3959)
			elseif itemId == 3799 then
				target:transform(3958)
			end
			target:decay()
		end
		toPosition:sendMagicEffect(CONST_ME_POFF)
		return true
	end
	return false
end
