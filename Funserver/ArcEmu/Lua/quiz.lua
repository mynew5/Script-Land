function quiz_main_menu(pUnit, player)
if (player:IsInCombat() == true) then
player:SendAreaTriggerMessage("Come and do Quiz after Combat!")
else
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0------------------------------------------------|", 1000, 0)
pUnit:GossipMenuAddItem(10, "Quiz About People", 10, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0------------------------------------------------|", 1000, 0)
pUnit:GossipMenuAddItem(10, "Quiz About InfinityWoW Funserver", 300, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0------------------------------------------------|", 1000, 0)
pUnit:GossipMenuAddItem(10, "Quiz About Retail", 400, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0------------------------------------------------|", 1000, 0)
pUnit:GossipMenuAddItem(10, "Quiz About Wicked Stuff", 600, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0------------------------------------------------|", 1000, 0)
player:SendAreaTriggerMessage("Hello ready for some very hard quiz?!")
pUnit:GossipSendMenu(player)
end
end

function quiz_on_gossip_talk(pUnit, event, player)
quiz_main_menu(pUnit, player)
end

 function quiz_on_gossip_select(pUnit, event, player, id, intid, code, pMisc)
 pUnit:GossipComplete(player)
  
if(intid == 1000) then
if (player:IsInCombat() == true) then
player:SendAreaTriggerMessage("Come and do Quiz after Combat!")
else
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0------------------------------------------------|", 1000, 0)
pUnit:GossipMenuAddItem(10, "Quiz About People", 10, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0------------------------------------------------|", 1000, 0)
pUnit:GossipMenuAddItem(10, "Quiz About InfinityWoW Funserver", 300, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0------------------------------------------------|", 1000, 0)
pUnit:GossipMenuAddItem(10, "Quiz About Retail", 400, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0------------------------------------------------|", 1000, 0)
pUnit:GossipMenuAddItem(10, "Quiz About Wicked Stuff", 600, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0------------------------------------------------|", 1000, 0)
player:SendAreaTriggerMessage("Go on and try again, just choose a quiz!")
pUnit:GossipSendMenu(player)
end
end

if(intid == 10) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Hello there ready for some quiz?", 10, 0)
pUnit:GossipMenuAddItem(10, "Hell Yeah!", 11, 0)
pUnit:GossipMenuAddItem(10, "Aw.. No..", 1000, 0)
pUnit:GossipSendMenu(player)
end

if(intid == 11) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Ok first Question: What did Prof. Einstein do?", 11, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0------------------------------------------------|", 11, 0)
pUnit:GossipMenuAddItem(10, "A. He was the first man to walk on the moon?", 90, 0)
pUnit:GossipMenuAddItem(10, "B. He invented the Atom Bomb?", 12, 0)
pUnit:GossipMenuAddItem(10, "C. He builded the car?", 90, 0)
pUnit:GossipMenuAddItem(10, "D. He really liked fishing?", 90, 0)
player:SendAreaTriggerMessage("First Question!")
pUnit:GossipSendMenu(player)
end

if(intid == 12) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "CORRECT!", 12, 0)
pUnit:GossipMenuAddItem(10, "Your really good! Ready for the next?", 202, 0)
player:SendAreaTriggerMessage("CORRECT!")
pUnit:CastSpell(25465)
pUnit:GossipSendMenu(player)
end

if(intid == 200) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Hello there ready for some quiz?", 200, 0)
pUnit:GossipMenuAddItem(10, "Hell Yeah!", 201, 0)
pUnit:GossipMenuAddItem(10, "Aw.. No..", 1000, 0)
pUnit:GossipSendMenu(player)
end

if(intid == 201) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Ok first Question: What did Prof. Einstein do?", 201, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 201, 0)
pUnit:GossipMenuAddItem(10, "A. He was the first man to walk on the moon?", 90, 0)
pUnit:GossipMenuAddItem(10, "B. He invented the Atom Bomb?", 12, 0)
pUnit:GossipMenuAddItem(10, "C. He builded the car?", 90, 0)
pUnit:GossipMenuAddItem(10, "D. He really liked fishing?", 90, 0)
player:SendAreaTriggerMessage("First Question!")
pUnit:GossipSendMenu(player)
end

if(intid == 202) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Ok Second Question: Who played Rafe in the movie PEARL HARBOR?", 202, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 202, 0)
pUnit:GossipMenuAddItem(10, "A. Was it Tom Cruise?", 90, 0)
pUnit:GossipMenuAddItem(10, "B. Was it Brad Pitt?", 90, 0)
pUnit:GossipMenuAddItem(10, "C. Was it Ben Affleck?", 203, 0)
pUnit:GossipMenuAddItem(10, "D. Was it Jon Voight?", 90, 0)
player:SendAreaTriggerMessage("Second Question!")
pUnit:GossipSendMenu(player)
end

if(intid == 203) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "CORRECT AGAIN!", 203, 0)
pUnit:GossipMenuAddItem(10, "Your really good! Ready for the next?", 204, 0)
player:SendAreaTriggerMessage("CORRECT AGAIN!")
pUnit:CastSpell(25465)
pUnit:GossipSendMenu(player)
end

if(intid == 204) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Ok Third Question: Who was the Producer of the movie PEARL HARBOR?", 204, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 204, 0)
pUnit:GossipMenuAddItem(10, "A. It was Steven Rosenblum!", 90, 0)
pUnit:GossipMenuAddItem(10, "B. It was Mark Goldblatt!", 90, 0)
pUnit:GossipMenuAddItem(10, "C. It was Michael Kaplan!", 90, 0)
pUnit:GossipMenuAddItem(10, "D. It was Michael Bay!", 205, 0)
player:SendAreaTriggerMessage("Third Question!")
pUnit:GossipSendMenu(player)
end

if(intid == 205) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "CORRECT AGAIN YOUR GOOD!", 205, 0)
pUnit:GossipMenuAddItem(10, "Your really great! Ready for the next?", 206, 0)
player:SendAreaTriggerMessage("CORRECT AGAIN!")
pUnit:CastSpell(25465)
pUnit:GossipSendMenu(player)
end

if(intid == 206) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Ok Last Question: Who plays the evil robot in the first TERMINATOR movie?", 206, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 206, 0)
pUnit:GossipMenuAddItem(10, "A. Lance Armstrong!", 90, 0)
pUnit:GossipMenuAddItem(10, "B. Bruce Willis!", 90, 0)
pUnit:GossipMenuAddItem(10, "C. Arnold Schwarzennegger!", 207, 0)
pUnit:GossipMenuAddItem(10, "D. Mike Stenson!", 90, 0)
player:SendAreaTriggerMessage("Last Question!")
pUnit:GossipSendMenu(player)
end

if(intid == 207) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Good job you made it trough all the questions as a reward i will give you full HP!", 207, 0)
pUnit:GossipMenuAddItem(10, "As a reward you can choose one of these items!", 208, 0)
player:SendAreaTriggerMessage("YOU COMPLETED THE PEOPLE QUIZ!")
pUnit:CastSpell(25465)
pUnit:CastSpell(6668)
pUnit:CastSpell(11543)
pUnit:CastSpell(11544)
pUnit:CastSpell(11543)
pUnit:CastSpell(11544)
pUnit:CastSpell(25465)
pUnit:CastSpell(6668)
pUnit:CastSpell(11540)
pUnit:CastSpell(25465)
pUnit:CastSpell(6668)
pUnit:CastSpell(11543)
pUnit:CastSpell(11544)
pUnit:CastSpell(11543)
pUnit:CastSpell(11544)
pUnit:CastSpell(25465)
pUnit:CastSpell(6668)
pUnit:CastSpell(11540)
pUnit:GossipSendMenu(player)
end

if(intid == 208) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Choose an item from below!", 208, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 208, 0)
pUnit:GossipMenuAddItem(10, "Click Here For Item!", 209, 0)
pUnit:GossipMenuAddItem(10, "Click Here For Item!", 210, 0)
pUnit:GossipMenuAddItem(10, "Click Here For Item!", 211, 0)
pUnit:GossipMenuAddItem(10, "Click Here For Item!", 212, 0)
player:SendAreaTriggerMessage("Take What You Want!")
player:SetHealthPct(100)
pUnit:GossipSendMenu(player)
end

if(intid == 209) then
player:AddItem(3577, 1)
pUnit:GossipComplete(player)
end

if(intid == 210) then
player:AddItem(3577, 5)
pUnit:GossipComplete(player)
end

if(intid == 211) then
player:AddItem(45983, 1)
pUnit:GossipComplete(player)
end

if(intid == 212) then
player:AddItem(3577, 10)
pUnit:GossipComplete(player)
end

if(intid == 300) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Hello there ready for some quiz?", 300, 0)
pUnit:GossipMenuAddItem(10, "Hell Yeah!", 301, 0)
pUnit:GossipMenuAddItem(10, "Aww.. No..", 1000, 0)
pUnit:GossipSendMenu(player)
end

if(intid == 301) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Good first Question: In what year did InfinityWoW start?", 301, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 301, 0)
pUnit:GossipMenuAddItem(10, "A. 2003!", 90, 0)
pUnit:GossipMenuAddItem(10, "B. 2005!", 90, 0)
pUnit:GossipMenuAddItem(10, "C. 2007!", 90, 0)
pUnit:GossipMenuAddItem(10, "D. 2009!", 302, 0)
player:SendAreaTriggerMessage("First Question!")
pUnit:GossipSendMenu(player)
end

if(intid == 302) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "CORRECT!", 12, 0)
pUnit:GossipMenuAddItem(10, "Your really good! Ready for the next?", 303, 0)
player:SendAreaTriggerMessage("CORRECT!")
pUnit:CastSpell(25465)
pUnit:GossipSendMenu(player)
end

if(intid == 303) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Good second Question: Who is Sazer?", 303, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 303, 0)
pUnit:GossipMenuAddItem(10, "A. A GameMaster!", 90, 0)
pUnit:GossipMenuAddItem(10, "B. Forum Moderator!", 90, 0)
pUnit:GossipMenuAddItem(10, "C. Server Owner!", 304, 0)
pUnit:GossipMenuAddItem(10, "D. Ingame Admin!", 90, 0)
player:SendAreaTriggerMessage("Second Question!")
pUnit:GossipSendMenu(player)
end

if(intid == 304) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "CORRECT!", 304, 0)
pUnit:GossipMenuAddItem(10, "Your really good! Ready for the next?", 305, 0)
player:SendAreaTriggerMessage("CORRECT AGAIN!")
pUnit:GossipSendMenu(player)
end

if(intid == 305) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Good third Question: What kind of core does the server run on?", 305, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 305, 0)
pUnit:GossipMenuAddItem(10, "A. ArcEmu!", 306, 0)
pUnit:GossipMenuAddItem(10, "B. ManGOS!", 90, 0)
pUnit:GossipMenuAddItem(10, "C. Aspire!", 90, 0)
pUnit:GossipMenuAddItem(10, "D. Hearthstone!", 90, 0)
player:SendAreaTriggerMessage("Third Question!")
pUnit:GossipSendMenu(player)
end

if(intid == 306) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "CORRECT AGAIN!", 306, 0)
pUnit:GossipMenuAddItem(10, "Your really good! Ready for the next?", 307, 0)
player:SendAreaTriggerMessage("CORRECT YOUR GOOD!")
pUnit:CastSpell(25465)
pUnit:GossipSendMenu(player)
end

if(intid == 307) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Good job! fourth Question: What is the name of the World Boss?", 307, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 307, 0)
pUnit:GossipMenuAddItem(10, "A. Thoim Lord of the Underworld?", 90, 0)
pUnit:GossipMenuAddItem(10, "B. Throim Lord of the Underworld?", 90, 0)
pUnit:GossipMenuAddItem(10, "C. Thorim Lord of the Undeworld?", 90, 0)
pUnit:GossipMenuAddItem(10, "D. Thorim Lord of the Underworld?", 308, 0)
player:SendAreaTriggerMessage("Fourth Question!")
pUnit:GossipSendMenu(player)
end

if(intid == 308) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "CORRECT AGAIN!", 308, 0)
pUnit:GossipMenuAddItem(10, "Your really good! Ready for the next?", 309, 0)
player:SendAreaTriggerMessage("CORRECT YOUR REALLY  GOOD!")
pUnit:CastSpell(25465)
pUnit:GossipSendMenu(player)
end

