local Jaina1 = nil
local Sylvanas1 = nil
local Uther = nil
local LichKing2 = nil
local Falric = nil
local Marwyn = nil
local Gpriest = nil
local Pmage = nil
local Smerc = nil
local Footman = nil
local Trifle = nil

function Jaina1_OnSpawn(pUnit, event)
Jaina1 = pUnit
Jaina1:SetNPCFlags(3)
Jaina1:EquipWeapons(2177, 12869, 0)
Jaina1:RegisterEvent(OpenDoorWhenPlayerComesA, 500, 1)
end

RegisterUnitEvent(37221, 18, "Jaina1_OnSpawn")

function OpenDoorWhenPlayerComesA(pUnit, event)
Jaina1:GetGameObjectNearestCoords(5264.583008, 1959.413818, 707.695984,197341):Activate()
end

RegisterUnitEvent(36955, 18, "Jaina2_OnSpawn")

function Sylvanas1_OnSpawn(pUnit, event)
Sylvanas1 = pUnit
Sylvanas1:SetNPCFlags(3)
Sylvanas1:EquipWeapons(2179, 0, 42775)
Sylvanas1:RegisterEvent(OpenDoorWhenPlayerComesH, 500, 1)
end

RegisterUnitEvent(37223, 18, "Sylvanas1_OnSpawn")

function OpenDoorWhenPlayerComesH(pUnit, event)
Sylvanas1:GetGameObjectNearestCoords(5264.583008, 1959.413818, 707.695984,197341):Activate()
end

function Uther_OnSpawn(pUnit, event)
Uther = pUnit
Uther:EquipWeapons(37579, 12860, 0)
end

RegisterUnitEvent(37225, 18, "Uther_OnSpawn")

function LichKing2_OnSpawn(pUnit, event)
LichKing2 = pUnit
end

RegisterUnitEvent(36954, 18, "LichKing2_OnSpawn")

function Falric_OnSpawn(pUnit, event)
Falric = pUnit
Falric:SetUInt32Value(59, 2)
Falric:EquipWeapons(50249, 49777, 0)
Falric:CastSpell(72712)
Falric:MoveTo(5278.729492, 2035.679199, 709.319702, 5.543657)
end

RegisterUnitEvent(38112, 18, "Falric_OnSpawn")

function Marwyn_OnSpawn(pUnit, event)
Marwyn = pUnit
Marwyn:SetUInt32Value(59, 2)
Marwyn:EquipWeapons(50248, 50248, 0)
Marwyn:CastSpell(72712)
Marwyn:MoveTo(5340.233398, 1977.202515, 709.319763, 2.413062)
end

RegisterUnitEvent(38113, 18, "Marwyn_OnSpawn")

function Falric_OnCombat(pUnit, event)
Falric:SendChatMessage(14, 0, "Men, women and children... None were spared the master's wrath. Your death will be no different.")
Falric:PlaySoundToSet(16710)
local Difficulty = Falric:GetDungeonDifficulty()
if (Difficulty == 1) then
Falric:RegisterEvent(Defiling_Horror, math.random(14000, 19000), 0)
Falric:RegisterEvent(Hopelessness, 10000, 0)
Falric:RegisterEvent(Impending_Despair, math.random(15000, 18000), 0)
Falric:RegisterEvent(Quivering_Strike, 12000, 0)
else
Falric:RegisterEvent(Defiling_Horror, math.random(12000, 19000), 0)
Falric:RegisterEvent(Hopelessness, 8000, 0)
Falric:RegisterEvent(Impending_Despair, math.random(14000, 18000), 0)
Falric:RegisterEvent(Quivering_Strike, 10000, 0)
end
end

RegisterUnitEvent(38112, 1, "Falric_OnCombat")

function Defiling_Horror(pUnit, event)
Falric:SendChatMessage(14, 0, "Fear... so exhilarating...")
Falric:PlaySoundToSet(16716)
Falric:FullCastSpell(72435)
end

function Hopelessness(pUnit, event)
local difficulty = Falric:GetDungeonDifficulty()
if (difficulty == 1) then
local NChoice = math.random(1, 3)
if (NChoice == 1) then
Falric:FullCastSpell(72395)
elseif (NChoice == 2) then
Falric:FullCastSpell(72396)
elseif (NChoice == 3) then
Falric:FullCastSpell(72397)
end
elseif (difficulty == 2) then
local HChoice = math.random(1, 3)
if (HChoice == 1) then
Falric:FullCastSpell(72390)
elseif (HChoice == 2) then
Falric:FullCastSpell(72391)
elseif (HChoice == 3) then
Falric:FullCastSpell(72393)
end
end
end

function Impending_Despair(pUnit, event)
Falric:SendChatMessage(14, 0, "Despair... so delicious...")
Falric:PlaySoundToSet(16715)
Falric:FullCastSpellOnTarget(72426, Falric:GetMainTank())
end

function Falric_OnKilledPlayer(pUnit, event)
local chance = math.random(1, 2)
if (chance == 1) then
Falric:SendChatMessage(14, 0, "Sniveling maggot!")
Falric:PlaySoundToSet(16711)
elseif (chance == 2) then
Falric:SendChatMessage(14, 0, "The children of Stratholme fought with more ferocity!")
Falric:PlaySoundToSet(16712)
end
end

RegisterUnitEvent(38112, 2, "Falric_OnKilledPlayer")

function Falric_OnLeaveCombat(pUnit, event)
Falric:Despawn(1000, 0)
end

RegisterUnitEvent(38112, 3, "Falric_OnLeaveCombat")

function Falric_OnDeath(pUnit, event)
Falric:SendChatMessage(14, 0, "Marwyn, finish them...")
Falric:PlaySoundToSet(16713)
RegisterTimedEvent("Marwyn_Activate", 5000, 1)
end

RegisterUnitEvent(38112, 4, "Falric_OnDeath")

function Marwyn_Activate(pUnit, event)
Marwyn:SendChatMessage(14, 0, "The master surveyed his kingdom and found it... Lacking. His judgement was swift and without mercy: DEATH TO ALL!")
Marwyn:PlaySoundToSet(16738)
Marwyn:RegisterEvent(WavesSpawn_6, 14000, 1)
end

function Marwyn_OnCombat(pUnit, event)
Marwyn:SendChatMessage(14, 0, "Death is all that you will find here!")
Marwyn:PlaySoundToSet(16734)
Marwyn:RegisterEvent(Corrupted_Flesh, math.random(14000, 20000), 0)
Marwyn:RegisterEvent(Obliterate, 10000, 0)
Marwyn:RegisterEvent(Shared_Suffering, 12000, 0)
Marwyn:RegisterEvent(Well_of_Corruption, math.random(15000, 18500), 0)
end

RegisterUnitEvent(38113, 1, "Marwyn_OnCombat")

