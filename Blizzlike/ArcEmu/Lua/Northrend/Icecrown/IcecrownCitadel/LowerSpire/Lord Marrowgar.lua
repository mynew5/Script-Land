--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: OnyxiaKing; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local MarrowgarID = 36612
local BonespikeID = 36619
local ColdflameID = 36672
local Marrowgar = Unit
local Bonespike = Unit
local Coldflame = Unit
local Boned = true

function Marrowgar_OnSpawn(Marrowgar, Event)
	Marrowgar:PlaySoundToSet(16950)
	Marrowgar:SendChatMessage(14, 0, "This is the beginning AND the end, mortals. None may enter the master's sanctum!")
	if(Marrowgar:GetDungeonDifficulty() == 0) then
		Marrowgar:SetMaxHealth(6972500)
		Marrowgar:SetHealth(6972500)
	elseif(Marrowgar:GetDungeonDifficulty() == 1) then
		Marrowgar:SetMaxHealth(23700000)
		Marrowgar:SetHealth(23700000)
	elseif(Marrowgar:GetDungeonDifficulty() == 2) then
		Marrowgar:SetMaxHealth(10500000)
		Marrowgar:SetHealth(10500000)
	elseif(Marrowgar:GetDungeonDifficulty() == 3) then
		Marrowgar:SetMaxHealth(31376000)
		Marrowgar:SetHealth(31376000)
	end
end

function Marrowgar_OnCombat(Marrowgar, Event)
	Marrowgar:RegisterEvent("Berserk", 600000, 1)
	Marrowgar:PlaySoundToSet(16941)
	Marrowgar:SendChatMessage(14, 0, "The Scourge will wash over this world as a swarm of death and destruction!")
	if(Marrowgar:GetDungeonDifficulty() == 0) then
		Marrowgar:RegisterEvent("TenMan", 500, 1)
	elseif(Marrowgar:GetDungeonDifficulty() == 1) then
		Marrowgar:RegisterEvent("TwentyFiveMan", 500, 1)
	elseif(Marrowgar:GetDungeonDifficulty() == 2) then
		Marrowgar:RegisterEvent("TenManHEROIC", 500, 1)
	elseif(Marrowgar:GetDungeonDifficulty() == 3) then
		Marrowgar:RegisterEvent("TwentyFiveManHEROIC", 500, 1)
	end
end

function TenMan(Marrowgar, Event)
	Marrowgar:RegisterEvent("BoneSlice10commence", 5000, 1)
	Marrowgar:RegisterEvent("BoneSpike10", 15000, 0)
	Marrowgar:RegisterEvent("BoneStorm10", 45000, 0)
end

function TwentyFiveMan(Marrowgar, Event)
	Marrowgar:RegisterEvent("BoneSlice25commence", 5000, 1)
	Marrowgar:RegisterEvent("BoneSpike25", 15000, 0)
	Marrowgar:RegisterEvent("BoneStorm25", 45000, 0)
end

function TenManHEROIC(Marrowgar, Event)
	Marrowgar:RegisterEvent("BoneSlice10commence", 5000, 1)
	Marrowgar:RegisterEvent("BoneSpike10HEROIC", 15000, 0)
	Marrowgar:RegisterEvent("BoneStorm10HEROIC", 45000, 0)
end

function TwentyFiveManHEROIC(Marrowgar, Event)
	Marrowgar:RegisterEvent("BoneSlice25commence", 5000, 1)
	Marrowgar:RegisterEvent("BoneSpike25HEROIC", 15000, 0)
	Marrowgar:RegisterEvent("BoneStorm25HEROIC", 45000, 0)
end

function Berserk(Marrowgar, Event)
	Marrowgar:CastSpell(26662)
	Marrowgar:PlaySoundToSet(16945)
	Marrowgar:SendChatMessage(14, 0, "THE MASTER'S RAGE COURSES THROUGH ME!")
end

function BoneSlice10commence(Marrowgar, Event)
	Marrowgar:RegisterEvent("BoneSlice10", 2000, 0)
end

