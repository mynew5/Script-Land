local LichKing = nil
local Sylvanas2 = nil
local Jaina2 = nil
local Abomin = nil
local Ghoulzzz = nil
local Doctorzzz = nil

function LichKing_OnSpawn(pUnit, event)
LichKing = pUnit
local random_player = LichKing:GetClosestPlayer()
if (random_player:GetTeam() == 0) then
LichKing:RegisterEvent(TheLichKingAggro_A, 1000, 0)
end
if (random_player:GetTeam() == 1) then
LichKing:RegisterEvent(TheLichKingAggro_H, 1000, 0)
end
end

RegisterUnitEvent(3722226, 18, "LichKing_OnSpawn")

function Abomin_OnSpawn(pUnit, event)
Abomin = pUnit
Abomin:RegisterEvent(GoTo_Players_POS_Abomin, 1000, 0)
end

RegisterUnitEvent(37069, 18, "Abomin_OnSpawn")

function GoTo_Players_POS_Abomin(pUnit, event)
local player = Abomin:GetRandomPlayer(0)
local X, Y, Z, O = player:GetX(), player:GetY(), player:GetZ(), player:GetO()
Abomin:MoveTo(X, Y, Z, O)
end

function Ghoulzzz_OnSpawn(pUnit, event)
Ghoulzzz = pUnit
Ghoulzzz:RegisterEvent(GoTo_Players_POS_Ghoulzzz, 1000, 0)
end

RegisterUnitEvent(36940, 18, "Ghoulzzz_OnSpawn")

function GoTo_Players_POS_Ghoulzzz(pUnit, event)
local player = Ghoulzzz:GetRandomPlayer(0)
local X, Y, Z, O = player:GetX(), player:GetY(), player:GetZ(), player:GetO()
Ghoulzzz:MoveTo(X, Y, Z, O)
return 5;
end

function Doctorzzz_OnSpawn(pUnit, event)
Doctorzzz = pUnit
Doctorzzz:RegisterEvent(GoTo_Players_POS_Doctorzzz, 1000, 0)
end

RegisterUnitEvent(36941, 18, "Doctorzzz_OnSpawn")

function GoTo_Players_POS_Doctorzzz(pUnit, event)
local player = Doctorzzz:GetRandomPlayer(0)
local X, Y, Z, O = player:GetX(), player:GetY(), player:GetZ(), player:GetO()
Doctorzzz:MoveTo(X, Y, Z, O)
end

function Sylvanas2_OnSpawn(pUnit, event)
Sylvanas2 = pUnit
Sylvanas2:Unroot()
Sylvanas2:EquipWeapons(49814, 49814, 42775)
Sylvanas2:FullCastSpell(70188)
Sylvanas2:RegisterEvent(Sylvanas2_GameObject_Activate, 1000, 1)
end

RegisterUnitEvent(37554, 18, "Sylvanas2_OnSpawn")

function Sylvanas2_GameObject_Activate(pUnit, event)
Sylvanas2:GetGameObjectNearestCoords(5582.796387, 2230.650146, 733.011230,197341):Activate()
Sylvanas2:GetGameObjectNearestCoords(5520.756836, 2229.048096, 733.011230,197341):Activate()
end

function Jaina2_OnSpawn(pUnit, event)
Jaina2 = pUnit
Jaina2:Unroot()
Jaina2:EquipWeapons(2177, 12869, 0)
Jaina2:FullCastSpell(69787)
Jaina2:RegisterEvent(Jaina2_GameObject_Activate, 1000, 1)
end

RegisterUnitEvent(36955, 18, "Jaina2_OnSpawn")

function Jaina2_GameObject_Activate(pUnit, event)
Jaina2:GetGameObjectNearestCoords(5582.796387, 2230.650146, 733.011230,197341):Activate()
Jaina2:GetGameObjectNearestCoords(5520.756836, 2229.048096, 733.011230,197341):Activate()
end

