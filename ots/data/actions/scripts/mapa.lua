local x = 6677
local y = 967
function onUse(cid, item, fromPosition, itemEx, toPosition) 
local player = Player(cid)
playerPosition = player:getPosition()
local xRes = x-playerPosition.x
local yRes = y-playerPosition.y
        if xRes > 0 then
            if yRes > 0 then
                doCreatureSay(cid, 'Idz na poludniowy-wschod!', TALKTYPE_ORANGE_1)
            elseif yRes < 0 then
                doCreatureSay(cid, 'Idz na polnocny-wschod!', TALKTYPE_ORANGE_1)
            else
                doCreatureSay(cid, 'Idz na wschod!', TALKTYPE_ORANGE_1)
            end
        elseif xRes < 0 then
            if yRes > 0 then
                doCreatureSay(cid, 'Idz na poludniowy-zachod!', TALKTYPE_ORANGE_1)
            elseif yRes < 0 then
                doCreatureSay(cid, 'Idz na polnocny-zachod!', TALKTYPE_ORANGE_1)
            else
                doCreatureSay(cid, 'Idz na zachod!', TALKTYPE_ORANGE_1)
            end
        else
            if yRes > 0 then
                doCreatureSay(cid, 'Idz na poludnie!', TALKTYPE_ORANGE_1)
            elseif yRes < 0 then
                doCreatureSay(cid, 'Idz na polnoc!', TALKTYPE_ORANGE_1)
            else
                doCreatureSay(cid, 'Jestes na miejscu!', TALKTYPE_ORANGE_1)
            end
        end
	return true
end