function BoneSlice10(Marrowgar, Event)
	Marrowgar:FullCastSpellOnTarget(69055, Marrowgar:GetMainTank())
end

function BoneSlice25commence(Marrowgar, Event)
	Marrowgar:RegisterEvent("BoneSlice25", 2000, 0)
end

function BoneSlice25(Marrowgar, Event)
	Marrowgar:FullCastSpellOnTarget(70814, Marrowgar:GetMainTank())
end

function BoneSpike10(Marrowgar, Event)
	Marrowgar:FullCastSpell(69057)
	Marrowgar:RegisterEvent("SpawnBoneSpike10", 3000, 1)
end

function BoneSpike25(Marrowgar, Event)
	Marrowgar:FullCastSpell(70826)
	Marrowgar:RegisterEvent("SpawnBoneSpike25", 3000, 1)
end

function BoneSpike10HEROIC(Marrowgar, Event)
	Marrowgar:FullCastSpell(72088)
	Marrowgar:RegisterEvent("SpawnBoneSpike10HEROIC", 3000, 1)
end

function BoneSpike25HEROIC(Marrowgar, Event)
	Marrowgar:FullCastSpell(72089)
	Marrowgar:RegisterEvent("SpawnBoneSpike25HEROIC", 3000, 1)
end

function SpawnBoneSpike10(Marrowgar, Event)
local chatter1 = math.random(1,3)
	if(chatter1 == 1) then
		Marrowgar:PlaySoundToSet(16947)
		Marrowgar:SendChatMessage(14, 0, "Bound by bone!")
	elseif(chatter1 == 2) then
		Marrowgar:PlaySoundToSet(16948)
		Marrowgar:SendChatMessage(14, 0, "Stick Around!")
	elseif(chatter1 == 3) then
		Marrowgar:PlaySoundToSet(16949)
		Marrowgar:SendChatMessage(14,0, "The only escape is death!")
	end
	local randomplr1 = Marrowgar:GetRandomPlayer(7)
	if(randomplr1 ~= nil) then
		Marrowgar:SpawnCreature(36619, randomplr1:GetX(), randomplr1:GetY(), randomplr1:GetZ(), randomplr1:GetO(), 14, 0, 14, 0, 0)
	end
end

function SpawnBoneSpike25(Marrowgar, Event)
local chatter2 = math.random(1,3)
	if(chatter2 == 1) then
		Marrowgar:PlaySoundToSet(16947)
		Marrowgar:SendChatMessage(14, 0, "Bound by bone!")
	elseif(chatter2 == 2) then
		Marrowgar:PlaySoundToSet(16948)
		Marrowgar:SendChatMessage(14, 0, "Stick Around!")
	elseif(chatter2 == 3) then
		Marrowgar:PlaySoundToSet(16949)
		Marrowgar:SendChatMessage(14,0, "The only escape is death!")
	end
	local randomplr2 = Marrowgar:GetRandomPlayer(7)
	if(randomplr2 ~= nil) then
		Marrowgar:SpawnCreature(36619, randomplr2:GetX(), randomplr2:GetY(), randomplr2:GetZ(), randomplr2:GetO(), 14, 0, 14, 0, 0)
		Marrowgar:SpawnCreature(36619, randomplr2:GetX(), randomplr2:GetY(), randomplr2:GetZ(), randomplr2:GetO(), 14, 0, 14, 0, 0)
		Marrowgar:SpawnCreature(36619, randomplr2:GetX(), randomplr2:GetY(), randomplr2:GetZ(), randomplr2:GetO(), 14, 0, 14, 0, 0)
	end
end

