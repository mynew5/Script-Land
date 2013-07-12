local Tirion = nil
local Lich = nil
local Dghoul = nil
local Shorror = nil
local Valkyr = nil
local Vspirit = nil
local Rspirit = nil
local Sphere = nil
local Defile = nil
local Terenas = nil
local Trigger = nil

function Tirion_OnSpawn(pUnit, event)
Tirion = pUnit
Tirion:EquipWeapons(13262, 0, 0)
end

RegisterUnitEvent(38995, 18, "Tirion_OnSpawn")

function Lich_OnSpawn(pUnit, event)
Lich = pUnit
Lich:EquipWeapons(36942, 0, 0)
Lich:SetFaction(14)
Lich:SetUInt32Value(59, 2)
end

RegisterUnitEvent(36597, 18, "Lich_OnSpawn")

function Dghoul_OnSpawn(pUnit, event)
Dghoul = pUnit
end

RegisterUnitEvent(37695, 18, "Dghoul_OnSpawn")

function Shorror_OnSpawn(pUnit, event)
Shorror = pUnit
end

RegisterUnitEvent(37698, 18, "Shorror_OnSpawn")

function Valkyr_OnSpawn(pUnit, event)
Valkyr = pUnit
end

RegisterUnitEvent(36609, 18, "Valkyr_OnSpawn")

function Vspirit_OnSpawn(pUnit, event)
Vspirit = pUnit
Vspirit:SetMovementFlags(2)
Vspirit:SetFlying()
local player = Vspirit:GetRandomPlayer(0)
Vspirit:MoveTo(player:GetX(), player:GetY(), player:GetZ()+5, player:GetO())
if (Vspirit:GetDistanceYards(player) <= 5) then
Vspirit:FullCastSpell(70503)
end
end

RegisterUnitEvent(37799, 18, "Vspirit_OnSpawn")

function Rspirit_OnSpawn(pUnit, event)
Rspirit = pUnit
local player = Rspirit:GetRandomPlayer(0)
local model = player:GetDisplay()
Rspirit:SetModel(model)
Rspirit:FullCastSpell(69198)
end

RegisterUnitEvent(36701, 18, "Rspirit_OnSpawn")

function Sphere_OnSpawn(pUnit, event)
Sphere = pUnit
Sphere:FullCastSpell(69090)
local player = Sphere:GetRandomPlayer(0)
Sphere:MoveTo(player:GetX(), player:GetY(), player:GetZ(), player:GetO())
end

RegisterUnitEvent(36633, 18, "Sphere_OnSpawn")

function Defile_OnSpawn(pUnit, event)
Defile = pUnit
Defile:CastSpell(32759)
Defile:SetFaction(35)
Defile:FullCastSpell(72743)
Defile:Despawn(60000, 0)
end

RegisterUnitEvent(38757, 18, "Defile_OnSpawn")

function Trigger_OnSpawn(pUnit, event)
Trigger = pUnit
Trigger:SetFaction(35)
Trigger:CastSpell(32759)
Trigger:SetModel(11686)
Trigger:CastSpell(73017)
Trigger:CastSpell(72398)
Trigger:CastSpell(72405)
end

RegisterUnitEvent(38584, 18, "Trigger_OnSpawn")

function Terenas_OnSpawn(pUnit, event)
Terenas = pUnit
end

RegisterUnitEvent(38579, 18, "Terenas_OnSpawn")

function Tirion_OnGossipHello(Tirion, event, player)
Tirion:GossipCreateMenu(1, player, 0)
Tirion:GossipMenuAddItem(0, "We are prepared, Highlord. Let us battle for the fate of Azeroth! For the light of dawn!", 1, 0)
Tirion:GossipSendMenu(player)
end

function Tirion_OnGossipSelect(Tirion, event, player, id, intid, code)
if (intid == 1) then
player:GossipComplete()
Tirion:SetNPCFlags(4)
Tirion:SetMovementFlags(0)
Tirion:MoveTo(490.958710, -2124.522461, 1040.860107, 3.058129)
Tirion:RegisterEvent(THELIGHTSVAUNTED, 6000, 1)
end
end

RegisterUnitGossipEvent(38995, 1, "Tirion_OnGossipHello")
RegisterUnitGossipEvent(38995, 2, "Tirion_OnGossipSelect")

