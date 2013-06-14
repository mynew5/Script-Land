local NPC_ID = 94946

function On_talk(unit, event, player)
unit:GossipCreateMenu(50, player, 0)
unit:GossipMenuAddItem(2, "Donation Armor", 1, 0)
unit:GossipMenuAddItem(2, "Donation Weapons", 2, 0)
unit:GossipMenuAddItem(2, "Bye", 60, 0)
unit:GossipSendMenu(player)
end

function On_item(unit, event, player, id, intid, code)
if (intid == 1)then 
        if(player:HasItem(52030))then
                        player:RemoveItem(52030, 1)
                        player:AddItem(37, 1)
                        player:GossipComplete()
        elseif(player:HasItem(52030) == false) then
             player:SendBroadcastMessage("You do not have the required item") 
             player:GossipComplete() 
         end
elseif(intid == 60)then
        player:GossipComplete() 
        end


if (intid == 2)then 
unit:GossipCreateMenu(50, player, 3)
unit:GossipMenuAddItem(2, "One Handers", 4, 0)
unit:GossipMenuAddItem(2, "Two Handers", 5, 0)
unit:GossipSendMenu(player)
end


if (intid == 4)then 
unit:GossipCreateMenu(50, player, 3)
unit:GossipMenuAddItem(2, "Sword", 6, 0)
unit:GossipMenuAddItem(2, "Dagger", 7, 0)
unit:GossipMenuAddItem(2, "Axe", 13, 0)
unit:GossipSendMenu(player)
end

if (intid == 5)then 
unit:GossipCreateMenu(50, player, 3)
unit:GossipMenuAddItem(2, "Sword", 9, 0)
unit:GossipMenuAddItem(2, "Axe", 10, 0)
unit:GossipMenuAddItem(2, "Mace", 11, 0)
unit:GossipMenuAddItem(2, "Spell Staff", 12, 0)
unit:GossipMenuAddItem(2, "Melee Staff", 14, 0)
unit:GossipSendMenu(player)
end

if (intid == 6)then         																						
        if(player:HasItem(52025))then
                        player:RemoveItem(52025, 1)
                        player:AddItem(935, 1)
                        player:GossipComplete()
        elseif(player:HasItem(52025) == false) then
             player:SendBroadcastMessage("You do not have the required item") 
             player:GossipComplete() 
         end
elseif(intid == 60)then
        player:GossipComplete() 
        end


if (intid == 7)then 
        if(player:HasItem(52025))then
                        player:RemoveItem(52025, 1)
                        player:AddItem(27814, 1)
                        player:GossipComplete()
        elseif(player:HasItem(52025) == false) then
             player:SendBroadcastMessage("You do not have the required item") 
             player:GossipComplete() 
         end
elseif(intid == 60)then
        player:GossipComplete() 
        end


if (intid == 13)then 
        if(player:HasItem(52025))then
                        player:RemoveItem(52025, 1)
                        player:AddItem(2942, 1)
                        player:GossipComplete()
        elseif(player:HasItem(52025) == false) then
             player:SendBroadcastMessage("You do not have the required item") 
             player:GossipComplete() 
         end
elseif(intid == 60)then
        player:GossipComplete() 
        end


if (intid == 13)then 
        if(player:HasItem(52025))then
                        player:RemoveItem(52025, 1)
                        player:AddItem(2942, 1)
                        player:GossipComplete()
        elseif(player:HasItem(52025) == false) then
             player:SendBroadcastMessage("You do not have the required item") 
             player:GossipComplete() 
         end
elseif(intid == 60)then
        player:GossipComplete() 
        end


if (intid == 9)then 
        if(player:HasItem(52026))then
                        player:RemoveItem(52026, 1)
                        player:AddItem(37807, 1)
                        player:GossipComplete()
        elseif(player:HasItem(52026) == false) then
             player:SendBroadcastMessage("You do not have the required item") 
             player:GossipComplete() 
         end
elseif(intid == 60)then
        player:GossipComplete() 
        end

 			 
if (intid == 10)then 
        if(player:HasItem(52026))then
                        player:RemoveItem(52026, 1)
                        player:AddItem(7758, 1)
                        player:GossipComplete()
        elseif(player:HasItem(52026) == false) then
             player:SendBroadcastMessage("You do not have the required item") 
             player:GossipComplete() 
         end
elseif(intid == 60)then
        player:GossipComplete() 
        end
		 

if (intid == 11)then 
        if(player:HasItem(52026))then
                        player:RemoveItem(52026, 1)
                        player:AddItem(31153, 1)
                        player:GossipComplete()
        elseif(player:HasItem(52026) == false) then
             player:SendBroadcastMessage("You do not have the required item") 
             player:GossipComplete() 
         end
elseif(intid == 60)then
        player:GossipComplete() 
        end
	

if (intid == 12)then 
        if(player:HasItem(52026))then
                        player:RemoveItem(52026, 1)
                        player:AddItem(9482, 1)
                        player:GossipComplete()
        elseif(player:HasItem(52026) == false) then
             player:SendBroadcastMessage("You do not have the required item") 
             player:GossipComplete() 
         end
elseif(intid == 60)then
        player:GossipComplete() 
        end
	

if (intid == 14)then 
        if(player:HasItem(52026))then
                        player:RemoveItem(52026, 1)
                        player:AddItem(10698, 1)
                        player:GossipComplete()
        elseif(player:HasItem(52026) == false) then
             player:SendBroadcastMessage("You do not have the required item") 
             player:GossipComplete() 
         end
elseif(intid == 60)then
        player:GossipComplete() 
        end
end


RegisterUnitGossipEvent(NPC_ID, 1, "On_talk") 
RegisterUnitGossipEvent(NPC_ID, 2, "On_item")