if(intid == 309) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Good job! fifth Question: How many World Bosses has been spawned?", 309, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 309, 0)
pUnit:GossipMenuAddItem(10, "A. Only 1!", 90, 0)
pUnit:GossipMenuAddItem(10, "B. Only 2!", 90, 0)
pUnit:GossipMenuAddItem(10, "C. Only 3!", 90, 0)
pUnit:GossipMenuAddItem(10, "D. Only 4!", 90, 0)
pUnit:GossipMenuAddItem(10, "E. Only 5!", 90, 0)
pUnit:GossipMenuAddItem(10, "F. Only 6!", 310, 0)
pUnit:GossipMenuAddItem(10, "G. Only 7!", 90, 0)
player:SendAreaTriggerMessage("Fifth Question!")
pUnit:GossipSendMenu(player)
end

if(intid == 310) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "CORRECT AGAIN!", 310, 0)
pUnit:GossipMenuAddItem(10, "Your really good! Ready for the last?", 311, 0)
player:SendAreaTriggerMessage("CORRECT YOUR REALLY GOOD!")
pUnit:CastSpell(25465)
pUnit:GossipSendMenu(player)
end

if(intid == 311) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "The Last question now: What does a Cow eat?", 311, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 311, 0)
pUnit:GossipMenuAddItem(10, "A. Milk!", 90, 0)
pUnit:GossipMenuAddItem(10, "B. Chocolate!", 90, 0)
pUnit:GossipMenuAddItem(10, "C. Grass!", 90, 0)
pUnit:GossipMenuAddItem(10, "D. Pizza!", 312, 0)
player:SendAreaTriggerMessage("Last Question!")
pUnit:GossipSendMenu(player)
end