function THELIGHTSVAUNTED(pUnit, event)
Lich:SendChatMessage(14, 0, "So...the Light's vaunted justice has finally arrived. Shall I lay down Frostmourne and throw myself at your mercy, Fordring?")
Lich:PlaySoundToSet(17349)
Tirion:Emote(375, 60000)
Lich:Unroot()
Lich:SetMovementFlags(0)
Lich:MoveTo(436.663025, -2124.333984, 1059.780029, 0)
Lich:RegisterEvent(MoveTo1, 2000, 1)
Lich:RegisterEvent(WeWillGrantHimOne, 13500, 1)
end

function MoveTo1(pUnit, event)
Lich:MoveTo(441.822021, -2124.333984, 1055.044189, 0)
Lich:RegisterEvent(MoveTo2, 1000, 1)
end

function MoveTo2(pUnit, event)
Lich:MoveTo(446.729034, -2124.333984, 1050.044189, 0)
Lich:RegisterEvent(MoveTo3, 2000, 1)
end

function MoveTo3(pUnit, event)
Lich:MoveTo(451.664032, -2124.333984, 1046.058838, 0)
Lich:RegisterEvent(MoveTo4, 1500, 1)
end

function MoveTo4(pUnit, event)
Lich:MoveTo(465.069031, -2124.295166, 1040.860107, 0)
end

function WeWillGrantHimOne(pUnit, event)
Tirion:SendChatMessage(14, 0, "We will grant you a swift death, Arthas. More than can be said for the thousands you've tortured and slain.")
Tirion:PlaySoundToSet(17390)
Tirion:RegisterEvent(WeWillLearnThat, 8000, 1)
end

function WeWillLearnThat(pUnit, event)
Lich:SendChatMessage(14, 0, "You will learn of that first hand. When my work is complete, you will beg for mercy -- and I will deny you. Your anguished cries will be testament to my unbridled power.")
Lich:Emote(1, 0)
Lich:PlaySoundToSet(17350)
Lich:RegisterEvent(LichKingEmote1, 7000, 1)
Lich:RegisterEvent(WeWillAttackAnd, 24000, 1)
end

function LichKingEmote1(pUnit, event)
Lich:Emote(5, 0)
Lich:RegisterEvent(LichKingEmote2, 6000, 1)
end

function LichKingEmote2(pUnit, event)
Lich:Emote(25, 0)
Lich:RegisterEvent(LichKingEmote3, 6000, 1)
end

function LichKingEmote3(pUnit, event)
Lich:Emote(5, 0)
end

function WeWillAttackAnd(pUnit, event)
Tirion:SendChatMessage(14, 0, "So be it. Champions, attack!")
Tirion:PlaySoundToSet(17391)
Tirion:RegisterEvent(ATTAAAAAAAAACK_EMOTE, 2000, 1)
end

function ATTAAAAAAAAACK_EMOTE(pUnit, event)
Tirion:Emote(25, 0)
Tirion:RegisterEvent(HeFucksUp, 3000, 1)
end

function HeFucksUp(pUnit, event)
Tirion:SetMovementFlags(1)
Tirion:MoveTo(480.101715, -2124.511719, 1040.860107, 3.140596)
Tirion:RegisterEvent(FreezeBraaaah, 400, 1)
end

function FreezeBraaaah(pUnit, event)
Lich:FullCastSpellOnTarget(71614, Tirion)
Lich:SendChatMessage(14, 0, "I'll keep you alive to witness the end, Fordring. I would not want the Light's greatest champion to miss seeing this wretched world remade in my image.")
Lich:PlaySoundToSet(17351)
Lich:SetFaction(14)
Lich:SetUInt32Value(59, 1)
Lich:SetCombatCapable(0)
Lich:SetMovementFlags(1)
end

function Lich_OnCombat(pUnit, event)
RegisterTimedEvent("Berserk", 900000, 1)
Lich:RegisterEvent(Summon_Shambling_Horror, 30000, 0)
Lich:RegisterEvent(Summon_Drudge_Ghouls, 20000, 0)
Lich:RegisterEvent(Infest, 22000, 0)
Lich:RegisterEvent(Necrotic_Plague, 15000, 0)
Lich:RegisterEvent(Move_To_Platform_Phase1, 1, 0)
end