function SpawnBoneSpike10HEROIC(Marrowgar, Event)
local chatter3 = math.random(1,3)
	if(chatter3 == 1) then
		Marrowgar:PlaySoundToSet(16947)
		Marrowgar:SendChatMessage(14, 0, "Bound by bone!")
	elseif(chatter3 == 2) then
		Marrowgar:PlaySoundToSet(16948)
		Marrowgar:SendChatMessage(14, 0, "Stick Around!")
	elseif(chatter3 == 3) then
		Marrowgar:PlaySoundToSet(16949)
		Marrowgar:SendChatMessage(14, 0, "The only escape is death!")
	end
	local randomplr3 = Marrowgar:GetRandomPlayer(7)
	if(randomplr3 ~= nil) then
		Marrowgar:SpawnCreature(36619, randomplr3:GetX(), randomplr3:GetY(), randomplr3:GetZ(), randomplr3:GetO(), 14, 0, 14, 0, 0)
	end
end

function SpawnBoneSpike25HEROIC(Marrowgar, Event)
local chatter4 = math.random(1,3)
	if(chatter4 == 1) then
		Marrowgar:PlaySoundToSet(16947)
		Marrowgar:SendChatMessage(14, 0, "Bound by bone!")
	elseif(chatter4 == 2) then
		Marrowgar:PlaySoundToSet(16948)
		Marrowgar:SendChatMessage(14, 0, "Stick Around!")
	elseif(chatter4 == 3) then
		Marrowgar:PlaySoundToSet(16949)
		Marrowgar:SendChatMessage(14,0, "The only escape is death!")
	end
	local randomplr4 = Marrowgar:GetRandomPlayer(7)
	if(randomplr4 ~= nil) then
		Marrowgar:SpawnCreature(36619, randomplr4:GetX(), randomplr4:GetY(), randomplr4:GetZ(), randomplr4:GetO(), 14, 0, 14, 0, 0)
		Marrowgar:SpawnCreature(36619, randomplr4:GetX(), randomplr4:GetY(), randomplr4:GetZ(), randomplr4:GetO(), 14, 0, 14, 0, 0)
		Marrowgar:SpawnCreature(36619, randomplr4:GetX(), randomplr4:GetY(), randomplr4:GetZ(), randomplr4:GetO(), 14, 0, 14, 0, 0)
	end
end

function BoneStorm10(Marrowgar, Event)
	Marrowgar:RemoveEvents()
	Marrowgar:SendChatMessage(14, 0, "BONE STORM!")
	Marrowgar:SetNextTarget(Unit)
	Marrowgar:SetCombatTargetingCapable(1)
	Marrowgar:PlaySoundToSet(16946)
	Marrowgar:FullCastSpell(69076)
	Marrowgar:RegisterEvent("RandomPlayer", 3500, 1)
end

function BoneStorm25(Marrowgar, Event)
	Marrowgar:RemoveEvents()
	Marrowgar:SendChatMessage(14, 0, "BONE STORM!")
	Marrowgar:SetNextTarget(Unit)
	Marrowgar:SetCombatTargetingCapable(1)
	Marrowgar:PlaySoundToSet(16946)
	Marrowgar:FullCastSpell(69076)
	Marrowgar:RegisterEvent("RandomPlayer", 3500, 1)
end

function BoneStorm10HEROIC(Marrowgar, Event)
	Marrowgar:SendChatMessage(14, 0, "BONE STORM!")
	Marrowgar:SetNextTarget(Unit)
	Marrowgar:SetCombatTargetingCapable(1)
	Marrowgar:PlaySoundToSet(16946)
	Marrowgar:FullCastSpell(69076)
	Marrowgar:RegisterEvent("RandomPlayer", 3500, 1)
end

function BoneStorm25HEROIC(Marrowgar, Event)
	Marrowgar:SendChatMessage(14, 0, "BONE STORM!")
	Marrowgar:SetNextTarget(Unit)
	Marrowgar:SetCombatTargetingCapable(1)
	Marrowgar:PlaySoundToSet(16946)
	Marrowgar:FullCastSpell(69076)
	Marrowgar:RegisterEvent("RandomPlayer", 3500, 1)
end