function Corrupted_Flesh(pUnit, event)
local chance = math.random(1, 2)
if (chance == 1) then
Marwyn:FullCastSpell(72363)
Marwyn:SendChatMessage(14, 0, "Your flesh shall decay before your very eyes!")
Marwyn:PlaySoundToSet(16739)
elseif (chance == 2) then
Marwyn:FullCastSpell(72363)
Marwyn:SendChatMessage(14, 0, "Waste away into nothingness!")
Marwyn:PlaySoundToSet(16740)
end
end

function Obliterate(pUnit, event)
Marwyn:FullCastSpellOnTarget(72360, Marwyn:GetMainTank())
end

function Shared_Suffering(pUnit, event)
Marwyn:FullCastSpellOnTarget(72368, Marwyn:GetRandomPlayer(0))
end

function Well_of_Corruption(pUnit, event)
Marwyn:FullCastSpellOnTarget(72362, Marwyn:GetMainTank())
end

function Marwyn_OnKilledPlayer(pUnit, event)
local chance = math.random(1, 2)
if (chance == 1) then
Marwyn:SendChatMessage(14, 0, "I saw the same look in his eyes when he died. Terenas could hardly believe it. Hahahaha!")
Marwyn:PlaySoundToSet(16735)
elseif (chance == 2) then
Marwyn:SendChatMessage(14, 0, "Choke on your suffering!")
Marwyn:PlaySoundToSet(16736)
end
end

RegisterUnitEvent(38113, 2, "Marwyn_OnKilledPlayer")

function Marwyn_OnLeaveCombat(pUnit, event)
Marwyn:Despawn(1000, 0)
end

RegisterUnitEvent(38113, 3, "Marwyn_OnLeaveCombat")

function Gpriest_OnSpawn(pUnit, event)
Gpriest = pUnit
end

RegisterUnitEvent(38175, 18, "Gpriest_OnSpawn")

function Pmage_OnSpawn(pUnit, event)
Pmage = pUnit
end

RegisterUnitEvent(38172, 18, "Pmage_OnSpawn")

function Trifle_OnSpawn(pUnit, event)
Trifle = pUnit
end

RegisterUnitEvent(38176, 18, "Trifle_OnSpawn")

function Smerc_OnSpawn(pUnit, event)
Smerc = pUnit
end

RegisterUnitEvent(38177, 18, "Smerc_OnSpawn")

function Footman_OnSpawn(pUnit, event)
Footman = pUnit
end

RegisterUnitEvent(38173, 18, "Footman_OnSpawn")

function Jaina1_OnGossipHello(Jaina1, event, player)
Jaina1:GossipCreateMenu(1, player, 0)
Jaina1:GossipMenuAddItem(0, "Can you remove the sword?", 1, 0)
Jaina1:GossipMenuAddItem(0, "My lady, I think I hear Arthas coming. Whatever you're going to do, do it quickly.", 2, 0)
Jaina1:GossipSendMenu(player)
end

function Jaina1_OnGossipSelect(Jaina1, event, player, id, intid, code)
if (intid == 1) then
Jaina1:RegisterEvent(Jaina1_First_Scene_Talk1, 2000, 1)
Jaina1:SetNPCFlags(4)
player:GossipComplete()
elseif(intid == 2) then
player:GossipComplete()
end
end

RegisterUnitGossipEvent(37221, 1, "Jaina1_OnGossipHello")
RegisterUnitGossipEvent(37221, 2, "Jaina1_OnGossipSelect")

function Sylvanas1_OnGossipHello(Sylvanas1, event, player)
Sylvanas1:GossipCreateMenu(15215, player, 0)
Sylvanas1:GossipMenuAddItem(0, "Can you remove the sword?", 1, 0)
Sylvanas1:GossipSendMenu(player)
end

function Sylvanas1_OnGossipSelect(Sylvanas1, event, player, id, intid, code)
if (intid == 1) then
Sylvanas1:RegisterEvent(Sylvanas1_First_Scene_Talk1, 2000, 1)
Sylvanas1:SetNPCFlags(4)
player:GossipComplete()
end
end

RegisterUnitGossipEvent(37223, 1, "Sylvanas1_OnGossipHello")
RegisterUnitGossipEvent(37223, 2, "Sylvanas1_OnGossipSelect")

function Jaina1_First_Scene_Talk1(pUnit, event)
Jaina1:SendChatMessage(14, 0, "The chill of this place... Brr... I can feel my blood freezing.")
Jaina1:PlaySoundToSet(16631)
Jaina1:RegisterEvent(Jaina1_First_Scene_Talk2, 7000, 1)
end

function Sylvanas1_First_Scene_Talk1(pUnit, event)
Sylvanas1:SendChatMessage(14, 0, "I... I don't believe it! Frostmourne stands before us, unguarded! Just as the Gnome claimed. Come, heroes!")
Sylvanas1:Emote(1, 0)
Sylvanas1:PlaySoundToSet(17049)
Sylvanas1:SetMovementFlags(1)
Sylvanas1:RegisterEvent(Sylvanas1_First_Scene_Talk2, 8000, 1)
end

function Jaina1_First_Scene_Talk2(pUnit, event)
Jaina1:SendChatMessage(14, 0, "What is that? Up ahead! Could it be... ? Heroes at my side!")
Jaina1:Emote(6, 0)
Jaina1:PlaySoundToSet(16632)
Jaina1:SetMovementFlags(1)
Jaina1:RegisterEvent(Jaina1_First_Scene_Talk3, 5000, 1)
end

function Sylvanas1_First_Scene_Talk2(pUnit, event)
Sylvanas1:MoveTo(5305.859863, 1998.553711, 709.341370, 1.209050)
Sylvanas1:RegisterEvent(Sylvanas1_First_Scene_Talk3, 10000, 1)
end

function Jaina1_First_Scene_Talk3(pUnit, event)
Jaina1:MoveTo(5305.859863, 1998.553711, 709.341370, 1.209050)
Jaina1:RegisterEvent(Jaina1_First_Scene_Talk4, 11000, 1)
end

function Sylvanas1_First_Scene_Talk3(pUnit, event)
Sylvanas1:SendChatMessage(14, 0, "Standing this close to the blade that ended my life... The pain... It is renewed.")
Sylvanas1:Emote(1, 0)
Sylvanas1:PlaySoundToSet(17050)
Sylvanas1:RegisterEvent(Sylvanas1_First_Scene_Talk4, 11000, 1)
end

function Jaina1_First_Scene_Talk4(pUnit, event)
Jaina1:SendChatMessage(14, 0, "Frostmourne! The blade that destroyed our kingdom...")
Jaina1:Emote(1, 0)
Jaina1:PlaySoundToSet(16633)
Jaina1:RegisterEvent(Jaina1_First_Scene_Talk5, 6000, 1)
end

function Sylvanas1_First_Scene_Talk4(pUnit, event)
Sylvanas1:SetFacing(1.209050)
Sylvanas1:RegisterEvent(Sylvanas1_First_Scene_Talk5, 3000, 1)
end

function Jaina1_First_Scene_Talk5(pUnit, event)
Jaina1:SetFacing(1.209050)
Jaina1:RegisterEvent(Jaina1_First_Scene_Talk6, 4000, 1)
end