RegisterUnitEvent(36597, 1, "Lich_OnCombat")

function Berserk(pUnit, event)
Lich:FullCastSpell(47008)
Lich:SendChatMessage(14, 0, "Face now your tragic end.")
Lich:PlaySoundToSet(17365)
end

function Summon_Shambling_Horror(pUnit, event)
Lich:FullCastSpell(70372)
end

function Summon_Drudge_Ghouls(pUnit, event)
Lich:SpawnCreature(37695, Lich:GetX()+1, Lich:GetY()-1, Lich:GetZ(), math.random(1, 12), 14, 0)
Lich:SpawnCreature(37695, Lich:GetX()+2, Lich:GetY()-2, Lich:GetZ(), math.random(1, 12), 14, 0)
Lich:SpawnCreature(37695, Lich:GetX()+3, Lich:GetY()-3, Lich:GetZ(), math.random(1, 12), 14, 0)
end

function Infest(pUnit, event)
Lich:FullCastSpell(70541)
end

function Necrotic_Plague(pUnit, event)
Lich:FullCastSpellOnTarget(70337, Lich:GetRandomPlayer(0))
end

function Move_To_Platform_Phase1(pUnit, event)
if (Lich:GetHealthPct() <= 70) then
Lich:RemoveEvents()
Lich:SetCombatCapable(1)
Lich:MoveTo(502.188812, -2124.534668, 1040.860107, 0)
Lich:RegisterEvent(Remorseless_Winter_Phase1, 6000, 1)
end
end

function Remorseless_Winter_Phase1(pUnit, event)
Lich:RemoveEvents()
Lich:FullCastSpell(68981)
Lich:SendChatMessage(14, 0, "I will freeze you from within until all that remains is an icy husk.")
Lich:PlaySoundToSet(17369)
Lich:RegisterEvent(Lich_Destroy_Ice_Shards1, 3000, 1)
Lich:RegisterEvent(Ice_Sphere, 6000, 10) -- 10 orbs O.O?
Lich:RegisterEvent(Raging_Spirit, 20000, 3) -- 20*3 = 60 seconds + 2.5 time to get players out of the platform. BUT, since it's ArcEmu, the platform doesn't crack. >_<
Lich:RegisterEvent(Pain_and_Suffering, 3000, 20) -- EXACTLY 20 Pain and Suffering spells when he casts Remorseless Winter.
Lich:RegisterEvent(Quake_Phase1, 62500, 1)
end

function Lich_Destroy_Ice_Shards1(pUnit, event)
Lich:GetGameObjectNearestCoords(533.56, -2096.48, 1040.86,202144):Activate()
Lich:RegisterEvent(Lich_Destroy_Ice_Shards2, 10, 1)
end

function Lich_Destroy_Ice_Shards2(pUnit, event)
Lich:GetGameObjectNearestCoords(533.56, -2152.83, 1040.86,202143):Activate()
Lich:RegisterEvent(Lich_Destroy_Ice_Shards3, 10, 1)
end

function Lich_Destroy_Ice_Shards3(pUnit, event)
Lich:GetGameObjectNearestCoords(473.748, -2152.83, 1040.86,202142):Activate()
Lich:RegisterEvent(Lich_Destroy_Ice_Shards4, 10, 1)
end

function Lich_Destroy_Ice_Shards4(pUnit, event)
Lich:GetGameObjectNearestCoords(473.748, -2096.48, 1040.86,202141):Activate()
end

function Ice_Sphere(pUnit, event)
Lich:SpawnCreature(36633, Lich:GetX()+1, Lich:GetY()-1, Lich:GetZ(), math.random(1, 12), 14, 0)
end

function Raging_Spirit(pUnit, event)
Lich:SpawnCreature(36701, Lich:GetX()+1, Lich:GetY()-1, Lich:GetZ(), math.random(1, 12), 14, 0)
end

function Pain_and_Suffering(pUnit, event)
Lich:FullCastSpellOnTarget(72133, Lich:GetRandomPlayer(0))
end

function Quake_Phase1(pUnit, event)
Lich:RemoveEvents()
Lich:FullCastSpell(72262)
Lich:SendChatMessage(14, 0, "Watch as the world around you collapses!")
Lich:PlaySoundToSet(17370)
Lich:RegisterEvent(When_Quake_Ends_Register_Events, 7500, 1)
end