function RandomPlayer(Marrowgar, Event)
local player = Marrowgar:GetRandomPlayer(3)
	Marrowgar:CastSpellOnTarget(69075, Marrowgar:GetInRangePlayers())
    Marrowgar:ModifyRunSpeed(18)
    Marrowgar:MoveTo(player:GetX(), player:GetY(), player:GetZ())
	Marrowgar:RegisterEvent("BoneStrike", 2000, 0)
	Marrowgar:RegisterEvent("ColdflameSPAWN1", 4000, 1)
    Marrowgar:RegisterEvent("RandomPlayer2", 7000, 1)
end

function BoneStrike(Marrowgar, Event)
	local badplayers = Marrowgar:GetInRangePlayers()
	Marrowgar:CastSpellOnTarget(69075, badplayers)
end

function RandomPlayer2(Marrowgar, Event)
local player = Marrowgar:GetRandomPlayer(3)
    Marrowgar:ModifyRunSpeed(18)
    Marrowgar:MoveTo(player:GetX(), player:GetY(), player:GetZ())
	Marrowgar:RegisterEvent("ColdflameSPAWN1", 4000, 1)
    Marrowgar:RegisterEvent("RandomPlayer3", 7000, 1)
end

function RandomPlayer3(Marrowgar, Event)
local player = Marrowgar:GetRandomPlayer(3)
    Marrowgar:ModifyRunSpeed(18)
    Marrowgar:MoveTo(player:GetX(), player:GetY(), player:GetZ())
	Marrowgar:RegisterEvent("ColdflameSPAWN1", 4000, 1)
    Marrowgar:RegisterEvent("RandomPlayer4", 7000, 1)
end

function RandomPlayer4(Marrowgar, Event)
local player = Marrowgar:GetRandomPlayer(3)
    Marrowgar:ModifyRunSpeed(18)
    Marrowgar:MoveTo(player:GetX(), player:GetY(), player:GetZ())
	Marrowgar:RegisterEvent("ColdflameSPAWN1", 4000, 1)
    Marrowgar:RegisterEvent("AfterBonestormCheckDIFFICULTIE", 6500, 1)
end

function AfterBonestormCheckDIFFICULTIE(Marrowgar, Event)
	Marrowgar:CancelSpell()
	Marrowgar:ClearHateList()
	Dungdiff = Marrowgar:GetDungeonDifficulty()
	if(Marrowgar:GetDungeonDifficulty() == 0) then
		Marrowgar:RegisterEvent("TenMan", 0, 1)
	elseif(Marrowgar:GetDungeonDifficulty() == 1) then
		Marrowgar:RegisterEvent("TwentyFiveMan", 0, 1)
	elseif(Marrowgar:GetDungeonDifficulty() == 2) then
		Marrowgar:RegisterEvent("TenManHEROIC", 0, 1)
	elseif(Marrowgar:GetDungeonDifficulty() == 3) then
		Marrowgar:RegisterEvent("TwentyFiveManHEROIC", 0, 1)
	end
end

function ColdflameSPAWN1(Marrowgar, Event)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()+5, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()+5, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()-5, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()-5, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:RegisterEvent("ColdflameSPAWN2", 150, 1)
end

function ColdflameSPAWN2(Marrowgar, Event)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()+10, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()+10, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()-10, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()-10, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:RegisterEvent("ColdflameSPAWN3", 150, 1)
end

function ColdflameSPAWN3(Marrowgar, Event)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()+15, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()+15, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()-15, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()-15, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:RegisterEvent("ColdflameSPAWN4", 150, 1)
end

function ColdflameSPAWN4(Marrowgar, Event)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()+20, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()+20, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()-20, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()-20, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:RegisterEvent("ColdflameSPAWN5", 150, 1)
end

function ColdflameSPAWN5(Marrowgar, Event)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()+25, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()+25, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()-25, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()-25, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:RegisterEvent("ColdflameSPAWN6", 150, 1)
end

function ColdflameSPAWN6(Marrowgar, Event)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()+30, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()+30, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()-30, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()-30, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:RegisterEvent("ColdflameSPAWN7", 150, 1)
end

function ColdflameSPAWN7(Marrowgar, Event)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()+35, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()+35, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()-35, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()-35, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:RegisterEvent("ColdflameSPAWN8", 150, 1)
end