function Sylvanas1_First_Scene_Talk5(pUnit, event)
Sylvanas1:SendChatMessage(14, 0, "I dare not touch it. Stand back! Stand back as I attempt to commune with the blade! Perhaps our salvation lies within...")
Sylvanas1:PlaySoundToSet(17051)
Sylvanas1:RegisterEvent(Sylvanas1_Commune_Spirits, 3000, 1)
end

function Jaina1_First_Scene_Talk6(pUnit, event)
Jaina1:SendChatMessage(14, 0, "Stand back! Touch that blade and your soul will be scarred for all eternity! I must attempt to commune with the spirits locked away within Frostmourne. Give me space, back up please!")
Jaina1:Emote(1, 0)
Jaina1:PlaySoundToSet(16634)
Jaina1:RegisterEvent(Jaina1_Commune_Spirits, 5000, 1)
end

function Sylvanas1_Commune_Spirits(pUnit, event)
local Frostmourne = Sylvanas1:GetGameObjectNearestCoords(5309.51, 2006.64, 709.341,202302)
Sylvanas1:FullCastSpellOnTarget(65633, Frostmourne)
Sylvanas1:RegisterEvent(Sylvanas1_Frostmourne_Activate, 3000, 1)
end

function Jaina1_Commune_Spirits(pUnit, event)
local Frostmourne = Jaina1:GetGameObjectNearestCoords(5309.51, 2006.64, 709.341,202302)
Jaina1:FullCastSpellOnTarget(65633, Frostmourne)
Jaina1:RegisterEvent(Jaina1_Frostmourne_Activate, 3000, 1)
end

function Sylvanas1_Frostmourne_Activate(pUnit, event)
local Frostmourne = Sylvanas1:GetGameObjectNearestCoords(5309.51, 2006.64, 709.341,202302):Activate()
Sylvanas1:CastSpell(70667)
Sylvanas1:RegisterEvent(Sylvanas1_Uther_Appears, 7000, 1)
end

function Jaina1_Frostmourne_Activate(pUnit, event)
local Frostmourne = Jaina1:GetGameObjectNearestCoords(5309.51, 2006.64, 709.341,202302):Activate()
Jaina1:CastSpell(70667)
Jaina1:RegisterEvent(Jaina1_Uther_Appears, 7000, 1)
end

function Sylvanas1_Uther_Appears(pUnit, event)
Sylvanas1:SpawnCreature(37225, 5307.620605, 2002.489868, 709.341370, 4.288599, 35, 0)
Sylvanas1:RegisterEvent(Uther_First_Scene_Talk1H, 2000, 1)
end

function Jaina1_Uther_Appears(pUnit, event)
Jaina1:SpawnCreature(37225, 5307.620605, 2002.489868, 709.341370, 4.288599, 35, 0)
Jaina1:RegisterEvent(Uther_First_Scene_Talk1A, 2000, 1)
end

function Uther_First_Scene_Talk1H(pUnit, event)
Uther:SendChatMessage(12, 0, "Careful, girl. I've heard talk of that cursed blade saving us before. Look around you and see what has been born of Frostmourne.")
Uther:Emote(1, 0)
Uther:PlaySoundToSet(16659)
Uther:RegisterEvent(Sylvanas1_First_Scene_Talk6, 12000, 1)
end

function Uther_First_Scene_Talk1A(pUnit, event)
Uther:SendChatMessage(12, 0, "Jaina! Could it truly be you?")
Uther:Emote(5, 0)
Uther:PlaySoundToSet(16666)
Uther:RegisterEvent(Jaina1_First_Scene_Talk7, 5000, 1)
end

function Sylvanas1_First_Scene_Talk6(pUnit, event)
Sylvanas1:SendChatMessage(12, 0, "Uther...Uther the Lightbringer. How...")
Sylvanas1:Emote(1, 0)
Sylvanas1:PlaySoundToSet(17052)
Sylvanas1:RegisterEvent(Uther_First_Scene_Talk2H, 5000, 1)
end

function Jaina1_First_Scene_Talk7(pUnit, event)
Jaina1:SendChatMessage(12, 0, "Uther! Dear Uther! ... I... I'm so sorry.")
Jaina1:Emote(1, 0)
Jaina1:PlaySoundToSet(16635)
Jaina1:RegisterEvent(Uther_First_Scene_Talk2A, 7000, 1)
end

function Uther_First_Scene_Talk2H(pUnit, event)
Uther:SendChatMessage(12, 0, "You haven't much time. The Lich King sees what the sword sees. He will be here shortly.")
Uther:Emote(1, 0)
Uther:PlaySoundToSet(16660)
Uther:RegisterEvent(Sylvanas1_First_Scene_Talk7, 7000, 1)
end

function Uther_First_Scene_Talk2A(pUnit, event)
Uther:SendChatMessage(12, 0, "Jaina you haven't much time. The Lich King sees what the sword sees. He will be here shortly!")
Uther:Emote(1, 0)
Uther:PlaySoundToSet(16667)
Uther:RegisterEvent(Jaina1_First_Scene_Talk8, 8000, 1)
end

function Sylvanas1_First_Scene_Talk7(pUnit, event)
Sylvanas1:SendChatMessage(12, 0, "The Lich King is here? Then my destiny shall be fulfilled today!")
Sylvanas1:Emote(1, 0)
Sylvanas1:PlaySoundToSet(17053)
Sylvanas1:RegisterEvent(Uther_First_Scene_Talk3H, 6000, 1)
end

function Jaina1_First_Scene_Talk8(pUnit, event)
Jaina1:SendChatMessage(12, 0, "Arthas is here? Maybe I...")
Jaina1:Emote(6, 0)
Jaina1:PlaySoundToSet(16636)
Jaina1:RegisterEvent(Uther_First_Scene_Talk3A, 3000, 1)
end

function Uther_First_Scene_Talk3H(pUnit, event)
Uther:SendChatMessage(12, 0, "You cannot defeat the Lich King. Not here. You would be a fool to try. He will kill those who follow you and raise them as powerful servants of the Scourge. But for you, Sylvanas, his reward for you would be worse than the last.")
Uther:Emote(1, 0)
Uther:PlaySoundToSet(16661)
Uther:RegisterEvent(Sylvanas1_First_Scene_Talk8, 18400, 1)
end

function Uther_First_Scene_Talk3A(pUnit, event)
Uther:SendChatMessage(12, 0, "No, girl. Arthas is not here. Arthas is merely a presence within the Lich King's mind. A dwindling presence...")
Uther:Emote(1, 0)
Uther:PlaySoundToSet(16668)
Uther:RegisterEvent(Jaina1_First_Scene_Talk9, 10000, 1)
end

function Sylvanas1_First_Scene_Talk8(pUnit, event)
Sylvanas1:SendChatMessage(12, 0, "There must be a way...")
Sylvanas1:Emote(1, 0)
Sylvanas1:PlaySoundToSet(17054)
Sylvanas1:RegisterEvent(Uther_First_Scene_Talk4H, 3300, 1)
end

