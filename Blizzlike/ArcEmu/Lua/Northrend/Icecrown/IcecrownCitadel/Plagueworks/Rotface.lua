--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Holystone Productions; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local rotface = 36627
local SmallOoze = 43301
local BigOoze = 36899
local OozeFlood = 37006

function rotface_OnCombat(pUnit, Event)
local rotface = pUnit
	rotface:SendChatMessage(14, 0, "WEEEEEEE!")
    rotface:RegisterEvent("rotface_OozeFlood", 20000, 1)
	rotface:RegisterEvent("rotface_OozeFlood_InPairs", 22000, 1)
	rotface:RegisterEvent("rotface_SlimeSpray", 11000, 0)
	rotface:RegisterEvent("rotface_MutatedInfection", 35000, 0) 
end

function rotface_OozeFlood(pUnit, Event)
	rotface:SpawnCreature(37006, 4427.700689, 3174.871826, 360.385315, 0, 14, 25000)
	rotface:RegisterEvent("rotface_OozeFlood_Two", 20000, 1)
end

function rotface_OozeFlood_InPairs(pUnit, Event)
	rotface:SpawnCreature(37006, 4409.125000, 3155.542725, 360.385315, 0, 14, 25000)
	rotface:RegisterEvent("rotface_OozeFlood_InPairs_Two", 22000, 1)
end

function rotface_OozeFlood_Two(pUnit, Event)
	rotface:SpawnCreature(37006, 4406.874512, 3118.262207, 360.385742, 0, 14, 25000)
	rotface:RegisterEvent("rotface_OozeFlood_Tree", 20000, 1)
end

function rotface_OozeFlood_InPairs_Two(pUnit, Event)
	rotface:SpawnCreature(37006, 4428.574707, 3101.385742, 360.385742, 0, 14, 25000)
	rotface:RegisterEvent("rotface_OozeFlood_InPairs_Tree", 22000, 1)
end

function rotface_OozeFlood_Tree(pUnit, Event)
	rotface:SpawnCreature(37006, 4461.988770, 3101.588867, 360.385590, 0, 14, 25000)
	rotface:RegisterEvent("rotface_OozeFlood_For", 20000, 1)
end

function rotface_OozeFlood_InPairs_Tree(pUnit, Event)
	rotface:SpawnCreature(37006, 4481.371094, 3119.097412, 360.385590, 0, 14, 25000)
	rotface:RegisterEvent("rotface_OozeFlood_InPairs_For", 22000, 1)
end

function rotface_OozeFlood_For(pUnit, Event)
	rotface:SpawnCreature(37006, 4482.102051, 3153.623779, 360.385590, 0, 14, 25000)
	rotface:RegisterEvent("rotface_OozeFlood", 20000, 1)
end

function rotface_OozeFlood_InPairs_For(pUnit, Event)
	rotface:SpawnCreature(37006, 4463.563965, 3173.374268, 360.385590, 0, 14, 25000)
	rotface:RegisterEvent("rotface_OozeFlood_InPairs", 22000, 1)
end

function rotface_SlimeSpray(pUnit, Event)
	rotface:SendChatMessage(14, 0, "Icky sticky.")
	rotface:FullCastSpell(69508)
	rotface:AddAura(69507, 1000)
end

function rotface_MutatedInfection(pUnit, Event)
	rotface:CastSpellOnTarget(69674, rotface:GetRandomPlayer(0))
    rotface:RegisterEvent("Small_Ooze_Spawn", 12000, 1)
end

function Small_Ooze_Spawn(pUnit, Event)
  rotface:SpawnCreature(SmallOoze, rotface:GetRandomPlayer(0):GetX(), rotface:GetRandomPlayer(0):GetY(), rotface:GetRandomPlayer(0):GetZ(), rotface:GetRandomPlayer(0):GetO(), 14, 360000)
end