function ColdflameSPAWN8(Marrowgar, Event)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()+40, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()+40, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()-40, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()-40, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:RegisterEvent("ColdflameSPAWN9", 150, 1)
end

function ColdflameSPAWN9(Marrowgar, Event)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()+45, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()+45, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()-45, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()-45, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:RegisterEvent("ColdflameSPAWN10", 150, 1)
end

function ColdflameSPAWN10(Marrowgar, Event)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()+50, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()+50, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()-50, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()-50, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:RegisterEvent("ColdflameSPAWN11", 150, 1)
end

function ColdflameSPAWN11(Marrowgar, Event)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()+55, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()+55, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()-55, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()+55, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:RegisterEvent("ColdflameSPAWN12", 150, 1)
end

function ColdflameSPAWN12(Marrowgar, Event)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()+60, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()+60, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()-60, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()-60, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:RegisterEvent("ColdflameSPAWN13", 150, 1)
end

function ColdflameSPAWN13(Marrowgar, Event)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()+65, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()+65, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()-65, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()-65, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:RegisterEvent("ColdflameSPAWN14", 150, 1)
end

function ColdflameSPAWN14(Marrowgar, Event)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()+70, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()+70, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()-70, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()-70, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:RegisterEvent("ColdflameSPAWN15", 150, 1)
end

function ColdflameSPAWN15(Marrowgar, Event)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()+75, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()+75, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()-75, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()-75, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:RegisterEvent("ColdflameSPAWN16", 150, 1)
end

function ColdflameSPAWN16(Marrowgar, Event)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()+80, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()+80, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()-80, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()-80, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:RegisterEvent("ColdflameSPAWN17", 150, 1)
end

function ColdflameSPAWN17(Marrowgar, Event)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()+85, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()+85, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()-85, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()-85, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:RegisterEvent("ColdflameSPAWN18", 150, 1)
end

function ColdflameSPAWN18(Marrowgar, Event)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()+90, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()+90, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()-90, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()-90, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:RegisterEvent("ColdflameSPAWN19", 150, 1)
end

function ColdflameSPAWN19(Marrowgar, Event)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()+95, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()+95, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()-95, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()-95, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:RegisterEvent("ColdflameSPAWN20", 150, 1)
end

function ColdflameSPAWN20(Marrowgar, Event)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()+100, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()+100, Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX()-100, Marrowgar:GetY(), Marrowgar:GetZ(), 1, 14, 3)
	Marrowgar:SpawnCreature(36672, Marrowgar:GetX(), Marrowgar:GetY()-100, Marrowgar:GetZ(), 1, 14, 3)
end

function Marrowgar_OnLeaveCombat(Marrowgar, Event)
	Marrowgar:RemoveEvents()
	Bonespike:Despawn()
	Coldflame:Despawn()
end

function Marrowgar_OnKilledTarget(Marrowgar, Event)
local chatter5 = math.random(1,2)
	if(chatter5 == 1) then
		Marrowgar:PlaySoundToSet(16942)
		Marrowgar:SendChatMessage(14, 0, "More bones for the offering!")
	else
		Marrowgar:PlaySoundToSet(16943)
		Marrowgar:SendChatMessage(14, 0, "Languish in damnation!")
	end
end

function Marrowgar_OnDeath(Marrowgar, Event)
	Marrowgar:PlaySoundToSet(16944)
	Marrowgar:SendChatMessage(14, 0, "I see... only darkness...")
	Marrowgar:RegisterEvent("IceWall_Despawn", 1000, 1)
	if(Marrowgar:GetDungeonDifficulty() == 0) then
		if(Boned == true) then
			Marrowgar:GetInRangePlayers():AddAchievement(4534)
		end
	elseif(Marrowgar:GetDungeonDifficulty() == 1) then
		if(Boned == true) then
			Marrowgar:GetInRangePlayers():AddAchievement(4610)
		end
	elseif(Marrowgar:GetDungeonDifficulty() == 2) then
		if(Boned == true) then
			Marrowgar:GetInRangePlayers():AddAchievement(4534)
		end
	elseif(Marrowgar:GetDungeonDifficulty() == 3) then
		if(Boned == true) then
			Marrowgar:GetInRangePlayers():AddAchievement(4610)
		end
	end
	Marrowgar:RemoveEvents()
	Marrowgar:NoRespawn(1)
