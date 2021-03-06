local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local travelNode = keywordHandler:addKeyword({'edron'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a passage to Edron for %s?', cost = 160, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 160, discount = TravelLib.postmanDiscount, destination = Position(33173, 31764, 6) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'venore'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a passage to Venore for %s?', cost = 150, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 150, discount = TravelLib.postmanDiscount, destination = Position(32954, 32022, 6) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'port hope'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a passage to Port Hope for %s?', cost = 80, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 80, discount = TravelLib.postmanDiscount, destination = Position(32527, 32784, 6) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'liberty bay'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a passage to Liberty Bay for %s?', cost = 90, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 90, discount = TravelLib.postmanDiscount, destination = Position(32285, 32892, 6) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'darashia'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a passage to Darashia for %s?', cost = 100, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 100, discount = TravelLib.postmanDiscount, destination = Position(33289, 32480, 6) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'yalahar'}, TravelLib.say, {npcHandler = npcHandler, text = 'Do you seek a passage to Yalahar for %s?', cost = 230, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 230, discount = TravelLib.postmanDiscount, destination = Position(32816, 31272, 6) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, reset = true, text = 'We would like to serve you some time.'})

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "I'm known all over the world as Captain Sinbeard"})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I'm the captain of this sailing ship"})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, text = "I'm the captain of this sailing ship"})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, text = "My ship is the fastest in the whole world."})
keywordHandler:addKeyword({'line'}, StdModule.say, {npcHandler = npcHandler, text = "My ship is the fastest in the whole world."})
keywordHandler:addKeyword({'company'}, StdModule.say, {npcHandler = npcHandler, text = "My ship is the fastest in the whole world."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, text = "My ship is the fastest in the whole world."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, text = "Where do you want to go? To {Darashia}, {Venore}, {Liberty Bay}, {Port Hope}, {Yalahar} or {Edron}? Or to {Travora} - the island between the worlds?"})
keywordHandler:addKeyword({'passanger'}, StdModule.say, {npcHandler = npcHandler, text = "We would like to welcome you on board."})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, text = "Where do you want to go? To {Darashia}, {Venore}, {Liberty Bay}, {Port Hope}, {Yalahar} or {Edron}? Or to {Travora} - the island between the worlds?"})
keywordHandler:addKeyword({'route'}, StdModule.say, {npcHandler = npcHandler, text = "Where do you want to go? To {Darashia}, {Venore}, {Liberty Bay}, {Port Hope}, {Yalahar} or {Edron}? Or to {Travora} - the island between the worlds?"})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, text = "Where do you want to go? To {Darashia}, {Venore}, {Liberty Bay}, {Port Hope}, {Yalahar} or {Edron}? Or to {Travora} - the island between the worlds?"})
keywordHandler:addKeyword({'town'}, StdModule.say, {npcHandler = npcHandler, text = "Where do you want to go? To {Darashia}, {Venore}, {Liberty Bay}, {Port Hope}, {Yalahar} or {Edron}? Or to {Travora} - the island between the worlds?"})
keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, text = "Where do you want to go? To {Darashia}, {Venore}, {Liberty Bay}, {Port Hope}, {Yalahar} or {Edron}? Or to {Travora} - the island between the worlds?"})
keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, text = "Where do you want to go? To {Darashia}, {Venore}, {Liberty Bay}, {Port Hope}, {Yalahar} or {Edron}? Or to {Travora} - the island between the worlds?"})
keywordHandler:addKeyword({'go'}, StdModule.say, {npcHandler = npcHandler, text = "Where do you want to go? To {Darashia}, {Venore}, {Liberty Bay}, {Port Hope}, {Yalahar} or {Edron}? Or to {Travora} - the island between the worlds?"})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, text = "I'm sorry but I don't sail there."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, text = "I'm sorry but I don't sail there."})
keywordHandler:addKeyword({'ab\'dendriel'}, StdModule.say, {npcHandler = npcHandler, text = "I'm sorry but I don't sail there."})
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, text = "That's where we are."})

npcHandler:setMessage(MESSAGE_GREET, "Welcome on board, Sir |PLAYERNAME|. Where can I {sail} you today?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye. Recommend us if you were satisfied with our service.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye then.")
npcHandler:addModule(FocusModule:new())
