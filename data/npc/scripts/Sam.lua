local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 5)
		if math.random(100) < 25 then
			Npc():say("Hello there, adventurer! Need a deal in weapons or armor? I'm your man!", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if isInArray({"adorn", "helmet", "outfit", "addon"}, msg) then
		if player:getStorageValue(Storage.OutfitQuest.KnightHatAddon) == 5 then
			npcHandler:say("Oh, Gregor sent you? I see. It will be my pleasure to adorn your helmet. Your helmet is finished, I hope you like it.", cid)
			player:setStorageValue(Storage.OutfitQuest.KnightHatAddon, 6)
			player:addOutfitAddon(139, 2)
			player:addOutfitAddon(131, 2)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	end

	if msgcontains(msg, "old backpack") then
		if player:getStorageValue(Storage.SamsOldBackpack) < 1 then
			npcHandler:say("What? Are you telling me you found my old adventurer's backpack that I lost years ago??", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, '2000 steel shields') then
		if player:getStorageValue(Storage.WhatAFoolishQuest.Questline) ~= 29
				or player:getStorageValue(Storage.WhatAFoolishQuest.Contract) == 2 then
			npcHandler:say('My offers are weapons, armors, helmets, legs, and shields. If you\'d like to see my offers, ask me for a {trade}.', cid)
			return true
		end

		npcHandler:say('What? You want to buy 2000 steel shields??', cid)
		npcHandler.topic[cid] = 2
	elseif msgcontains(msg, 'contract') then
		if player:getStorageValue(Storage.WhatAFoolishQuest.Contract) == 0 then
			npcHandler:say('Have you signed the contract?', cid)
			npcHandler.topic[cid] = 4
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if player:getItemCount(3960) > 0 then
				npcHandler:say({
					"Thank you very much! This brings back good old memories! Please, as a reward, travel to Kazordoon and ask my old friend Kroox to provide you a special dwarven armor. ...",
					"I will mail him about you immediately. Just tell him, his old buddy Sam is sending you."
				}, cid)
				player:setStorageValue(Storage.SamsOldBackpack, 1)
				player:removeItem(3960, 1)
				player:addAchievement('Backpack Tourist')
			else
				npcHandler:say("You don't have it...", cid)
			end
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 2 then
			npcHandler:say('I can\'t believe it. Finally I will be rich! I could move to Edron and enjoy my retirement! But ... wait a minute! I will not start working without a contract! Are you willing to sign one?', cid)
			npcHandler.topic[cid] = 3
		elseif npcHandler.topic[cid] == 3 then
			player:addItem(7492, 1)
			player:setStorageValue(Storage.WhatAFoolishQuest.Contract, 1)
			npcHandler:say('Fine! Here is the contract. Please sign it. Talk to me about it again when you\'re done.', cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 4 then
			if not player:removeItem(7491, 1) then
				npcHandler:say('You don\'t have a signed contract.', cid)
				npcHandler.topic[cid] = 0
				return true
			end

			player:setStorageValue(Storage.WhatAFoolishQuest.Contract, 2)
			npcHandler:say('Excellent! I will start working right away! Now that I am going to be rich, I will take the opportunity to tell some people what I REALLY think about them!', cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "no") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("Then no.", cid)
		elseif isInArray({2, 3, 4}, npcHandler.topic[cid]) then
			npcHandler:say("This deal sounded too good to be true anyway.", cid)
		end
		npcHandler.topic[cid] = 0
	end
	return true
end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the blacksmith. If you need weapons or armor - just ask me."})

npcHandler:setMessage(MESSAGE_GREET, "Welcome to my shop, adventurer |PLAYERNAME|! I {trade} with weapons and armor.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye and come again, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye and come again.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