function Jaina1_First_Scene_Talk9(pUnit, event)
Jaina1:SendChatMessage(12, 0, "But Uther, if there's any hope of reaching Arthas. I... I must try.")
Jaina1:Emote(1, 0)
Jaina1:PlaySoundToSet(16637)
Jaina1:RegisterEvent(Uther_First_Scene_Talk4A, 7000, 1)
end

function Uther_First_Scene_Talk4H(pUnit, event)
Uther:SendChatMessage(12, 0, "Perhaps, but know this: there must always be a Lich King. Even if you were to strike down Arthas, another would have to take his place, for without the control of the Lich King, the Scourge would wash over this world like locusts, destroying all that they touched.")
Uther:Emote(1, 0)
Uther:PlaySoundToSet(16662)
Uther:RegisterEvent(Sylvanas1_First_Scene_Talk9, 21000, 1)
end

function Uther_First_Scene_Talk4A(pUnit, event)
Uther:SendChatMessage(12, 0, "Jaina, listen to me. You must destroy the Lich King. You cannot reason with him. He will kill you and your allies and raise you all as powerful soldiers of the Scourge.")
Uther:Emote(1, 0)
Uther:PlaySoundToSet(16669)
Uther:RegisterEvent(Jaina1_First_Scene_Talk10, 13000, 1)
end

function Sylvanas1_First_Scene_Talk9(pUnit, event)
Sylvanas1:SendChatMessage(12, 0, "Who could bear such a burden?")
Sylvanas1:Emote(6, 0)
Sylvanas1:PlaySoundToSet(17055)
Sylvanas1:RegisterEvent(Uther_First_Scene_Talk5H, 4000, 1)
end

function Jaina1_First_Scene_Talk10(pUnit, event)
Jaina1:SendChatMessage(12, 0, "Tell me how, Uther? How do I destroy my prince? My...")
Jaina1:Emote(6, 0)
Jaina1:PlaySoundToSet(16638)
Jaina1:RegisterEvent(Uther_First_Scene_Talk5A, 5000, 1)
end

function Uther_First_Scene_Talk5H(pUnit, event)
Uther:SendChatMessage(16, 0, "Uther shakes his head")
Uther:RegisterEvent(Uther_First_Scene_Talk6H, 1800, 1)
end

function Uther_First_Scene_Talk5A(pUnit, event)
Uther:SendChatMessage(12, 0, "Snap out of it, girl. You must destroy the Lich King at the place where he merged with Ner'zhul - atop the spire, at the Frozen Throne. It is the only way.")
Uther:Emote(5, 0)
Uther:PlaySoundToSet(16670)
Uther:RegisterEvent(Jaina1_First_Scene_Talk11, 13500, 1)
end

function Uther_First_Scene_Talk6H(pUnit, event)
Uther:SendChatMessage(12, 0, "I do not know, Banshee Queen. I suspect that the piece of Arthas that might be left inside the Lich King is all that holds the Scourge from annihilating Azeroth.")
Uther:Emote(1, 0)
Uther:PlaySoundToSet(16663)
Uther:RegisterEvent(Uther_First_Scene_Talk7H, 12000, 1)
end

function Jaina1_First_Scene_Talk11(pUnit, event)
Jaina1:SendChatMessage(12, 0, "You're right, Uther. Forgive me. I... I don't know what got a hold of me. We will deliver this information to the King and the knights that battle the Scourge within Icecrown Citadel.")
Jaina1:Emote(1, 0)
Jaina1:PlaySoundToSet(16639)
Jaina1:RegisterEvent(Uther_First_Scene_Talk6A, 11600, 1)
end

function Uther_First_Scene_Talk7H(pUnit, event)
Uther:SendChatMessage(12, 0, "Alas, the only way to defeat the Lich King is to destroy him at the place he was created.")
Uther:Emote(1, 0)
Uther:PlaySoundToSet(16664)
Uther:RegisterEvent(Sylvanas1_Pre_Last_Text, 9000, 1)
end

function Uther_First_Scene_Talk6A(pUnit, event)
Uther:SendChatMessage(12, 0, "There is... something else that you should know about the Lich King. Control over the Scourge must never be lost. Even if you were to strike down the Lich King, another would have to take his place. For without the control of its master, the Scourge would run rampant across the world - destroying all living things.")
Uther:Emote(1, 0)
Uther:PlaySoundToSet(16671)
Uther:RegisterEvent(Uther_Pre_Last_TextA, 26000, 1)
end

function Sylvanas1_Pre_Last_Text(pUnit, event)
Sylvanas1:SpawnCreature(36954, 5361.049805, 2060.909912, 707.695007, 3.957870, 14, 0)
Sylvanas1:SendChatMessage(12, 0, "The Frozen Throne...")
Sylvanas1:Emote(1, 0)
Sylvanas1:PlaySoundToSet(17056)
Sylvanas1:RegisterEvent(Uther_Pre_Last_TextH, 3000, 1)
end

function Uther_Pre_Last_TextA(pUnit, event)
Uther:SendChatMessage(12, 0, "A grand sacrifice by a noble soul...")
Uther:Emote(1, 0)
Uther:PlaySoundToSet(16672)
Uther:RegisterEvent(Jaina1_Pre_Last_Text, 4000, 1)
end

function Uther_Pre_Last_TextH(pUnit, event)
LichKing2:SetUInt32Value(59, 2)
Uther:SendChatMessage(12, 0, "Aye. ARRRRRRGHHHH... He... He is coming. You... You must...")
Uther:Emote(5, 0)
Uther:PlaySoundToSet(16665)
LichKing2:SetMovementFlags(0)
LichKing2:GetGameObjectNearestCoords(5358.983887, 2058.809570, 707.695068,197341):Activate()
LichKing2:MoveTo(5314.177734, 2011.578247, 709.341736, 3.955590)
Uther:RegisterEvent(Uther_Final_Emote_H, 2300, 1)
end

function Jaina1_Pre_Last_Text(pUnit, event)
Jaina1:SendChatMessage(12, 0, "Who could bear such a burden?")
Jaina1:Emote(6, 0)
Jaina1:PlaySoundToSet(16640)
Jaina1:RegisterEvent(Uther_Emote1A, 3000, 1)
end

function Uther_Final_Emote_H(pUnit, event)
Uther:SetFacing(0.891752)
Uther:Emote(431, 15000)
Uther:RegisterEvent(TheLichKing_Stop_H, 7500, 1)
end

function Uther_Emote1A(pUnit, event)
Uther:SendChatMessage(16, 0, "Uther shakes his head")
Uther:RegisterEvent(Uther_Pre_Last_Text_1A, 1500, 1)
end

function TheLichKing_Stop_H(pUnit, event)
LichKing2:Root()
LichKing2:Emote(5, 0)
LichKing2:SendChatMessage(14, 0, "SILENCE, PALADIN!")
LichKing2:PlaySoundToSet(17225)
Uther:CastSpell(70693)
LichKing2:SetFacing(3.955590)
LichKing2:GetGameObjectNearestCoords(5359.003418, 2058.747803, 707.695496,197341):Activate()
LichKing2:RegisterEvent(LichKing_Sylvanas1, 11000, 1)
LichKing2:RegisterEvent(MoveAgainH, 3000, 1)
end

