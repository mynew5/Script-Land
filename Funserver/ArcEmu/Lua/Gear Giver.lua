--[[ Item Gifter Made by Sysmis ]]--

local NPCID = 918

function trainer_OnGossip(unit, event, player)
unit:GossipCreateMenu(100, player, 0)
unit:GossipMenuAddItem(0,"Warrior Gears", 0, 0)
unit:GossipMenuAddItem(0,"Rogue Gears", 1, 0)
unit:GossipMenuAddItem(0,"Priest Gears", 2, 0)
unit:GossipMenuAddItem(0,"Shaman Gears", 3, 0)
unit:GossipMenuAddItem(0,"Mage Gears", 5, 0)
unit:GossipMenuAddItem(0,"Warlock Gears", 6, 0)
unit:GossipMenuAddItem(0,"Hunter Gears", 7, 0)
unit:GossipMenuAddItem(0,"Paladin Gears", 8, 0)
unit:GossipMenuAddItem(0,"Druid Gears", 9, 0)

unit:GossipSendMenu(player)
end

function trainer_submenus(unit, event, player, id, intid, code)
if(intid == 0) then -- Warrior Items
unit:GossipCreateMenu(101, player, 0)
player:LearnSpell(750)
player:AddItem(41388, 1) -- Head
player:AddItem(47147, 1) -- chest
player:AddItem(44100, 1) --Shoulders
player:AddItem(45708, 1) -- Legs
player:AddItem(50207, 1) -- Feet
player:AddItem(45833, 1) -- Gloves
player:AddItem(39759, 1) -- Waist
player:AddItem(45663, 1) -- Wrist
player:AddItem(46104, 1) -- Shirt
player:AddItem(45983, 1) -- Tabard
player:AddItem(51936, 1) -- 2h Sword
player:GossipComplete()
end
if(intid == 1) then -- Rogue Items
unit:GossipCreateMenu(102, player, 0)
player:AddItem(45983, 1) -- Tabard
player:AddItem(30146, 1) -- Helm
player:AddItem(29047, 1) -- SHoulders
player:AddItem(16905, 1) -- Chest
player:AddItem(50308, 1) -- Feet
player:AddItem(16907, 1) -- Hands
player:AddItem(16909, 1) -- Legs
player:AddItem(30040, 1) -- Waist
player:AddItem(16911, 1) -- Wrist
player:AddItem(49682, 1) -- Dagger 1
player:AddItem(49846, 1) -- Dagger 2
player:GossipComplete()
end
if(intid == 2) then -- Priest Items
unit:GossipCreateMenu(103, player, 0)
player:AddItem(46351, 1) -- Mace
player:AddItem(51261, 1) -- Hood
player:AddItem(51264, 1) -- Shoulder
player:AddItem(50266, 1) -- Robe
player:AddItem(45135, 1) -- Boots
player:AddItem(35053, 1) -- Gloves
player:AddItem(30153, 1) -- Legs
player:AddItem(39190, 1) -- Waist
player:AddItem(37884, 1) -- Wrist
player:AddItem(45983, 1) -- Tabard
player:GossipComplete()
end
if(intid == 3) then -- Shaman gears
unit:GossipCreateMenu(104, player, 0)
player:AddItem(48351, 1) -- Shoulders
player:LearnSpell(8737) -- Mail
player:AddItem(50689, 1) -- Chest
player:AddItem(39734, 1) -- Feet
player:AddItem(50619, 1) -- Gloves
player:AddItem(46212, 1) -- Head
player:AddItem(35045, 1) -- Legs
player:AddItem(34935, 1) -- Waist
player:AddItem(39702, 1) -- Wrist
player:AddItem(30313, 1) -- Staff
player:AddItem(45983, 1) -- Tabard
player:GossipComplete()
end
if(intid == 5) then -- Mage Gears
unit:GossipCreateMenu(105, player, 0)
player:AddItem(41945, 1) -- Cowl
player:AddItem(35099, 1) -- Chest
player:AddItem(16800, 1) -- Boots
player:AddItem(50275, 1) -- Gloves
player:AddItem(50277, 1) -- Legs
player:AddItem(50279, 1) -- Shoulders
player:AddItem(39190, 1) -- Belt
player:AddItem(37884, 1) -- Wrist
player:AddItem(50731, 1) -- Staff
player:AddItem(45983, 1) -- Tabard
player:GossipComplete()
end
if(intid == 6) then -- Wlock Gears
unit:GossipCreateMenu(106, player, 0)
player:AddItem(47784, 1) -- Head
player:AddItem(47787, 1) -- Should
player:AddItem(47785, 1) -- Legs
player:AddItem(47786, 1) -- Robe
player:AddItem(47783, 1) -- Gloves
player:AddItem(19897, 1) -- Boots
player:AddItem(35011, 1) -- Gloves
player:AddItem(47447, 1) -- Belt
player:AddItem(40198, 1) -- Wrist
player:AddItem(22630, 1) -- Staff
player:AddItem(45983, 1) -- Tabard
player:GossipComplete()
end
if(intid == 7) then -- Hunter Gears
unit:GossipCreateMenu(107, player, 0)
player:AddItem(51285, 1) -- Gloves
player:AddItem(51289, 1) -- TUnic
player:AddItem(51288, 1) -- Spaulders
player:AddItem(51287, 1) -- Legs
player:AddItem(51286, 1) -- Head
player:LearnSpell(8737) -- Mail
player:AddItem(36737, 1) -- Axe 1
player:AddItem(33476, 1) -- Axe 2
player:AddItem(45983, 1) -- Tabard
player:GossipComplete()
end
if(intid == 8) then --Paladian Gears
unit:GossipCreateMenu(108, player, 0)
player:AddItem(51277, 1) -- Helm
player:AddItem(51279, 1) -- Shoudler
player:LearnSpell(750) -- Plate
player:AddItem(51469, 1) -- Gloves
player:AddItem(51471, 1) -- Legs
player:AddItem(51468, 1) -- Chest
player:AddItem(21388, 1) -- Feet
player:AddItem(23666, 1) -- belt
player:AddItem(50611, 1) -- Wrist
player:AddItem(51937, 1) -- Mace
player:AddItem(40475, 1) -- Shield
player:AddItem(45983, 1) -- Tabard
player:GossipComplete()
end
if(intid == 9) then -- Druid Gears
unit:GossipCreateMenu(109, player, 0)
player:AddItemSet(887)
player:AddItem(50603, 1) -- Staff
player:AddItem(45983, 1) -- Tabard
player:GossipComplete()
end
end

RegisterUnitGossipEvent(NPCID, 918, "trainer_OnGossip")
RegisterUnitGossipEvent(NPCID, 918, "trainer_submenus")