function TheLichKingAggro_A(pUnit, event)
local Player = LichKing:GetClosestPlayer()
if (LichKing:GetDistanceYards(Player) <= 40) then
LichKing:RemoveEvents()
LichKing:SendChatMessage(14, 0, "Your allies have arrived, Jaina, just as you promised. You will all become powerful agents of the Scourge.")
LichKing:PlaySoundToSet(17212)
LichKing:RegisterEvent(JainaAggro_Flee_A, 12000, 1)
end
end

function TheLichKingAggro_H(pUnit, event)
local Player = LichKing:GetClosestPlayer()
if (LichKing:GetDistanceYards(Player) <= 40) then
LichKing:RemoveEvents()
LichKing:SendChatMessage(14, 0, "I will not make the same mistake again, Sylvanas. This time there will be no escape. You will all serve me in death!")
LichKing:PlaySoundToSet(17213)
LichKing:RegisterEvent(SylvanasAggro_Flee_H, 14000, 1)
end
end

function JainaAggro_Flee_A(pUnit, event)
Jaina2:SetNPCFlags(1)
Jaina2:SetHealthPct(10)
Jaina2:SendChatMessage(14, 0, "He is too powerful. We must leave this place at once! My magic can hold him in place for only a short time. Come quickly, heroes!")
Jaina2:PlaySoundToSet(16643)
Jaina2:MoveTo(5578.430176, 2234.797119, 733.012573, 5.522379)
Jaina2:SetMovementFlags(1)
LichKing:CastSpell(69708)
Jaina2:RemoveAllAuras()
end

function SylvanasAggro_Flee_H(pUnit, event)
Sylvanas2:SetNPCFlags(1)
Sylvanas2:SetHealthPct(10)
Sylvanas2:SendChatMessage(14, 0, "He's... too powerful. Heroes, quickly... come to me! We must leave this place at once! I will do what I can to hold him in place while we flee.")
Sylvanas2:PlaySoundToSet(17028)
Sylvanas2:MoveTo(5578.430176, 2234.797119, 733.012573, 5.522379)
Sylvanas2:SetMovementFlags(1)
LichKing:CastSpell(70194)
Sylvanas2:RemoveAllAuras()
end

function Jaina2_OnGossipHello(Jaina2, event, player)
Jaina2:GossipCreateMenu(1, player, 0)
Jaina2:GossipMenuAddItem(0, "Let's go!", 1, 0)
Jaina2:GossipSendMenu(player)
end

function Jaina2_OnGossipSelect(Jaina2, event, player, id, intid, code)
if (intid == 1) then
Jaina2:RegisterEvent(Jaina2_Flee_With_Players, 1, 1)
Jaina2:SetNPCFlags(4)
LichKing:RemoveAllAuras()
player:GossipComplete()
end
end

RegisterUnitGossipEvent(36955, 1, "Jaina2_OnGossipHello")
RegisterUnitGossipEvent(36955, 2, "Jaina2_OnGossipSelect")

function Sylvanas2_OnGossipHello(Sylvanas2, event, player)
Sylvanas2:GossipCreateMenu(1, player, 0)
Sylvanas2:GossipMenuAddItem(0, "Let's go!", 1, 0)
Sylvanas2:GossipSendMenu(player)
end

function Sylvanas2_OnGossipSelect(Sylvanas2, event, player, id, intid, code)
if (intid == 1) then
Sylvanas2:RegisterEvent(Sylvanas2_Flee_With_Players, 1, 1)
Sylvanas2:SetNPCFlags(4)
LichKing:RemoveAllAuras()
player:GossipComplete()
end
end

RegisterUnitGossipEvent(37554, 1, "Sylvanas2_OnGossipHello")
RegisterUnitGossipEvent(37554, 2, "Sylvanas2_OnGossipSelect")

function Jaina2_Flee_With_Players(pUnit, event)
Jaina2:SetMovementFlags(1)
LichKing:SetMovementFlags(0)
Jaina2:MoveTo(5609.560059, 2197.439941, 731.723022, 4.290870)
LichKing:MoveTo(5609.560059, 2197.439941, 731.723022, 4.290870)
Jaina2:RegisterEvent(Jaina2_MoveTo, 8500, 1)
end