if(intid == 312) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "CORRECT YOU HAVE DONE IT!", 312, 0)
pUnit:GossipMenuAddItem(10, "As a reward you will get full health. And you can choose one of these items!", 313, 0)
player:SendAreaTriggerMessage("CORRECT YOU COMPLETED InfinityWoW QUIZ!")
pUnit:CastSpell(25465)
pUnit:CastSpell(6668)
pUnit:CastSpell(11543)
pUnit:CastSpell(11544)
pUnit:CastSpell(11543)
pUnit:CastSpell(11544)
pUnit:CastSpell(25465)
pUnit:CastSpell(6668)
pUnit:CastSpell(11540)
pUnit:CastSpell(25465)
pUnit:CastSpell(6668)
pUnit:CastSpell(11543)
pUnit:CastSpell(11544)
pUnit:CastSpell(11543)
pUnit:CastSpell(11544)
pUnit:CastSpell(25465)
pUnit:CastSpell(6668)
pUnit:CastSpell(11540)
pUnit:GossipSendMenu(player)
end

if(intid == 313) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Choose an item from below!", 313, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 313, 0)
pUnit:GossipMenuAddItem(10, "Click Here For Item!", 314, 0)
pUnit:GossipMenuAddItem(10, "Click Here For Item!", 315, 0)
pUnit:GossipMenuAddItem(10, "Click Here For Item!", 316, 0)
pUnit:GossipMenuAddItem(10, "Click Here For Item!", 317, 0)
player:SendAreaTriggerMessage("Take What You Want!")
player:SetHealthPct(100)
pUnit:GossipSendMenu(player)
end