end

function IceWall_Despawn(Marrowgar, event)
end

function Bonespike_OnSpawn(Bonespike, Event)
	Bonespike:SetNextTarget(Bonespike:GetClosestPlayer())
	Bonespike:SetCombatCapable(1)
	Bonespike:SetCombatTargetingCapable()
	Bonespike:Root()
	Bonespike:CastSpellOnTarget(69065, Bonespike:GetClosestPlayer())
	Bonespike:GetClosestPlayer():SetFly()
	Bonespike:GetClosestPlayer():Teleport(631, Bonespike:GetX(), Bonespike:GetY(), Bonespike:GetZ()+5)
	Bonespike:RegisterEvent("NoBoned", 8000, 1)
end

function NoBoned(Bonespike, Event)
	local Boned = false
end

function Bonespike_OnDeath(Bonespike, Event)
		Bonespike:GetClosestPlayer():Land()
		Bonespike:NoRespawn(1)
	if(Bonespike:GetClosestPlayer():HasAura(69065)) then
		Bonespike:GetClosestPlayer():RemoveAura(69065)
		Bonespike:Despawn(100,0)
		else
	end
	Bonespike:RemoveEvents()
end

function Coldflame_OnSpawn(Coldflame, Event)
	Coldflame:SetUInt64Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE)
	Coldflame:SetUInt32Value(58, 2)
	Coldflame:SetCombatCapable(1)
	Coldflame:SetNextTarget(Unit)
	Coldflame:SetCombatTargetingCapable(1)
	Dungdiff = Coldflame:GetDungeonDifficulty()
	if(Coldflame:GetDungeonDifficulty() == 0) then
		Coldflame:Despawn(3000, 0)
		Coldflame:CastSpell(69146)
		Coldflame:RegisterEvent("BURNBABY10N", 2000, 0)
	elseif(Coldflame:GetDungeonDifficulty() == 1) then
		Coldflame:Despawn(3000, 0)
		Coldflame:CastSpell(70823)
		Coldflame:RegisterEvent("BURNBABY25N", 2000, 0)
	elseif(Coldflame:GetDungeonDifficulty() == 2) then
		Coldflame:Despawn(8000, 0)
		Coldflame:CastSpell(70824)
		Coldflame:RegisterEvent("BURNBABY10HC", 2000, 0)
	elseif(Coldflame:GetDungeonDifficulty() == 3) then
		Coldflame:Despawn(8000, 0)
		Coldflame:CastSpell(70825)
		Coldflame:RegisterEvent("BURNBABY25HC", 2000, 0)
	end
end

function BURNBABY10N(Coldflame, Event)
	Coldflame:CastSpell(69146)
end

function BURNBABY25N(Coldflame, Event)
	Coldflame:CastSpell(70823)
end

function BURNBABY10HC(Coldflame, Event)
	Coldflame:CastSpell(70824)
end

function BURNBABY25HC(Coldflame, Event)
	Coldflame:CastSpell(70825)
end

RegisterUnitEvent(MarrowgarID, 1, "Marrowgar_OnCombat")
RegisterUnitEvent(MarrowgarID, 2, "Marrowgar_OnLeaveCombat")
RegisterUnitEvent(MarrowgarID, 3, "Marrowgar_OnKilledTarget")
RegisterUnitEvent(MarrowgarID, 4, "Marrowgar_OnDeath")
RegisterUnitEvent(MarrowgarID, 18, "Marrowgar_OnSpawn")
RegisterUnitEvent(BonespikeID, 18, "Bonespike_OnSpawn")
RegisterUnitEvent(BonespikeID, 4, "Bonespike_OnDeath")
RegisterUnitEvent(ColdflameID, 18, "Coldflame_OnSpawn")