function Uther_Pre_Last_Text_1A(pUnit, event)
Uther:SendChatMessage(12, 0, "I do not know, Jaina. I suspect that the piece of Arthas that might be left inside the Lich King is all that holds the Scourge from annihilating Azeroth.")
Uther:Emote(1, 0)
Uther:PlaySoundToSet(16673)
Uther:RegisterEvent(Jaina1_Pre_Last_Textz, 10000, 1)
end

function Jaina1_Pre_Last_Textz(pUnit, event)
Jaina1:SpawnCreature(37226, 5361.049805, 2060.909912, 707.695007, 3.957870, 14, 0)
Jaina1:SendChatMessage(12, 0, "Then maybe there is still hope...")
Jaina1:Emote(1, 0)
Jaina1:PlaySoundToSet(16641)
Jaina1:RegisterEvent(Uther_Last_Message_A, 2000, 1)
end

local LichKing1 = nil

function LichKing1_OnSpawn(pUnit, event)
LichKing1 = pUnit
end

RegisterUnitEvent(37226, 18, "LichKing1_OnSpawn")

function MoveAgainH(pUnit, event)
LichKing2:Unroot()
LichKing2:MoveTo(5314.177734, 2011.578247, 709.341736, 3.955590)
end

function Uther_Last_Message_A(pUnit, event)
LichKing1:SetUInt32Value(59, 2)
Uther:SendChatMessage(12, 0, "No, Jaina! Aargh! He... He is coming! You... You must...")
Uther:Emote(5, 0)
Uther:PlaySoundToSet(16674)
LichKing1:SetMovementFlags(0)
LichKing1:GetGameObjectNearestCoords(5358.983887, 2058.809570, 707.695068,197341):Activate()
LichKing1:MoveTo(5314.177734, 2011.578247, 709.341736, 3.955590)
Uther:RegisterEvent(Uther_Final_Emote_A, 2300, 1)
end

function LichKing_Sylvanas1(pUnit, event)
LichKing2:SendChatMessage(14, 0, "So you wish to commune with the dead? You shall have your wish.")
LichKing2:Emote(6, 0)
LichKing2:PlaySoundToSet(17226)
LichKing2:RegisterEvent(LichKing1_GetFrostmourne_Sylvanas, 10000, 1)
end

function Uther_Final_Emote_A(pUnit, event)
Uther:SetFacing(0.891752)
Uther:Emote(431, 15000)
Uther:RegisterEvent(TheLichKing_Stop_A, 7500, 1)
end

function LichKing1_GetFrostmourne_Sylvanas(pUnit, event)
LichKing2:Emote(434, 0)
LichKing2:RegisterEvent(VisualEffectOfEmoteH, 800, 1)
end

function TheLichKing_Stop_A(pUnit, event)
LichKing1:Root()
LichKing1:Emote(5, 0)
LichKing1:SendChatMessage(14, 0, "SILENCE, PALADIN!")
LichKing1:PlaySoundToSet(17225)
Uther:CastSpell(70693)
LichKing1:SetFacing(3.955590)
LichKing1:GetGameObjectNearestCoords(5358.983887, 2058.809570, 707.695068,197341):Activate() -- Close the door.
LichKing1:RegisterEvent(LichKing_Jaina1, 11000, 1)
LichKing1:RegisterEvent(MoveAgainA, 3000, 1)
end

function VisualEffectOfEmoteH(pUnit, event)
LichKing2:Emote(468, 1000)
LichKing2:RegisterEvent(VisualEffectOfFrostmourneH, 1000, 1)
end

function VisualEffectOfFrostmourneH(pUnit, event)
local Frostmourne = LichKing2:GetGameObjectNearestCoords(5309.51, 2006.64, 709.341,202302)
LichKing2:CastSpell(72729)
LichKing2:CastSpell(72726)
LichKing2:SetModel(25337)
Frostmourne:Despawn(1000, 0)
LichKing2:RegisterEvent(Falric_and_Marwyn_EmergeH, 4000, 1)
end

function MoveAgainA(pUnit, event)
LichKing1:Unroot()
LichKing1:MoveTo(5314.177734, 2011.578247, 709.341736, 3.955590)
end

function Falric_and_Marwyn_EmergeH(pUnit, event)
LichKing2:SendChatMessage(14, 0, "Falric. Marwyn. Bring their corpses to my chamber when you are through.")
LichKing2:Emote(1, 3000)
LichKing2:PlaySoundToSet(17227)
LichKing2:RegisterEvent(Falric_Marwyn_BeholdH, 3000, 1)
end

function LichKing_Jaina1(pUnit, event)
LichKing1:SendChatMessage(14, 0, "So you wish to commune with the dead? You shall have your wish.")
LichKing1:Emote(6, 0)
LichKing1:PlaySoundToSet(17226)
LichKing1:RegisterEvent(LichKing1_GetFrostmourne_Jaina, 10000, 1)
end

function Falric_Marwyn_BeholdH(pUnit, event)
LichKing2:GetGameObjectNearestCoords(5358.983887, 2058.809570, 707.695068,197341):Activate()
LichKing2:MoveTo(5404.604980, 2106.833984, 707.695007, 0.806143)
LichKing2:RegisterEvent(Falric_Marwyn_Real_EmergeH, 3000, 1)
end

function LichKing1_GetFrostmourne_Jaina(pUnit, event)
LichKing1:Emote(434, 810)
LichKing1:RegisterEvent(VisualEffectOfEmoteA, 800, 1)
end

function VisualEffectOfEmoteA(pUnit, event)
LichKing1:Emote(468, 1000)
LichKing1:RegisterEvent(VisualEffectOfFrostmourneA, 1000, 1)
end

function Falric_Marwyn_Real_EmergeH(pUnit, event)
LichKing2:SpawnCreature(38112, 5269.856445, 2043.941284, 709.319397, 5.536890, 14, 0)
LichKing2:SpawnCreature(38113, 5348.776367, 1969.089111, 709.319458, 2.384009, 14, 0)
LichKing2:RegisterEvent(Falric_Marwyn_YellMsgH, 5000, 1)
end

function VisualEffectOfFrostmourneA(pUnit, event)
local Frostmourne = LichKing1:GetGameObjectNearestCoords(5309.51, 2006.64, 709.341,202302)
LichKing1:CastSpell(72729)
LichKing1:CastSpell(72726)
LichKing1:SetModel(25337)
Frostmourne:Despawn(1000, 0)
LichKing1:RegisterEvent(Falric_and_Marwyn_EmergeA, 4000, 1)
end

function Falric_Marwyn_YellMsgH(pUnit, event)
Falric:SendChatMessage(14, 0, "As you wish, my lord.")
Marwyn:SendChatMessage(14, 0, "As you wish, my lord.")
Marwyn:PlaySoundToSet(16741)
LichKing2:RegisterEvent(Soldiers_of_LordaeronH, 4000, 1)
end