if(intid == 314) then
player:AddItem(9317, 50)
pUnit:GossipComplete(player)
end

if(intid == 315) then
player:AddItem(21640, 1)
pUnit:GossipComplete(player)
end

if(intid == 316) then
player:AddItem(23714, 50)
pUnit:GossipComplete(player)
end

if(intid == 317) then
player:AddItem(41427, 50)
pUnit:GossipComplete(player)
end

if(intid == 90) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "WRONG!", 90, 0)
pUnit:GossipMenuAddItem(10, "You really suck at this, but try again!", 1000, 0)
player:SendAreaTriggerMessage("WRONG!")
player:SetHealthPct(1)
pUnit:FullCastSpellOnTarget(56920, player)
pUnit:FullCastSpellOnTarget(56920, player)
pUnit:FullCastSpellOnTarget(56920, player)
pUnit:FullCastSpellOnTarget(56920, player)
pUnit:FullCastSpellOnTarget(56920, player)
pUnit:FullCastSpellOnTarget(56920, player)
pUnit:FullCastSpellOnTarget(56920, player)
pUnit:FullCastSpellOnTarget(56920, player)
pUnit:FullCastSpellOnTarget(56920, player)
pUnit:GossipSendMenu(player)
end

if(intid == 400) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Hello there ready for some quiz?", 400, 0)
pUnit:GossipMenuAddItem(10, "Hell Yeah!", 401, 0)
pUnit:GossipMenuAddItem(10, "Aw.. No..", 1000, 0)
pUnit:GossipSendMenu(player)
end