function Sylvanas2_Flee_With_Players(pUnit, event)
Sylvanas2:SetMovementFlags(1)
LichKing:SetMovementFlags(0)
Sylvanas2:MoveTo(5609.560059, 2197.439941, 731.723022, 4.290870)
LichKing:MoveTo(5609.560059, 2197.439941, 731.723022, 4.290870)
Sylvanas2:RegisterEvent(Sylvanas2_MoveTo, 1000, 1)
end

function Jaina2_MoveTo(pUnit, event)
Jaina2:MoveTo(5595.109863, 2160.239990, 730.942993, 3.927240)
LichKing:RegisterEvent(Cast_Remorseless_Winter_A, 7000, 1)
Jaina2:RegisterEvent(Another_Movement_A, 7200, 1)
end

function Sylvanas2_MoveTo(pUnit, event)
Sylvanas2:MoveTo(5595.109863, 2160.239990, 730.942993, 3.927240)
LichKing:RegisterEvent(Cast_Remorseless_Winter_H, 7000, 1)
Sylvanas2:RegisterEvent(Another_Movement_H, 7200, 1)
end

function Cast_Remorseless_Winter_A(pUnit, event)
LichKing:FullCastSpell(69780)
LichKing:SendChatMessage(14, 0, "There is no escape!")
LichKing:PlaySoundToSet(17217)
LichKing:RegisterEvent(Another_Message_A, 4000, 1)
end

function Cast_Remorseless_Winter_H(pUnit, event)
LichKing:FullCastSpell(69780)
LichKing:SendChatMessage(14, 0, "There is no escape!")
LichKing:PlaySoundToSet(17217)
LichKing:RegisterEvent(Another_Message_H, 4000, 1)
end

function Another_Movement_A(pUnit, event)
Jaina2:MoveTo(5564.299805, 2126.949951, 730.822998, 4.250820)
Jaina2:RegisterEvent(Another_Movement_A2, 8200, 1)
end

function Another_Movement_H(pUnit, event)
Sylvanas2:MoveTo(5564.299805, 2126.949951, 730.822998, 4.250820)
Sylvanas2:RegisterEvent(Another_Movement_H2, 8200, 1)
end

function Another_Message_A(pUnit, event)
LichKing:SendChatMessage(14, 0, "Death's cold embrace awaits.")
LichKing:PlaySoundToSet(17221)
LichKing:SetUnitToFollow(Jaina2, 1, 1)
LichKing:Emote(469, 3000)
LichKing:Root()
LichKing:RegisterEvent(Spawn_Adds_A, 3000, 1)
end

function Another_Message_H(pUnit, event)
LichKing:SendChatMessage(14, 0, "Death's cold embrace awaits.")
LichKing:PlaySoundToSet(17221)
LichKing:SetUnitToFollow(Sylvanas2, 1, 1)
LichKing:Emote(469, 3000)
LichKing:Root()
LichKing:RegisterEvent(Spawn_Adds_H, 3000, 1)
end

function Spawn_Adds_A(pUnit, event)
LichKing:Emote(468, 3000)
LichKing:SpawnCreature(36940, LichKing:GetX()+1, LichKing:GetY()+1, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36940, LichKing:GetX()+2, LichKing:GetY()+2, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36940, LichKing:GetX()+3, LichKing:GetY()+3, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36940, LichKing:GetX()+4, LichKing:GetY()+4, LichKing:GetZ(), 4, 14, 0)
LichKing:FullCastSpell(69836)
Jaina2:SendChatMessage(14, 0, "I will destroy this barrier. You must hold the undead back!")
Jaina2:PlaySoundToSet(16607)
LichKing:RegisterEvent(UnRoot_And_Follow_Jaina2, 1000, 1)
end

function Spawn_Adds_H(pUnit, event)
LichKing:Emote(468, 3000)
LichKing:SpawnCreature(36940, LichKing:GetX()+1, LichKing:GetY()+1, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36940, LichKing:GetX()+2, LichKing:GetY()+2, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36940, LichKing:GetX()+3, LichKing:GetY()+3, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36940, LichKing:GetX()+4, LichKing:GetY()+4, LichKing:GetZ(), 4, 14, 0)
LichKing:FullCastSpell(69836)
Sylvanas2:SendChatMessage(14, 0, "No wall can hold the Banshee Queen! Keep the undead at bay, heroes! I will tear this barrier down!")
Sylvanas2:PlaySoundToSet(17029)
LichKing:RegisterEvent(UnRoot_And_Follow_Sylvanas2, 1000, 1)
end

