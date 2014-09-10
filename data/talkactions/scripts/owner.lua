function onSay(cid, words, param)
	local player = Player(cid)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	local house = House(getTileHouseInfo(player:getPosition()))
	if house == nil then
		player:sendCancelMessage("You are not inside a house.")
		return false
	end

	if param == "" or param == "none" then
		house:setOwnerGuid(0)
		return false
	end

	local targetPlayer = Player(param)
	if not targetPlayer then
		player:sendCancelMessage("Player not found.")
		return false
	end

	house:setOwnerGuid(targetPlayer:getGuid())
	return false
end
