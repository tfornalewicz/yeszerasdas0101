
function onModalWindow(cid, modalWindowId, buttonId, choiceId, item, position, pos, toPosition, fromPosition, itemEx)
local player = Player(cid)
	
	if (modalWindowId == 30) then
		if (buttonId == 1) then
			player:addItem(8602, 1)
		elseif (buttonId == 2) then
			player:addItem(2439, 1)
		elseif (buttonId == 3) then
			player:addItem(8601, 1)
		else
			player:sendTextMessage(32, "Skoro nie chcesz broni, sam wybiore...")
			player:addItem(8602, 1)

		end
	end
	return true
end