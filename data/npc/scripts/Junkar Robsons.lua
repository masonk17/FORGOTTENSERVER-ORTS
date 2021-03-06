local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local voices = {
	'So much to do. So many things to be fixed.',
	'Still so much work.'
}

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 10)
		if math.random(100) < 20 then
			Npc():say(voices[math.random(#voices)], TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local travelNode = keywordHandler:addKeyword({'kazordoon'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'So you wish for a trip to Kazordoon? %s?', cost = 80, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = false, level = 0, msg = 'Full speed ahead!', cost = 80, discount = TravelLib.postmanDiscount, destination = Position(32660, 31957, 15) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Well, then you stay here, simple as that.'})

local travelNode = keywordHandler:addKeyword({'thais'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'So you wish for a trip to Thais? %s?', cost = 80, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = false, level = 0, msg = 'Full speed ahead!', cost = 80, discount = TravelLib.postmanDiscount, destination = Position(32370, 32180, 13) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Well, then you stay here, simple as that.'})

local travelNode = keywordHandler:addKeyword({'mines'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'So you wish for a trip to the mines? %s?', cost = 70, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = false, level = 0, msg = 'Full speed ahead!', cost = 70, discount = TravelLib.postmanDiscount, destination = Position(32555, 32069, 10) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Well, then you stay here, simple as that.'})

keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Where do you want me to take you? To {Kazordoon} or to {Thais}? Occasionally we can even reach the {mines} if they are cleared.'})

npcHandler:setMessage(MESSAGE_GREET, "Welcome, |PLAYERNAME|! You are lucky that the service is running right now. Save your coal for the days to come though!")
npcHandler:setMessage(MESSAGE_FAREWELL, "See you next time!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "<Sigh> No patience!")

npcHandler:addModule(FocusModule:new())