function When_Quake_Ends_Register_Events(pUnit, event)
Lich:SetCombatCapable(0)
Lich:RegisterEvent(Infest, 22000, 0) -- The Lich King retains Infest spell.
Lich:RegisterEvent(Soul_Reaper, 30000, 0) -- Da Lich King casts Soul Reaper every 30 seconds.... O;
Lich:RegisterEvent(Defile, math.random(50000, 60000), 0)
Lich:RegisterEvent(Summon_ValKyr, math.random(20000, 25000), 0)
Lich:RegisterEvent(Move_To_Platform_Phase2, 1, 0)
end

function Infest(pUnit, event)
Lich:FullCastSpell(70541)
end

function Soul_Reaper(pUnit, event)
Lich:FullCastSpellOnTarget(69409, Lich:GetMainTank())
end

function Defile(pUnit, event)
local Player = Lich:GetRandomPlayer(0)
Lich:SpawnCreature(38757, Player:GetX(), Player:GetY(), Player:GetZ(), Player:GetO(), 35, 0)
end

function Summon_ValKyr(pUnit, event)
Lich:FullCastSpell(69037)
Lich:SendChatMessage(14, 0, "Val'kyr, your master calls!")
Lich:PlaySoundToSet(17373)
end

function Move_To_Platform_Phase2(pUnit, event)
if (Lich:GetHealthPct() <= 40) then
Lich:RemoveEvents()
Lich:SetCombatCapable(1)
Lich:MoveTo(502.188812, -2124.534668, 1040.860107, 0)
Lich:RegisterEvent(Remorseless_Winter_Phase2, 6000, 1)
end
end

function Remorseless_Winter_Phase2(pUnit, event)
Lich:RemoveEvents()
Lich:FullCastSpell(72259)
Lich:SendChatMessage(14, 0, "I will freeze you from within until all that remains is an icy husk.")
Lich:PlaySoundToSet(17369)
Lich:RegisterEvent(Ice_Sphere1, 6000, 10) -- 10 orbs O.O?
Lich:RegisterEvent(Raging_Spirit1, 15000, 4) -- 15*4 = 60 seconds + 2.5 time to get players out of the platform. BUT, since it's ArcEmu, the platform doesn't crack. >_<
Lich:RegisterEvent(Pain_and_Suffering1, 3000, 20) -- EXACTLY 20 Pain and Suffering spells when he casts Remorseless Winter.
Lich:RegisterEvent(Quake_Phase2, 62500, 1)
end

function Ice_Sphere1(pUnit, event)
Lich:SpawnCreature(36633, Lich:GetX()+1, Lich:GetY()-1, Lich:GetZ(), math.random(1, 12), 14, 0)
end

function Raging_Spirit1(pUnit, event)
Lich:SpawnCreature(36701, Lich:GetX()+1, Lich:GetY()-1, Lich:GetZ(), math.random(1, 12), 14, 0)
end

function Pain_and_Suffering1(pUnit, event)
Lich:FullCastSpellOnTarget(72133, Lich:GetRandomPlayer(0))
end

function Quake_Phase2(pUnit, event)
Lich:RemoveEvents()
Lich:FullCastSpell(72262)
Lich:SendChatMessage(14, 0, "Watch as the world around you collapses!")
Lich:PlaySoundToSet(17370)
Lich:RegisterEvent(When_Quake_Ends_Register_Events1, 7500, 1)
end

function When_Quake_Ends_Register_Events1(pUnit, event)
Lich:SetCombatCapable(0)
Lich:RegisterEvent(Harvest_Soul, 70000, 0)
Lich:RegisterEvent(Soul_Reaper1, 30000, 0)
Lich:RegisterEvent(Defile1, math.random(50000, 60000), 0)
Lich:RegisterEvent(Vile_Spirits, 30000, 0)
Lich:RegisterEvent(Final_Phase_Checker, 1, 0)
end

function Harvest_Soul(pUnit, event)
Lich:SendChatMessage(14, 0, "Frostmourne hungers...")
Lich:PlaySoundToSet(17366)
Lich:FullCastSpellOnTarget(68980, Lich:GetRandomPlayer(0))
end