function Falric_and_Marwyn_EmergeA(pUnit, event)
LichKing1:SendChatMessage(14, 0, "Falric. Marwyn. Bring their corpses to my chamber, when you are through.")
LichKing1:Emote(1, 3000)
LichKing1:PlaySoundToSet(17227)
LichKing1:RegisterEvent(Falric_Marwyn_BeholdA, 3000, 1)
end

function Soldiers_of_LordaeronH(pUnit, event)
Falric:SendChatMessage(14, 0, "Soldiers of Lordaeron, rise to meet your master's call!")
Falric:Emote(45, 9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999)
Marwyn:Emote(45, 9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999)
Falric:PlaySoundToSet(16714)
Sylvanas1:RegisterEvent(LastMessageOfSylvanas1, 8000, 1)
end

function Falric_Marwyn_BeholdA(pUnit, event)
LichKing1:GetGameObjectNearestCoords(5358.983887, 2058.809570, 707.695068,197341):Activate()
LichKing1:MoveTo(5404.604980, 2106.833984, 707.695007, 0.806143)
LichKing1:RegisterEvent(Falric_Marwyn_Real_EmergeA, 3000, 1)
end

function LastMessageOfSylvanas1(pUnit, event)
Sylvanas1:SendChatMessage(14, 0, "You will not escape me that easily, Arthas! I will have my vengeance!")
Sylvanas1:MoveTo(5404.604980, 2106.833984, 707.695007, 0.806143)
Sylvanas1:PlaySoundToSet(17057)
Sylvanas1:RegisterEvent(BothDisappear_Second_Stage_ApproachesH, 10000, 1)
end

function Falric_Marwyn_Real_EmergeA(pUnit, event)
LichKing1:SpawnCreature(38112, 5269.856445, 2043.941284, 709.319397, 5.536890, 14, 0)
LichKing1:SpawnCreature(38113, 5348.776367, 1969.089111, 709.319458, 2.384009, 14, 0)
LichKing1:RegisterEvent(Falric_Marwyn_YellMsgA, 5000, 1)
end

function BothDisappear_Second_Stage_ApproachesH(pUnit, event)
LichKing2:Despawn(1000, 0)
Sylvanas1:Despawn(1000, 0)
Sylvanas1:GetGameObjectNearestCoords(5359.003418, 2058.747803, 707.695496,197341):Activate()
Falric:RegisterEvent(WavesSpawn_1_H, 5000, 1)
end

function Falric_Marwyn_YellMsgA(pUnit, event)
Falric:SendChatMessage(14, 0, "As you wish, my lord.")
Marwyn:SendChatMessage(14, 0, "As you wish, my lord.")
Marwyn:PlaySoundToSet(16741)
LichKing1:RegisterEvent(Soldiers_of_LordaeronA, 4000, 1)
end

function Soldiers_of_LordaeronA(pUnit, event)
Falric:SendChatMessage(14, 0, "Soldiers of Lordaeron, rise to meet your master's call!")
Falric:Emote(45, 9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999)
Marwyn:Emote(45, 9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999)
Falric:PlaySoundToSet(16714)
Jaina1:RegisterEvent(LastMessageOfJaina1, 8000, 1)
end

function LastMessageOfJaina1(pUnit, event)
Jaina1:SendChatMessage(14, 0, "You won't deny me this Arthas! I must know! I must find out!")
Jaina1:MoveTo(5404.604980, 2106.833984, 707.695007, 0.806143)
Jaina1:PlaySoundToSet(16642)
Jaina1:RegisterEvent(BothDisappear_Second_Stage_ApproachesA, 10000, 1)
end

function BothDisappear_Second_Stage_ApproachesA(pUnit, event)
LichKing1:Despawn(1000, 0)
Jaina1:Despawn(1000, 0)
Jaina1:GetGameObjectNearestCoords(5358.983887, 2058.809570, 707.695068,197341):Activate()
Falric:RegisterEvent(WavesSpawn_1_A, 5000, 1)
end

function WavesSpawn_1_H(pUnit, event)
Falric:SendChatMessage(42, 0, "Spirit Wave 1/10")
Falric:SpawnCreature(38175, 5300.892578, 1976.148193, 707.6954351, 1.37, 14, 0, 2176, 0, 0, 1, 0)
Falric:SpawnCreature(38172, 5307.122070, 1974.395142, 707.695435, 1.37, 14, 0, 0, 0, 0, 1, 0)
Falric:SpawnCreature(38173, 5312.831543, 1974.951660, 707.695435, 1.90, 14, 0, 1899, 1984, 0, 1, 0)
Falric:SpawnCreature(38176, 5321.734863, 1978.476929, 707.695435, 1.90, 14, 0, 1905, 0, 50817, 1, 0)
Falric:SpawnCreature(38177, 5309.553711, 1973.716797, 707.695435, 1.639917, 14, 0, 5281, 5281, 0, 1, 0)
Falric:RegisterEvent(Waves_Spawn_2_H, 1, 0)
end

function WavesSpawn_1_A(pUnit, event)
Falric:SendChatMessage(42, 0, "Spirit Wave 1/10")
Falric:SpawnCreature(38175, 5300.892578, 1976.148193, 707.6954351, 1.37, 14, 0, 2176, 0, 0, 1, 0)
Falric:SpawnCreature(38172, 5307.122070, 1974.395142, 707.695435, 1.37, 14, 0, 0, 0, 0, 1, 0)
Falric:SpawnCreature(38173, 5312.831543, 1974.951660, 707.695435, 1.90, 14, 0, 1899, 1984, 0, 1, 0)
Falric:SpawnCreature(38176, 5321.734863, 1978.476929, 707.695435, 1.90, 14, 0, 1905, 0, 50817, 1, 0)
Falric:SpawnCreature(38177, 5309.553711, 1973.716797, 707.695435, 1.639917, 14, 0, 5281, 5281, 0, 1, 0)
Falric:RegisterEvent(WavesSpawn_2_A, 1, 0)
end

function Waves_Spawn_2_H(pUnit, event)
if (Gpriest:IsDead() == true) then
if (Smerc:IsDead() == true) then
if (Trifle:IsDead() == true) then
if (Footman:IsDead() == true) then
if (Pmage:IsDead() == true) then
Falric:RemoveEvents()
Falric:SendChatMessage(42, 0, "Spirit Wave 2/10")
Falric:SpawnCreature(38175, 5279.273926, 1995.820923, 707.695129, 0.312833, 14, 0, 2176, 0, 0, 1, 0)
Falric:SpawnCreature(38172, 5277.530273, 2002.393433, 707.695129, 0.312833, 14, 0, 0, 0, 0, 1, 0)
Falric:SpawnCreature(38173, 5276.628906, 2005.179810, 707.695129, 0, 14, 0, 1899, 1984, 0, 1, 0)
Falric:SpawnCreature(38176, 5277.718262, 2008.952515, 707.695129, 6.010117, 14, 0, 1905, 0, 50817, 1, 0)
Falric:SpawnCreature(38177, 5280.312500, 2017.822266, 707.695435, 6.010117, 14, 0, 5281, 5281, 0, 1, 0)
Falric:RegisterEvent(WavesSpawn_3_H, 1, 0)
end
end
end
end
end
end