function Another_Movement_A2(pUnit, event)
Jaina2:MoveTo(5547.129883, 2094.879883, 731.124023, 4.136370)
Jaina2:RegisterEvent(IfWallIsDestroyed_A, 1, 0)
end

function Another_Movement_H2(pUnit, event)
Sylvanas2:MoveTo(5547.129883, 2094.879883, 731.124023, 4.136370)
Sylvanas2:RegisterEvent(IfWallIsDestroyed_H, 1, 0)
end

function UnRoot_And_Follow_Jaina2(pUnit, event)
LichKing:Unroot()
LichKing:SetUnitToFollow(Jaina2, 1, 1) -- If he bugs out, then follow her again. ;P
end

function UnRoot_And_Follow_Sylvanas2(pUnit, event)
LichKing:Unroot()
LichKing:SetUnitToFollow(Sylvanas2, 1, 1) -- If he bugs out, then follow her again. ;P
end

function IfWallIsDestroyed_A(pUnit, event)
if (Doctorzzz:IsDead() == true) and (Ghoulzzz:IsDead() == true) then
Jaina2:RemoveEvents()
Jaina2:MoveTo(5503.75, 1985.4, 736.138, 4003420)
local IceWall = Jaina2:GetGameObjectNearestCoords(5540.39, 2086.48, 731.066,201385)
IceWall:Activate()
IceWall:Despawn(5000, 0)
LichKing:SendChatMessage(14, 0, "Succumb to the chill of the grave.")
LichKing:PlaySoundToSet(17218)
LichKing:Emote(469, 3000)
LichKing:Root() --If he still follows her, would not be fair for players. xD
LichKing:RegisterEvent(Adds_Spawn_A2, 5000, 1)
end
end

function IfWallIsDestroyed_H(pUnit, event)
if (Doctorzzz:IsDead() == true) and (Ghoulzzz:IsDead() == true) then
Sylvanas2:RemoveEvents()
Sylvanas2:MoveTo(5503.75, 1985.4, 736.138, 4003420)
local IceWall = Sylvanas2:GetGameObjectNearestCoords(5540.39, 2086.48, 731.066,201385)
IceWall:Activate()
IceWall:Despawn(5000, 0)
LichKing:SendChatMessage(14, 0, "Succumb to the chill of the grave.")
LichKing:PlaySoundToSet(17218)
LichKing:Emote(469, 3000)
LichKing:Root() --If he still follows her, would not be fair for players. xD
LichKing:RegisterEvent(Adds_Spawn_H2, 5000, 1)
end
end

function Adds_Spawn_A2(pUnit, event)
Jaina2:SendChatMessage(14, 0, "Another ice wall! Keep the undead from interrupting my incantation so that I may bring this wall down!")
Jaina2:PlaySoundToSet(16608)
LichKing:Emote(468, 3000)
LichKing:SpawnCreature(36940, LichKing:GetX()+1, LichKing:GetY()+1, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36940, LichKing:GetX()+2, LichKing:GetY()+2, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36940, LichKing:GetX()+3, LichKing:GetY()+3, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36940, LichKing:GetX()+4, LichKing:GetY()+4, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36941, LichKing:GetX()+5, LichKing:GetY()+2, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36941, LichKing:GetX()+5, LichKing:GetY()-2, LichKing:GetZ(), 4, 14, 0)
LichKing:FullCastSpell(69835)
LichKing:RegisterEvent(Unroot_And_Follow_Jaina2_2, 3000, 1)
Jaina2:RegisterEvent(IfAddsAreDead_A, 1, 0)
end