function Soul_Reaper1(pUnit, event)
Lich:FullCastSpellOnTarget(69409, Lich:GetMainTank())
end

function Defile1(pUnit, event)
local Player = Lich:GetRandomPlayer(0)
Lich:SpawnCreature(38757, Player:GetX(), Player:GetY(), Player:GetZ(), Player:GetO(), 35, 0)
end

function Vile_Spirits(pUnit, event)
Lich:FullCastSpell(70500)
Lich:SpawnCreature(37799, Lich:GetX()+1, Lich:GetY()-1, Lich:GetZ()+30, math.random(1, 12), 14, 30000)
Lich:SpawnCreature(37799, Lich:GetX()+2, Lich:GetY()-2, Lich:GetZ()+30, math.random(1, 12), 14, 30000)
Lich:SpawnCreature(37799, Lich:GetX()+3, Lich:GetY()-3, Lich:GetZ()+30, math.random(1, 12), 14, 30000)
Lich:SpawnCreature(37799, Lich:GetX()+4, Lich:GetY()-4, Lich:GetZ()+30, math.random(1, 12), 14, 30000)
Lich:SpawnCreature(37799, Lich:GetX()+5, Lich:GetY()-5, Lich:GetZ()+30, math.random(1, 12), 14, 30000)
Lich:SpawnCreature(37799, Lich:GetX()-1, Lich:GetY()+1, Lich:GetZ()+30, math.random(1, 12), 14, 30000)
Lich:SpawnCreature(37799, Lich:GetX()-2, Lich:GetY()+2, Lich:GetZ()+30, math.random(1, 12), 14, 30000)
Lich:SpawnCreature(37799, Lich:GetX()-3, Lich:GetY()+3, Lich:GetZ()+30, math.random(1, 12), 14, 30000)
Lich:SpawnCreature(37799, Lich:GetX()-4, Lich:GetY()+4, Lich:GetZ()+30, math.random(1, 12), 14, 30000)
Lich:SpawnCreature(37799, Lich:GetX()-5, Lich:GetY()+5, Lich:GetZ()+30, math.random(1, 12), 14, 30000)
end

function Final_Phase_Checker(pUnit, event)
if (Lich:GetHealthPct() <= 10) then
Lich:RemoveEvents()
Lich:SetCombatCapable(1)
Lich:FullCastSpell(72350)
Lich:RegisterEvent(The_Lich_King_Won, 2600, 1)
end
local playerz = Lich:GetInRangePlayers()
for k, players in pairs (playerz) do
Lich:Kill(players)
Lich:RemoveThreat(players)
players:RemoveThreat(Lich)
end
end

function The_Lich_King_Won(pUnit, event)
Lich:SetHealthPct(10)
Lich:SendChatMessage(14, 0, "No questions remain unanswered. No doubts linger. You are Azeroth's greatest champions! You overcame every challenge I laid before you. My mightiest servants have fallen before your relentless onslaught, your unbridled fury...")
Lich:Emote(1, 0)
Lich:PlaySoundToSet(17353)
Lich:RegisterEvent(IsItRighteousness, 27000, 1)
local DeadPlayersWithBuff = Lich:GetInRangePlayers()
for k, players in pairs (DeadPlayersWithBuff) do
players:AddAura(72351, 0)
end
end

function IsItRighteousness(pUnit, event)
Lich:SendChatMessage(14, 0, "Is it truly righteousness that drives you? I wonder.")
Lich:Emote(6, 0)
Lich:PlaySoundToSet(17354)
Lich:RegisterEvent(HeTrainedThemWell, 8500, 1)
end

function HeTrainedThemWell(pUnit, event)
Lich:SendChatMessage(14, 0, "You trained them well, Fordring. You delivered the greatest fighting force this world has ever known... right into my hands -- exactly as I intended. You shall be rewarded for your unwitting sacrifice.")
Lich:PlaySoundToSet(17355)
Lich:RegisterEvent(RaisingPlayersScourge, 23000, 1)
end

function RaisingPlayersScourge(pUnit, event)
Lich:SetMovementFlags(1)
Lich:MoveTo(502.188812, -2124.534668, 1040.860107, 0)
Lich:RegisterEvent(IfHeIsTrulyThere, 7000, 1)
end