function WavesSpawn_2_A(pUnit, event)
if (Gpriest:IsDead() == true) then
if (Smerc:IsDead() == true) then
if (Trifle:IsDead() == true) then
if (Footman:IsDead() == true) then
if (Pmage:IsDead() == true) then
Falric:RemoveEvents()
Falric:SendChatMessage(42, 0, "Spirit Wave 2/10")
Falric:SpawnCreature(38175, 5279.273926, 1995.820923, 707.695129, 0.312833, 14, 0, 2176, 0, 0, 1, 0)
Falric:SpawnCreature(38172, 5277.530273, 2002.393433, 707.695129, 0.312833, 14, 0, 0, 0, 0, 1, 0)
Falric:SpawnCreature(38173, 5276.628906, 2005.179810, 707.695129, 0, 14, 0, 1899, 1984, 0, 1, 0)
Falric:SpawnCreature(38176, 5277.718262, 2008.952515, 707.695129, 6.010117, 14, 0, 1905, 0, 50817, 1, 0)
Falric:SpawnCreature(38177, 5280.312500, 2017.822266, 707.695435, 6.010117, 14, 0, 5281, 5281, 0, 1, 0)
Falric:RegisterEvent(WavesSpawn_3_A, 1, 0)
end
end
end
end
end
end

function WavesSpawn_3_H(pUnit, event)
if (Gpriest:IsDead() == true) then
if (Smerc:IsDead() == true) then
if (Trifle:IsDead() == true) then
if (Footman:IsDead() == true) then
if (Pmage:IsDead() == true) then
Falric:RemoveEvents()
Falric:SendChatMessage(42, 0, "Spirit Wave 3/10")
Falric:SpawnCreature(38175, 5296.054199, 2034.648560, 707.694885, 5.151677, 14, 0, 2176, 0, 0, 1, 0)
Falric:SpawnCreature(38172, 5304.883789, 2037.835815, 707.694885, 5.088846, 14, 0, 0, 0, 0, 1, 0)
Falric:SpawnCreature(38173, 5309.149902, 2039.237183, 707.694885, 4.819455, 14, 0, 1899, 1984, 0, 1, 0)
Falric:SpawnCreature(38176, 5312.134766, 2038.607300, 707.694885, 4.540641, 14, 0, 1905, 0, 50817, 1, 0)
Falric:SpawnCreature(38177, 5318.879395, 2037.070801, 707.694885, 4.540641, 14, 0, 5281, 5281, 0, 1, 0)
Falric:RegisterEvent(WavesSpawn_4_H, 1, 0)
end
end
end
end
end
end

function WavesSpawn_3_A(pUnit, event)
if (Gpriest:IsDead() == true) then
if (Smerc:IsDead() == true) then
if (Trifle:IsDead() == true) then
if (Footman:IsDead() == true) then
if (Pmage:IsDead() == true) then
Falric:RemoveEvents()
Falric:SendChatMessage(42, 0, "Spirit Wave 3/10")
Falric:SpawnCreature(38175, 5296.054199, 2034.648560, 707.694885, 5.151677, 14, 0, 2176, 0, 0, 1, 0)
Falric:SpawnCreature(38172, 5304.883789, 2037.835815, 707.694885, 5.088846, 14, 0, 0, 0, 0, 1, 0)
Falric:SpawnCreature(38173, 5309.149902, 2039.237183, 707.694885, 4.819455, 14, 0, 1899, 1984, 0, 1, 0)
Falric:SpawnCreature(38176, 5312.134766, 2038.607300, 707.694885, 4.540641, 14, 0, 1905, 0, 50817, 1, 0)
Falric:SpawnCreature(38177, 5318.879395, 2037.070801, 707.694885, 4.540641, 14, 0, 5281, 5281, 0, 1, 0)
Falric:RegisterEvent(WavesSpawn_4_A, 1, 0)
end
end
end
end
end
end

function WavesSpawn_4_H(pUnit, event)
if (Gpriest:IsDead() == true) then
if (Smerc:IsDead() == true) then
if (Trifle:IsDead() == true) then
if (Footman:IsDead() == true) then
if (Pmage:IsDead() == true) then
Falric:RemoveEvents()
Falric:SendChatMessage(42, 0, "Spirit Wave 4/10")
Falric:SpawnCreature(38175, 5339.204102, 2018.414551, 707.694885, 3.428519, 14, 0, 2176, 0, 0, 1, 0)
Falric:SpawnCreature(38172, 5341.078125, 2011.415303, 707.694885, 3.428519, 14, 0, 0, 0, 0, 1, 0)
Falric:SpawnCreature(38173, 5342.035156, 2007.780273, 707.694885, 3.256569, 14, 0, 1899, 1984, 0, 1, 0)
Falric:SpawnCreature(38176, 5341.078125, 2004.609009, 707.694885, 2.929058, 14, 0, 1905, 0, 50817, 1, 0)
Falric:SpawnCreature(38177, 5338.473145, 1995.422119, 707.694885, 2.795540, 14, 0, 5281, 5281, 0, 1, 0)
Falric:RegisterEvent(WavesSpawn_5_H, 1, 0)
end
end
end
end
end
end

function WavesSpawn_4_A(pUnit, event)
if (Gpriest:IsDead() == true) then
if (Smerc:IsDead() == true) then
if (Trifle:IsDead() == true) then
if (Footman:IsDead() == true) then
if (Pmage:IsDead() == true) then
Falric:RemoveEvents()
Falric:SendChatMessage(42, 0, "Spirit Wave 4/10")
Falric:SpawnCreature(38175, 5339.204102, 2018.414551, 707.694885, 3.428519, 14, 0, 2176, 0, 0, 1, 0)
Falric:SpawnCreature(38172, 5341.078125, 2011.415303, 707.694885, 3.428519, 14, 0, 0, 0, 0, 1, 0)
Falric:SpawnCreature(38173, 5342.035156, 2007.780273, 707.694885, 3.256569, 14, 0, 1899, 1984, 0, 1, 0)
Falric:SpawnCreature(38176, 5341.078125, 2004.609009, 707.694885, 2.929058, 14, 0, 1905, 0, 50817, 1, 0)
Falric:SpawnCreature(38177, 5338.473145, 1995.422119, 707.694885, 2.795540, 14, 0, 5281, 5281, 0, 1, 0)
Falric:RegisterEvent(WavesSpawn_5_A, 1, 0)
end
end
end
end
end
end

function WavesSpawn_5_H(pUnit, event)
if (Gpriest:IsDead() == true) then
if (Smerc:IsDead() == true) then
if (Trifle:IsDead() == true) then
if (Footman:IsDead() == true) then
if (Pmage:IsDead() == true) then
Falric:RemoveEvents()
Falric:Emote(25, 0)
Falric:SetUInt32Value(59, 1)
end
end
end
end
end
end