if(intid == 401) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Ok now First question: World of Warcraft was released in what year?", 401, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 401, 0)
pUnit:GossipMenuAddItem(10, "A. 2001!", 90, 0)
pUnit:GossipMenuAddItem(10, "B. 2002!", 90, 0)
pUnit:GossipMenuAddItem(10, "C. 2003!", 90, 0)
pUnit:GossipMenuAddItem(10, "D. 2004!", 402, 0)
player:SendAreaTriggerMessage("First Question!")
pUnit:GossipSendMenu(player)
end

if(intid == 402) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "CORRECT!", 403, 0)
pUnit:GossipMenuAddItem(10, "Your really good! Ready for the next question?", 403, 0)
player:SendAreaTriggerMessage("CORRECT!")
pUnit:CastSpell(25465)
pUnit:GossipSendMenu(player)
end

if(intid == 403) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Ok now Second question: The Burning Crusade was released in what year?", 403, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 403, 0)
pUnit:GossipMenuAddItem(10, "A. 2005!", 90, 0)
pUnit:GossipMenuAddItem(10, "B. 2006!", 90, 0)
pUnit:GossipMenuAddItem(10, "C. 2007!", 404, 0)
pUnit:GossipMenuAddItem(10, "D. 2008!", 90, 0)
player:SendAreaTriggerMessage("Second Question!")
pUnit:GossipSendMenu(player)
end

if(intid == 404) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "CORRECT!", 404, 0)
pUnit:GossipMenuAddItem(10, "Your really good! Ready for the next question?", 405, 0)
player:SendAreaTriggerMessage("CORRECT AGAIN!")
pUnit:CastSpell(25465)
pUnit:GossipSendMenu(player)
end

if(intid == 405) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Ok now Third question: Where is the World Tree placed?", 405, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 405, 0)
pUnit:GossipMenuAddItem(10, "A. In Ashenvale!", 90, 0)
pUnit:GossipMenuAddItem(10, "B. In Hyjal!", 406, 0)
pUnit:GossipMenuAddItem(10, "C. In Elwynn Forest!", 90, 0)
pUnit:GossipMenuAddItem(10, "D. In Azshara!", 90, 0)
player:SendAreaTriggerMessage("Third Question!")
pUnit:GossipSendMenu(player)
end

if(intid == 406) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "CORRECT!", 406, 0)
pUnit:GossipMenuAddItem(10, "Your really good! Ready for the next question?", 408, 0)
player:SendAreaTriggerMessage("CORRECT YOUR INCREDIBLE!")
pUnit:CastSpell(25465)
pUnit:GossipSendMenu(player)
end

if(intid == 408) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Ok now Fourth question: What is the name of the King of Stormwind?", 408, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 408, 0)
pUnit:GossipMenuAddItem(10, "A. king Varian Wrynn!", 409, 0)
pUnit:GossipMenuAddItem(10, "B. king Varian Marnn!", 90, 0)
pUnit:GossipMenuAddItem(10, "C. king Vurna Wrynn!", 90, 0)
pUnit:GossipMenuAddItem(10, "D. king Murnn Varin!", 90, 0)
player:SendAreaTriggerMessage("Fourth Question!")
pUnit:GossipSendMenu(player)
end