function IfHeIsTrulyThere(pUnit, event)
Lich:RemoveEvents()
Lich:SetFacing(0)
Lich:RegisterEvent(WatchNowAsIRaise, 2000, 1)
end

function WatchNowAsIRaise(pUnit, event)
Lich:SendChatMessage(14, 0, "Watch now as I raise them from the dead to become masters of the Scourge. They will shroud this world in chaos and destruction. Azeroth's fall will come at their hands -- and you will be the first to die.")
Lich:PlaySoundToSet(17356)
Lich:RegisterEvent(IDelightInTheIrony, 27000, 1)
local PlayersInRange = Lich:GetInRangePlayers()
for k, players in pairs (PlayersInRange) do
Lich:ChannelSpell(71769, players)
end
end

function IDelightInTheIrony(pUnit, event)
Lich:SendChatMessage(14, 0, "I delight in the irony.")
Lich:PlaySoundToSet(17357)
Lich:RegisterEvent(TirionIceBlock, 7000, 1)
end

function TirionIceBlock(pUnit, event)
Tirion:SendChatMessage(14, 0, "LIGHT GRANT ME ONE FINAL BLESSING! GIVE ME THE STRENGTH... TO SHATTER THESE BONDS!")
Tirion:PlaySoundToSet(17392)
Tirion:RegisterEvent(DebuffIceBlock, 7000, 1)
end

function DebuffIceBlock(pUnit, event)
Tirion:RemoveAura(71614)
Tirion:CastSpell(71797)
Tirion:AddAura(71614, 0)
Tirion:RegisterEvent(RemoveIceBlock, 6000, 1)
end

function RemoveIceBlock(pUnit, event)
Tirion:RemoveAllAuras()
Tirion:MoveTo(490.200317, -2124.694580, 1040.860107, 0)
Tirion:RegisterEvent(ShatterFrostmourne, 2500, 1)
end

function ShatterFrostmourne(pUnit, event)
Tirion:SetMovementFlags(2)
Tirion:SetFlying()
Tirion:Emote(375, 60000)
Tirion:MoveTo(Lich:GetX(), Lich:GetY(), Lich:GetZ()+5, Lich:GetO())
Tirion:Emote(375, 60000)
Tirion:RegisterEvent(MoveDownAndTheLichKing, 2000, 1)
end

function MoveDownAndTheLichKing(pUnit, event)
Lich:StopChannel()
Tirion:MoveTo(516.148010, -2124.755371, 1040.860962, 0)
Tirion:CastSpell(71809)
Tirion:CastSpell(71811)
Lich:EquipWeapons(0, 0, 0)
Lich:Emote(416, 0)
Lich:RegisterEvent(TirionFlagsAndAnotherEmote, 3500, 1)
end

function TirionFlagsAndAnotherEmote(pUnit, event)
Tirion:SetMovementFlags(1)
Lich:Emote(417, 12000)
Tirion:SpawnCreature(38584, 508.814270, -2124.921143, 1040.860962, 3.216727, 35, 0)
Lich:RegisterEvent(ImpossibruHasHappened, 2000, 1)
end

function ImpossibruHasHappened(pUnit, event)
Lich:SendChatMessage(14, 0, "Impossible...")
Lich:PlaySoundToSet(17358)
Lich:RegisterEvent(TirionGoToBLEEEEEEH, 5000, 1)
end

function TirionGoToBLEEEEEEH(pUnit, event)
Tirion:SendChatMessage(14, 0, "No more, Arthas! No more lives will be consumed by your hatred!")
Tirion:PlaySoundToSet(17393)
Trigger:FullCastSpell(72405)
Trigger:Root() --What if he just goes CRAZY O.O?
Lich:SetMovementFlags(2)
Lich:SetFlying()
Lich:MoveTo(Trigger:GetX(), Trigger:GetY(), Trigger:GetZ()+5, 0)
Lich:Emote(473, 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999)
Lich:PlaySoundToSet(17360) --And now, best sound ever goes to The Lich Kin- *dies* SILENCE, PALADIN!
Lich:Emote(473, 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999)
Lich:Emote(473, 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999)
Lich:Emote(473, 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999)
Lich:Emote(473, 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999)
Lich:Emote(473, 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999)
Lich:Emote(473, 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999)
Lich:Emote(473, 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999)
Lich:Emote(473, 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999)
Lich:Emote(473, 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999)
Lich:Emote(473, 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999)
Tirion:RegisterEvent(Teleport_Terenas_Holy_Shet, 4000, 1)
end