function SmallOoze_OnCombat(pUnit, Event)
local smallooze = pUnit
    smallooze:Unroot()
    smallooze:CastSpell(69750)
	smallooze:AddAura(69751, 0)
    smallooze:RegisterEvent("smallooze_StickyOoze", 10000, 0)
	smallooze:RegisterEvent("smallooze_BigOoze_SpawnCheck", 1000, 0)
end

function smallooze_BigOoze_SpawnCheck(pUnit, Event)
    if(smallooze:GetDistanceYards(smallooze:GetClosestFriend()) < 10) then
		smallooze:SpawnCreature(36899, smallooze:GetX(), smallooze:GetY(), smallooze:GetZ(), smallooze:GetO(), 14, 360000)
	end
end

function smallooze_StickyOoze(pUnit, Event)
local player = smallooze:GetRandomPlayer(0)
	smallooze:CastSpellAoF(player:GetX(), player:GetY(), player:GetZ(), 69776)
    player:AddAura(69778, 1000)
end

function BigOoze_OnCombat(pUnit, Event)
local bigooze = pUnit
	bigooze:CastSpell(69760)
	bigooze:AddAura(69761, 0)
    bigooze:RegisterEvent("BigOoze_StickyOoze", 10000, 0)
	bigooze:RegisterEvent("BigOoze_Aura_Check", 1000, 0)
	bigooze:RegisterEvent("BigOoze_UnstableOozeExplosion", 1000, 0)
end

function BigOoze_StickyOoze(pUnit, Event)
local player = bigooze:GetRandomPlayer(0)
	bigooze:CastSpellAoF(player:GetX(), player:GetY(), player:GetZ(), 69776)
    player:AddAura(69778, 1000)
end

function BigOoze_Aura_Check(pUnit, Event)
    if(target:GetDistanceYards(bigooze:GetInRangeFriends()) < 10) then 
		bigooze:AddAura(69558, 0)
	end
end

function BigOoze_UnstableOozeExplosion(pUnit, Event)
	if(bigooze:HasAura(69558) == 5) then
        if(GetThreeRandomEnemies(pUnit)) then
			for k,v in ipairs(GetThreeRandomEnemies(pUnit)) do
				pUnit:CastSpellOnTarget(69839, v)
            end
        end
	end
end

function OozeFlood_OnSpawn(pUnit, Event)
local oozeflod = pUnit
    oozeflod:Root()
    oozeflod:SetModel(11686)
    oozeflod:SetScale(5)
    oozeflod:RegisterEvent("oozeflod_Cast", 1000, 1)
	oozeflod:RegisterEvent("oozeflod_Aura_Check", 500, 0)
end

function oozeflod_Cast(pUnit, Event)
	oozeflod:CastSpellAoF(oozeflod:GetX(), oozeflod:GetY(), oozeflod:GetZ(), 69776)
end

function oozeflod_Aura_Check(pUnit, Event)
	if(oozeflod:GetDistanceYards(target) < 20) then 
		oozeflod:CastSpellOnTarget(69789, oozeflod:GetClosestEnemy())
	end
end

function rotface_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function rotface_OnKillPlayer(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Daddy make toys out of you!")
end

function rotface_OnDead(pUnit, Event)
	pUnit:RemoveEvents()
end

function SmallOoze_OnDeath(pUnit, Event)
	pUnit:Despawn(1, 0)
end

RegisterUnitEvent(rotface, 1, "rotface_OnCombat")
RegisterUnitEvent(rotface, 2, "rotface_OnLeaveCombat")
RegisterUnitEvent(rotface, 3, "rotface_OnKillPlayer")
RegisterUnitEvent(rotface, 4, "rotface_OnDead")
RegisterUnitEvent(SmallOoze, 1, "SmallOoze_OnCombat")
RegisterUnitEvent(SmallOoze, 4, "SmallOoze_OnDeath")
RegisterUnitEvent(BigOoze, 1, "BigOoze_OnCombat")
RegisterUnitEvent(OozeFlood, 18, "OozeFlood_OnSpawn")