function WavesSpawn_5_A(pUnit, event)
if (Gpriest:IsDead() == true) then
if (Smerc:IsDead() == true) then
if (Trifle:IsDead() == true) then
if (Footman:IsDead() == true) then
if (Pmage:IsDead() == true) then
Falric:RemoveEvents()
Falric:Emote(25, 0)
Falric:SetUInt32Value(59, 1)
end
end
end
end
end
end

function WavesSpawn_6(pUnit, event)
Marwyn:SendChatMessage(42, 0, "Spirit rise once again!")
Marwyn:SpawnCreature(38175, 5300.892578, 1976.148193, 707.6954351, 1.37, 14, 0, 2176, 0, 0, 1, 0)
Marwyn:SpawnCreature(38172, 5307.122070, 1974.395142, 707.695435, 1.37, 14, 0, 0, 0, 0, 1, 0)
Marwyn:SpawnCreature(38173, 5312.831543, 1974.951660, 707.695435, 1.90, 14, 0, 1899, 1984, 0, 1, 0)
Marwyn:SpawnCreature(38176, 5321.734863, 1978.476929, 707.695435, 1.90, 14, 0, 1905, 0, 50817, 1, 0)
Marwyn:SpawnCreature(38177, 5309.553711, 1973.716797, 707.695435, 1.639917, 14, 0, 5281, 5281, 0, 1, 0)
Marwyn:RegisterEvent(WavesSpawn_7, 1, 0)
end

function WavesSpawn_7(pUnit, event)
if (Gpriest:IsDead() == true) then
if (Smerc:IsDead() == true) then
if (Trifle:IsDead() == true) then
if (Footman:IsDead() == true) then
if (Pmage:IsDead() == true) then
Marwyn:RemoveEvents()
Marwyn:SendChatMessage(42, 0, "Spirit Wave 7/10")
Marwyn:SpawnCreature(38175, 5279.273926, 1995.820923, 707.695129, 0.312833, 14, 0, 2176, 0, 0, 1, 0)
Marwyn:SpawnCreature(38172, 5277.530273, 2002.393433, 707.695129, 0.312833, 14, 0, 0, 0, 0, 1, 0)
Marwyn:SpawnCreature(38173, 5276.628906, 2005.179810, 707.695129, 0, 14, 0, 1899, 1984, 0, 1, 0)
Marwyn:SpawnCreature(38176, 5277.718262, 2008.952515, 707.695129, 6.010117, 14, 0, 1905, 0, 50817, 1, 0)
Marwyn:SpawnCreature(38177, 5280.312500, 2017.822266, 707.695435, 6.010117, 14, 0, 5281, 5281, 0, 1, 0)
Marwyn:RegisterEvent(WavesSpawn_8, 1, 0)
end
end
end
end
end
end

function WavesSpawn_8(pUnit, event)
if (Gpriest:IsDead() == true) then
if (Smerc:IsDead() == true) then
if (Trifle:IsDead() == true) then
if (Footman:IsDead() == true) then
if (Pmage:IsDead() == true) then
Marwyn:RemoveEvents()
Marwyn:SendChatMessage(42, 0, "Spirit Wave 8/10")
Marwyn:SpawnCreature(38175, 5296.054199, 2034.648560, 707.694885, 5.151677, 14, 0, 2176, 0, 0, 1, 0)
Marwyn:SpawnCreature(38172, 5304.883789, 2037.835815, 707.694885, 5.088846, 14, 0, 0, 0, 0, 1, 0)
Marwyn:SpawnCreature(38173, 5309.149902, 2039.237183, 707.694885, 4.819455, 14, 0, 1899, 1984, 0, 1, 0)
Marwyn:SpawnCreature(38176, 5312.134766, 2038.607300, 707.694885, 4.540641, 14, 0, 1905, 0, 50817, 1, 0)
Marwyn:SpawnCreature(38177, 5318.879395, 2037.070801, 707.694885, 4.540641, 14, 0, 5281, 5281, 0, 1, 0)
Marwyn:RegisterEvent(WavesSpawn_9, 1, 0)
end
end
end
end
end
end

function WavesSpawn_9(pUnit, event)
if (Gpriest:IsDead() == true) then
if (Smerc:IsDead() == true) then
if (Trifle:IsDead() == true) then
if (Footman:IsDead() == true) then
if (Pmage:IsDead() == true) then
Marwyn:RemoveEvents()
Marwyn:SendChatMessage(42, 0, "Spirit Wave 9/10")
Marwyn:SpawnCreature(38175, 5339.204102, 2018.414551, 707.694885, 3.428519, 14, 0, 2176, 0, 0, 1, 0)
Marwyn:SpawnCreature(38172, 5341.078125, 2011.415303, 707.694885, 3.428519, 14, 0, 0, 0, 0, 1, 0)
Marwyn:SpawnCreature(38173, 5342.035156, 2007.780273, 707.694885, 3.256569, 14, 0, 1899, 1984, 0, 1, 0)
Marwyn:SpawnCreature(38176, 5341.078125, 2004.609009, 707.694885, 2.929058, 14, 0, 1905, 0, 50817, 1, 0)
Marwyn:SpawnCreature(38177, 5338.473145, 1995.422119, 707.694885, 2.795540, 14, 0, 5281, 5281, 0, 1, 0)
Marwyn:RegisterEvent(Marwyn_Goes_Active, 1, 0)
end
end
end
end
end
end

function Marwyn_Goes_Active(pUnit, event)
if (Gpriest:IsDead() == true) then
if (Smerc:IsDead() == true) then
if (Trifle:IsDead() == true) then
if (Footman:IsDead() == true) then
if (Pmage:IsDead() == true) then
Marwyn:RemoveEvents()
Marwyn:Emote(25, 0)
Marwyn:SetUInt32Value(59, 1)
Marwyn:RegisterEvent(If_Marwyn_Is_Dead_Quest_Appears, 1, 0)
end
end
end
end
end
end

function If_Marwyn_Is_Dead_Quest_Appears(pUnit, event)
if (Marwyn:IsDead() == true) then
Marwyn:RemoveEvents()
Marwyn:SendChatMessage(14, 0, "Yes... Run... Run to meet your destiny... Its bitter, cold embrace, awaits you.")
Marwyn:PlaySoundToSet(16737)
Marwyn:SpawnCreature(3722226, 5551.226074, 2261.002441, 733.011230, 3.950000, 168, 0, 33475, 0, 0, 1, 0)
Marwyn:GetGameObjectNearestCoords(5358.983887, 2058.809570, 707.695068,197341):Activate()
local PlayersAllAround = Marwyn:GetInRangePlayers()
for k, players in pairs (PlayersAllAround) do
if (players:GetTeam() == 0) then
Marwyn:SpawnCreature(36955, 5548.177246, 2257.809570, 733.011230, 0.808419, 1, 0, 2177, 12869, 0, 1, 0)
players:StartQuest(24500)
end
if (players:GetTeam() == 1) then
Marwyn:SpawnCreature(37554, 5548.177246, 2257.809570, 733.011230, 0.808419, 2, 0, 49814, 49814, 42775, 1, 0)
players:StartQuest(24802)
end
end
end
end