if(intid == 409) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "CORRECT!", 409, 0)
pUnit:GossipMenuAddItem(10, "Your really good! Ready for the next question?", 410, 0)
player:SendAreaTriggerMessage("CORRECT YOUR GOOD!")
pUnit:CastSpell(25465)
pUnit:GossipSendMenu(player)
end

if(intid == 410) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Ok now Fifth question: How many bosses do you have to kill to earn the achievement: The Nexus?", 410, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 410, 0)
pUnit:GossipMenuAddItem(10, "A. 3!", 90, 0)
pUnit:GossipMenuAddItem(10, "B. 4!", 411, 0)
pUnit:GossipMenuAddItem(10, "C. 5!", 90, 0)
pUnit:GossipMenuAddItem(10, "D. 6!", 90, 0)
player:SendAreaTriggerMessage("Fifth Question!")
pUnit:GossipSendMenu(player)
end

if(intid == 411) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "CORRECT!", 411, 0)
pUnit:GossipMenuAddItem(10, "Your really good! Ready for the last question?", 412, 0)
player:SendAreaTriggerMessage("CORRECT!")
pUnit:CastSpell(25465)
pUnit:GossipSendMenu(player)
end

if(intid == 412) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Ok now the Last question: How many platforms are flying outside The Nexus in Borean Tundra?", 410, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 410, 0)
pUnit:GossipMenuAddItem(10, "A. There is 10!", 90, 0)
pUnit:GossipMenuAddItem(10, "B. There is 14!", 90, 0)
pUnit:GossipMenuAddItem(10, "C. There is 12!", 413, 0)
pUnit:GossipMenuAddItem(10, "D. There is 16!", 90, 0)
player:SendAreaTriggerMessage("Last Question!")
pUnit:GossipSendMenu(player)
end

if(intid == 413) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "CORRECT YOU HAVE DONE IT!", 413, 0)
pUnit:GossipMenuAddItem(10, "As a reward you will get full health. And you can choose one of these items!", 414, 0)
player:SendAreaTriggerMessage("CORRECT YOU COMPLETE THE RETAIL QUIZ!")
pUnit:CastSpell(25465)
pUnit:CastSpell(6668)
pUnit:CastSpell(11543)
pUnit:CastSpell(11544)
pUnit:CastSpell(11543)
pUnit:CastSpell(11544)
pUnit:CastSpell(25465)
pUnit:CastSpell(6668)
pUnit:CastSpell(11540)
pUnit:CastSpell(25465)
pUnit:CastSpell(6668)
pUnit:CastSpell(11543)
pUnit:CastSpell(11544)
pUnit:CastSpell(11543)
pUnit:CastSpell(11544)
pUnit:CastSpell(25465)
pUnit:CastSpell(6668)
pUnit:CastSpell(11540)
pUnit:GossipSendMenu(player)
end

if(intid == 414) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Choose an item from below!", 414, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 414, 0)
pUnit:GossipMenuAddItem(10, "Click Here For Item!", 415, 0)
pUnit:GossipMenuAddItem(10, "Click Here For Item!", 416, 0)
pUnit:GossipMenuAddItem(10, "Click Here For Item!", 417, 0)
pUnit:GossipMenuAddItem(10, "Click Here For Item!", 418, 0)
player:SendAreaTriggerMessage("Take What You Want!")
player:SetHealthPct(100)
pUnit:GossipSendMenu(player)
end

if(intid == 415) then
player:AddItem(26045, 1)
pUnit:GossipComplete(player)
end

if(intid == 416) then
player:AddItem(26045, 30)
pUnit:GossipComplete(player)
end

if(intid == 417) then
player:AddItem(26045, 10)
pUnit:GossipComplete(player)
end

if(intid == 418) then
player:AddItem(26045, 5)
pUnit:GossipComplete(player)
end

if(intid == 600) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Hello there ready for some quiz!", 600, 0)
pUnit:GossipMenuAddItem(10, "Please read and understand!", 600, 0)
pUnit:GossipMenuAddItem(10, "Press here for the rules.....", 601, 0)
player:SendAreaTriggerMessage("Before Starting This Quiz Please Read!")
pUnit:GossipSendMenu(player)
end