function Teleport_Terenas_Holy_Shet(pUnit, event)
Tirion:SpawnCreature(38579, 515.155823, -2124.443848, 1040.860962, 3.216727, 35, 0)
Tirion:RegisterEvent(Terenas_First_Talk, 3000, 1)
end

function Terenas_First_Talk(pUnit, event)
Terenas:SendChatMessage(14, 0, "Free at last! It is over, my son. This is the moment of reckoning.")
Terenas:PlaySoundToSet(17397)
Terenas:RegisterEvent(RISEUPCHAMPIONS, 11100, 1)
end

function RISEUPCHAMPIONS(pUnit, event)
Terenas:SendChatMessage(14, 0, "Rise up, champions of the Light!")
Terenas:PlaySoundToSet(17398)
Terenas:FullCastSpell(72429)
Tirion:MoveTo(510.469421, -2122.516602, 1040.860962)
Terenas:RegisterEvent(NabSpellDoesntWork, 3000, 1)
end

function NabSpellDoesntWork(pUnit, event)
Tirion:SendChatMessage(14, 0, "The Lich King... MUST... FALL!")
Tirion:PlaySoundToSet(17389)
Tirion:RegisterEvent(HeStandsAboveUs, 6000, 1)
local DeadNabs = Terenas:GetInRangePlayers()
for k, players in pairs (DeadNabs) do
players:CastSpell(72423)
players:RemoveAura(72351)
end
end

function HeStandsAboveUs(pUnit, event)
Lich:SendChatMessage(14, 0, "Now I stand, the lion before the lambs... and they do not fear.")
Lich:PlaySoundToSet(17361)
Lich:RegisterEvent(TheyCannotFear, 9700, 1)
end

function TheyCannotFear(pUnit, event)
Lich:SendChatMessage(14, 0, "They cannot fear...")
Lich:PlaySoundToSet(17362)
Lich:RegisterEvent(IfHeIsStillAlive, 1, 0)
end

function IfHeIsStillAlive(pUnit, event)
if (Lich:IsDead() == true) then
Lich:RemoveEvents()
Tirion:RemoveEvents()
Terenas:RemoveEvents()
Lich:Land(1)
Lich:PlaySoundToSet(17374)
Trigger:Despawn(1, 0)
Tirion:RegisterEvent(PlayMovie, 9000, 1)
end
end

function PlayMovie(pUnit, event)
Tirion:RegisterEvent(DespawnGameObjects, 1000, 1)
local MoviePlayers = Tirion:GetInRangePlayers()
for k, Players in pairs(MoviePlayers) do
local Packet = LuaPacket:CreatePacket(0x464, 4)
Packet:WriteULong(16)
Players:SendPacketToPlayer(Packet)
end
end

function DespawnGameObjects(pUnit, event)
local Bolvar = Tirion:GetGameObjectNearestCoords(422.185, -2122.98, 1072.77,202437)
Bolvar:Despawn(1, 0)
Tirion:SpawnGameObject(202438, 425.089, -2123.31, 1058.68, 0, 0, 290)
Tirion:SpawnGameObject(202436, 426.716675, -2123.534424, 1064.888672, 3.148398, 0, 100)
end

function Lich_OnKilledPlayer(pUnit, event)
local players = Lich:GetInRangePlayers()
if (players:HasAura(72351) == true) then
end
if (players:HasAura(72351) == false) then
local chance = math.random(1, 2)
if (chance == 1) then
Lich:SendChatMessage(14, 0, "Hope wanes...")
Lich:PlaySoundToSet(17363)
end
if (chance == 2) then
Lich:SendChatMessage(14, 0, "The end has come...")
Lich:PlaySoundToSet(17364)
end
end
end

RegisterUnitEvent(36597, 2, "Lich_OnKilledPlayer")

function Lich_OnLeaveCombat(pUnit, event)
Lich:RemoveEvents()
Tirion:RemoveEvents()
Lich:Despawn(1, 20000)
Tirion:RemoveAllAuras()
Tirion:ReturnToSpawnPoint()
end

RegisterUnitEvent(36597, 3, "Lich_OnLeaveCombat")