function Adds_Spawn_H2(pUnit, event)
Sylvanas2:SendChatMessage(14, 0, "Another barrier? Stand strong, champions! I will bring the wall down!")
Sylvanas2:PlaySoundToSet(17030)
LichKing:Emote(468, 3000)
LichKing:SpawnCreature(36940, LichKing:GetX()+1, LichKing:GetY()+1, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36940, LichKing:GetX()+2, LichKing:GetY()+2, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36940, LichKing:GetX()+3, LichKing:GetY()+3, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36940, LichKing:GetX()+4, LichKing:GetY()+4, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36941, LichKing:GetX()+5, LichKing:GetY()+2, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36941, LichKing:GetX()+5, LichKing:GetY()-2, LichKing:GetZ(), 4, 14, 0)
LichKing:FullCastSpell(69835)
LichKing:RegisterEvent(Unroot_And_Follow_Sylvanas2_2, 3000, 1)
Sylvanas2:RegisterEvent(IfAddsAreDead_H, 1, 0)
end

function Unroot_And_Follow_Jaina2_2(pUnit, event)
LichKing:Unroot()
LichKing:SetUnitToFollow(Jaina2, 1, 1) --Again. LOL
end

function Unroot_And_Follow_Sylvanas2_2(pUnit, event)
LichKing:Unroot()
LichKing:SetUnitToFollow(Sylvanas2, 1, 1) --Again. LOL
end

function IfAddsAreDead_A(pUnit, event)
if (Ghoulzzz:IsDead() == true) and (Doctorzzz:IsDead() == true) and (Abomin:IsDead() == true) then
Jaina2:RemoveEvents()
local IceWall = Jaina2:GetGameObjectNearestCoords(5494.3, 1978.27, 736.689,201385)
IceWall:Activate()
IceWall:Despawn(5000, 0)
Jaina2:MoveTo(5441.049805, 1889.430054, 749.862976, 3.905250)
LichKing:SendChatMessage(14, 0, "Another dead end.")
LichKing:PlaySoundToSet(17219)
LichKing:Emote(469, 3000)
LichKing:Root()
LichKing:RegisterEvent(If_Adds_Are_Dead_A, 3000, 1)
end
end

function IfAddsAreDead_H(pUnit, event)
if (Ghoulzzz:IsDead() == true) and (Doctorzzz:IsDead() == true) and (Abomin:IsDead() == true) then
Sylvanas2:RemoveEvents()
local IceWall = Sylvanas2:GetGameObjectNearestCoords(5494.3, 1978.27, 736.689,201385)
IceWall:Activate()
IceWall:Despawn(5000, 0)
Sylvanas2:MoveTo(5441.049805, 1889.430054, 749.862976, 3.905250)
LichKing:SendChatMessage(14, 0, "Another dead end.")
LichKing:PlaySoundToSet(17219)
LichKing:Emote(469, 3000)
LichKing:Root()
LichKing:RegisterEvent(If_Adds_Are_Dead_H, 3000, 1)
end
end