if(intid == 601) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Before starting this Quiz you must agree that any damage or other weird effects that will happend when you are done we are not RESPONSEABLE for that! Do this quiz on your OWN safety!", 600, 0)
pUnit:GossipMenuAddItem(10, "Click here if you accept!", 500, 0)
pUnit:GossipMenuAddItem(10, "Click here if you do NOT accept!", 1000, 0)
pUnit:GossipSendMenu(player)
end

if(intid == 500) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Hello there ready for some quiz?", 500, 0)
pUnit:GossipMenuAddItem(10, "Hell Yeah!", 501, 0)
pUnit:GossipMenuAddItem(10, "Aw.. No..", 1000, 0)
pUnit:GossipSendMenu(player)
end

if(intid == 501) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Ok now the first question: How long time is an Elephant pregnant?", 501, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 501, 0)
pUnit:GossipMenuAddItem(10, "A. In 10 months!", 90, 0)
pUnit:GossipMenuAddItem(10, "B. In 15 months!", 90, 0)
pUnit:GossipMenuAddItem(10, "C. In 19 months!", 502, 0)
pUnit:GossipMenuAddItem(10, "D. In 25 months!", 90, 0)
player:SendAreaTriggerMessage("First Question!")
pUnit:GossipSendMenu(player)
end

if(intid == 502) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "CORRECT!", 506, 0)
pUnit:GossipMenuAddItem(10, "Your really good! Ready for the next question?", 503, 0)
player:SendAreaTriggerMessage("CORRECT!")
pUnit:CastSpell(25465)
pUnit:GossipSendMenu(player)
end

if(intid == 503) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Ok now the second question: Who is the creator of The Simpsons?", 503, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 503, 0)
pUnit:GossipMenuAddItem(10, "A. Homer Simpsons!", 90, 0)
pUnit:GossipMenuAddItem(10, "B. Bart Groeing!", 90, 0)
pUnit:GossipMenuAddItem(10, "C. Matt Groeing!", 504, 0)
pUnit:GossipMenuAddItem(10, "D. Michael Groeing!", 90, 0)
player:SendAreaTriggerMessage("Second Question!")
pUnit:GossipSendMenu(player)
end

if(intid == 504) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "CORRECT!", 506, 0)
pUnit:GossipMenuAddItem(10, "Your really good! Ready for the next question?", 505, 0)
player:SendAreaTriggerMessage("CORRECT!")
pUnit:CastSpell(25465)
pUnit:GossipSendMenu(player)
end

if(intid == 505) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Ok now the third question: How old is my neighboor?", 505, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 505, 0)
pUnit:GossipMenuAddItem(10, "A. He is 43 years old!", 90, 0)
pUnit:GossipMenuAddItem(10, "B. He is 39 years old!", 506, 0)
pUnit:GossipMenuAddItem(10, "C. He is 37 years old!", 90, 0)
pUnit:GossipMenuAddItem(10, "D. He is 45 years old!", 90, 0)
player:SendAreaTriggerMessage("Third Question!")
pUnit:GossipSendMenu(player)
end

if(intid == 506) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "CORRECT!", 506, 0)
pUnit:GossipMenuAddItem(10, "Your really good! Ready for the next question?", 507, 0)
player:SendAreaTriggerMessage("CORRECT!")
pUnit:CastSpell(25465)
pUnit:GossipSendMenu(player)
end

if(intid == 507) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Ok now the fourth question: Is my Grandma sexy?", 507, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 507, 0)
pUnit:GossipMenuAddItem(10, "A. Hell NO!", 90, 0)
pUnit:GossipMenuAddItem(10, "B. A Little!", 90, 0)
pUnit:GossipMenuAddItem(10, "C. No Response!", 90, 0)
pUnit:GossipMenuAddItem(10, "D. YES!", 508, 0)
player:SendAreaTriggerMessage("Fourth Question!")
pUnit:GossipSendMenu(player)
end

if(intid == 508) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "CORRECT!", 508, 0)
pUnit:GossipMenuAddItem(10, "Your really good! Ready for the next question?", 509, 0)
player:SendAreaTriggerMessage("CORRECT!")
pUnit:CastSpell(25465)
pUnit:GossipSendMenu(player)
end

