 
local NPCID = 94947
 
function Trainer_OnGossip(unit, event, player)
unit:GossipCreateMenu(101, player, 0)
unit:GossipMenuAddItem(0, "|cFF8B0000Learn Weapon Skills.", 0, 0)
unit:GossipMenuAddItem(0, "|cFF8B0000Advance All Weapon Skills", 1, 0)
unit:GossipMenuAddItem(0, "|cFF008000Dual-Wield", 2, 0)
unit:GossipMenuAddItem(0, "|cFF0000FFArtisan Riding", 3, 0)
 
unit:GossipSendMenu(player)
end
 
function Trainer_SubMenus(unit, event, player, id, intid, code)
if(intid == 0) then 
unit:GossipCreateMenu(101, player, 0)
player:LearnSpell(201) -- One-Handed Swords
player:LearnSpell(202) -- Two-Handed Swords
player:LearnSpell(196) -- One-Handed Axes
player:LearnSpell(197) -- Two-Handed Axes
player:LearnSpell(227) -- Staves
player:LearnSpell(200) -- Polearms
player:LearnSpell(266) -- Guns
player:LearnSpell(264) -- Bows
player:LearnSpell(5011) -- Crossbows
player:LearnSpell(3018) -- Shoot (Bow, Crossbow or Gun)
player:LearnSpell(198) -- One-Handed Maces
player:LearnSpell(199) -- Two-Handed Maces
player:LearnSpell(1180) -- Daggers
player:LearnSpell(2567) -- Thrown
player:LearnSpell(2764) -- Throw (With Thrown)
player:LearnSpell(5009) -- Wands
player:LearnSpell(5019) -- Shoot (Wands)
player:SendBroadcastMessage("Now You Have All The Weapon Skills.") -- Message
player:GossipComplete()
end
 
if(intid == 1) then 
unit:GossipCreateMenu(102, player, 0)
player:AdvanceSkill (43, 399)
player:AdvanceSkill (44, 399)
player:AdvanceSkill (45, 399)
player:AdvanceSkill (46, 399)
player:AdvanceSkill (54, 399)
player:AdvanceSkill (55, 399)  
player:AdvanceSkill (136, 399)
player:AdvanceSkill (160, 399)
player:AdvanceSkill (172, 399)
player:AdvanceSkill (173, 399)
player:AdvanceSkill (176, 399)
player:AdvanceSkill (226, 399)
player:AdvanceSkill (228, 399)
player:AdvanceSkill (229, 399)
player:AdvanceSkill (473, 399)
player:SendBroadcastMessage("I've Advanced All Your Weapon Skills. Now Have Fun!") -- Message
player:GossipComplete()
end
 
if(intid == 2) then 
unit:GossipCreateMenu(103, player, 0)
player:LearnSpell(674) -- Dual-Wield
player:SendBroadcastMessage("Now You Can Dual-Wield!") -- Message.
player:GossipComplete()
end
 
if(intid == 3) then 
unit:GossipCreateMenu(104, player, 0)
player:LearnSpell(34091)
player:SendBroadcastMessage("You've Learned Artisan Riding Skill! Please Relog For It To Take Effect!") -- Message
player:GossipComplete()
end

 
end
 
RegisterUnitGossipEvent(94947, 1,"Trainer_OnGossip")
RegisterUnitGossipEvent(94947, 2,"Trainer_SubMenus")