function If_Adds_Are_Dead_A(pUnit, event)
Jaina2:SendChatMessage(14, 0, "He's toying with us! I will show him what happens to ice when it meets fire!")
Jaina2:PlaySoundToSet(16609)
LichKing:Emote(468, 3000)
LichKing:SpawnCreature(36940, LichKing:GetX()+1, LichKing:GetY()+1, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36940, LichKing:GetX()+2, LichKing:GetY()+2, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36940, LichKing:GetX()+3, LichKing:GetY()+3, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36940, LichKing:GetX()+4, LichKing:GetY()+4, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36940, LichKing:GetX()+5, LichKing:GetY()+5, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(37069, LichKing:GetX()+9, LichKing:GetY()+3, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(37069, LichKing:GetX()+9, LichKing:GetY()-3, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36941, LichKing:GetX()+7, LichKing:GetY()+3, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36941, LichKing:GetX()+7, LichKing:GetY()-3, LichKing:GetZ(), 4, 14, 0)
LichKing:RegisterEvent(Unroot_And_Follow_Jaina2_3, 3000, 1)
Jaina2:RegisterEvent(IFTHEYREDEAD_A, 1, 0)
end

function If_Adds_Are_Dead_H(pUnit, event)
Sylvanas2:SendChatMessage(14, 0, "I grow tired of these games, Arthas! Your walls can't stop me!")
Sylvanas2:PlaySoundToSet(17031)
LichKing:Emote(468, 3000)
LichKing:SpawnCreature(36940, LichKing:GetX()+1, LichKing:GetY()+1, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36940, LichKing:GetX()+2, LichKing:GetY()+2, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36940, LichKing:GetX()+3, LichKing:GetY()+3, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36940, LichKing:GetX()+4, LichKing:GetY()+4, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36940, LichKing:GetX()+5, LichKing:GetY()+5, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(37069, LichKing:GetX()+9, LichKing:GetY()+3, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(37069, LichKing:GetX()+9, LichKing:GetY()-3, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36941, LichKing:GetX()+7, LichKing:GetY()+3, LichKing:GetZ(), 4, 14, 0)
LichKing:SpawnCreature(36941, LichKing:GetX()+7, LichKing:GetY()-3, LichKing:GetZ(), 4, 14, 0)
LichKing:RegisterEvent(Unroot_And_Follow_Sylvanas2_3, 3000, 1)
Sylvanas2:RegisterEvent(IFTHEYREDEAD_H, 1, 0)
end

function Unroot_And_Follow_Jaina2_3(pUnit, event)
LichKing:Unroot()
LichKing:SetUnitToFollow(Jaina2, 1, 1) --...
end

function Unroot_And_Follow_Sylvanas2_3(pUnit, event)
LichKing:Unroot()
LichKing:SetUnitToFollow(Sylvanas2, 1, 1) --...
end

function IFTHEYREDEAD_A(pUnit, event)
if (Ghoulzzz:IsDead() == true) and (Doctorzzz:IsDead() == true) and (Abomin:IsDead() == true) then
Jaina2:RemoveEvents()
local IceWall = Jaina2:GetGameObjectNearestCoords(5434.27, 1881.12, 751.303,201385)
IceWall:Activate()
IceWall:Despawn(5000, 0)
Jaina2:MoveTo(5409.439941, 1836.689941, 757.401978, 3.972)
LichKing:SendChatMessage(14, 0, "How long can you fight it?")
LichKing:PlaySoundToSet(17220)
LichKing:Emote(469, 3000)
LichKing:Root()
LichKing:RegisterEvent(Unroot_For_The_Last_Time_A, 3000, 1)
Jaina2:RegisterEvent(Finally_All_Dead_A, 1, 0)
end
end

function IFTHEYREDEAD_H(pUnit, event)
if (Ghoulzzz:IsDead() == true) and (Doctorzzz:IsDead() == true) and (Abomin:IsDead() == true) then
Sylvanas2:RemoveEvents()
local IceWall = Sylvanas2:GetGameObjectNearestCoords(5434.27, 1881.12, 751.303,201385)
IceWall:Activate()
IceWall:Despawn(5000, 0)
Sylvanas2:MoveTo(5409.439941, 1836.689941, 757.401978, 3.972)
LichKing:SendChatMessage(14, 0, "How long can you fight it?")
LichKing:PlaySoundToSet(17220)
LichKing:Emote(469, 3000)
LichKing:Root()
LichKing:RegisterEvent(Unroot_For_The_Last_Time_H, 3000, 1)
Sylvanas2:RegisterEvent(Finally_All_Dead_H, 1, 0)
end
end

function Unroot_For_The_Last_Time_A(pUnit, event)
LichKing:Unroot()
LichKing:SetUnitToFollow(Jaina2, 1, 1) -->.>
end

function Unroot_For_The_Last_Time_H(pUnit, event)
LichKing:Unroot()
LichKing:SetUnitToFollow(Sylvanas2, 1, 1) -->.>
end

function Finally_All_Dead_A(pUnit, event)
if (Ghoulzzz:IsDead() == true) and (Doctorzzz:IsDead() == true) and (Abomin:IsDead() == true) then
Jaina2:RemoveEvents()
local IceWall = Jaina2:GetGameObjectNearestCoords(5323.61, 1755.85, 770.305,201385)
IceWall:Activate()
IceWall:Despawn(5000, 0)
end
end