if(intid == 509) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Ok now the fifth question: Should Homer Simpsons face get a place on Mount Rushmore?", 509, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 509, 0)
pUnit:GossipMenuAddItem(10, "A. Yes Ofcourse!", 510, 0)
pUnit:GossipMenuAddItem(10, "B. I dont know!", 90, 0)
pUnit:GossipMenuAddItem(10, "C. NO!", 90, 0)
player:SendAreaTriggerMessage("Fifth Question!")
pUnit:GossipSendMenu(player)
end

if(intid == 510) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "CORRECT!", 510, 0)
pUnit:GossipMenuAddItem(10, "Your really good! Ready for the last question?", 511, 0)
player:SendAreaTriggerMessage("CORRECT YOUR VERY SEXY!")
pUnit:CastSpell(25465)
pUnit:GossipSendMenu(player)
end

if(intid == 511) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Ok now the LAST question: Do you want to get your ass spanked by 8 monkeys and Barack Obama?", 511, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 511, 0)
pUnit:GossipMenuAddItem(10, "A. HELL YEA!", 512, 0)
pUnit:GossipMenuAddItem(10, "B. NO WAY!", 90, 0)
player:SendAreaTriggerMessage("LAST Question!")
pUnit:GossipSendMenu(player)
end

if(intid == 512) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "CORRECT YOU HAVE DONE IT!", 511, 0)
pUnit:GossipMenuAddItem(10, "As a reward you will get full health. And you can choose one of these items!", 513, 0)
player:SendAreaTriggerMessage("CORRECT YOU COMPLETE THE WICKED QUIZ!")
pUnit:CastSpell(25465)
pUnit:CastSpell(6668)
pUnit:CastSpell(11543)
pUnit:CastSpell(11544)
pUnit:CastSpell(11543)
pUnit:CastSpell(11544)
pUnit:CastSpell(25465)
pUnit:CastSpell(6668)
pUnit:CastSpell(11540)
pUnit:CastSpell(25465)
pUnit:CastSpell(6668)
pUnit:CastSpell(11543)
pUnit:CastSpell(11544)
pUnit:CastSpell(11543)
pUnit:CastSpell(11544)
pUnit:CastSpell(25465)
pUnit:CastSpell(6668)
pUnit:CastSpell(25465)
pUnit:CastSpell(6668)
pUnit:CastSpell(11543)
pUnit:CastSpell(11544)
pUnit:CastSpell(11543)
pUnit:CastSpell(6668)
pUnit:CastSpell(11540)
pUnit:CastSpell(25465)
pUnit:CastSpell(6668)
pUnit:CastSpell(11543)
pUnit:CastSpell(11544)
pUnit:CastSpell(11543)
pUnit:CastSpell(11544)
pUnit:CastSpell(25465)
pUnit:CastSpell(11540)
pUnit:GossipSendMenu(player)
end

if(intid == 513) then
pUnit:GossipCreateMenu(3543, player, 0)
pUnit:GossipMenuAddItem(10, "Choose an item from below!", 513, 0)
pUnit:GossipMenuAddItem(10, "|cFF0000A0----------------------------------------------|", 513, 0)
pUnit:GossipMenuAddItem(10, "Click Here For Item!", 514, 0)
pUnit:GossipMenuAddItem(10, "Click Here For Item!", 515, 0)
pUnit:GossipMenuAddItem(10, "Click Here For Item!", 516, 0)
pUnit:GossipMenuAddItem(10, "Click Here For Item!", 517, 0)
player:SendAreaTriggerMessage("Take What You Want!")
player:SetHealthPct(100)
pUnit:GossipSendMenu(player)
end

if(intid == 514) then
player:AddItem(60606, 1)
pUnit:GossipComplete(player)
end

if(intid == 515) then
player:AddItem(21817, 5)
pUnit:GossipComplete(player)
end

if(intid == 516) then
player:AddItem(21818, 5)
pUnit:GossipComplete(player)
end

if(intid == 517) then
player:AddItem(35557, 10)
pUnit:GossipComplete(player)
end
end

RegisterUnitGossipEvent(990000041, 1, "quiz_on_gossip_talk") 
RegisterUnitGossipEvent(990000041, 2, "quiz_on_gossip_select")