function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)

	if player:getStorageValue(Storage.thievesGuild.Mission06) == 3 then
		player:say('You slip through the door', TALKTYPE_MONSTER_SAY)
		player:teleportTo(Position(32359, 32786, 6))
	end
	return true
end
