--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--Blackfathom Tide Priestess
function BlackfathomTidePriestess_OnCombat(Unit, Event)
	Unit:RegisterEvent("BlackfathomTidePriestess_Frostbolt", 8000, 0)
	Unit:RegisterEvent("BlackfathomTidePriestess_Heal", 13000, 0)
end

function BlackfathomTidePriestess_Frostbolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9672, pUnit:GetMainTank()) 
end

function BlackfathomTidePriestess_Heal(pUnit, Event) 
	pUnit:CastSpell(11642) 
end

function BlackfathomTidePriestess_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BlackfathomTidePriestess_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4802, 1, "BlackfathomTidePriestess_OnCombat")
RegisterUnitEvent(4802, 2, "BlackfathomTidePriestess_OnLeaveCombat")
RegisterUnitEvent(4802, 4, "BlackfathomTidePriestess_OnDied")

--Blackwood Pathfinder
function BlackwoodPathfinder_OnCombat(Unit, Event)
	Unit:RegisterEvent("BlackwoodPathfinder_FaerieFire", 4000, 1)
	Unit:RegisterEvent("BlackwoodPathfinder_Thrash", 6000, 0)
end

function BlackwoodPathfinder_FaerieFire(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6950, pUnit:GetMainTank()) 
end

function BlackwoodPathfinder_Thrash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3391, pUnit:GetMainTank()) 
end

function BlackwoodPathfinder_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BlackwoodPathfinder_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2167, 1, "BlackwoodPathfinder_OnCombat")
RegisterUnitEvent(2167, 2, "BlackwoodPathfinder_OnLeaveCombat")
RegisterUnitEvent(2167, 4, "BlackwoodPathfinder_OnDied")

--Blackwood Shaman
function BlackwoodShaman_OnCombat(Unit, Event)
	Unit:RegisterEvent("BlackwoodShaman_HealingWave", 13000, 0)
	Unit:RegisterEvent("BlackwoodShaman_Shock", 7000, 0)
	Unit:RegisterEvent("BlackwoodShaman_LightningBolt", 9000, 0)
end

function BlackwoodShaman_HealingWave(pUnit, Event) 
	pUnit:CastSpell(913) 
end

function BlackwoodShaman_LightningBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9532, pUnit:GetMainTank()) 
end

function BlackwoodShaman_Shock(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(2606, pUnit:GetMainTank()) 
end

function BlackwoodShaman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BlackwoodShaman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2171, 1, "BlackwoodShaman_OnCombat")
RegisterUnitEvent(2171, 2, "BlackwoodShaman_OnLeaveCombat")
RegisterUnitEvent(2171, 4, "BlackwoodShaman_OnDied")

--Blackwood Totemic
function BlackwoodTotemic_OnCombat(Unit, Event)
	Unit:RegisterEvent("BlackwoodTotemic_HealingWard", 13000, 0)
end

function BlackwoodTotemic_HealingWard(pUnit, Event) 
	pUnit:CastSpell(5606) 
end

function BlackwoodTotemic_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BlackwoodTotemic_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2169, 1, "BlackwoodTotemic_OnCombat")
RegisterUnitEvent(2169, 2, "BlackwoodTotemic_OnLeaveCombat")
RegisterUnitEvent(2169, 4, "BlackwoodTotemic_OnDied")

--Blackwood Tracker
function BlackwoodTracker_OnCombat(Unit, Event)
	Unit:RegisterEvent("BlackwoodTracker_FaerieFire", 3000, 1)
	Unit:RegisterEvent("BlackwoodTracker_Thrash", 5000, 0)
end

function BlackwoodTracker_FaerieFire(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6950, pUnit:GetMainTank()) 
end

function BlackwoodTracker_Thrash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3391, pUnit:GetMainTank()) 
end

function BlackwoodTracker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BlackwoodTracker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11713, 1, "BlackwoodTracker_OnCombat")
RegisterUnitEvent(11713, 2, "BlackwoodTracker_OnLeaveCombat")
RegisterUnitEvent(11713, 4, "BlackwoodTracker_OnDied")

--Blackwood Ursa
function BlackwoodUrsa_OnCombat(Unit, Event)
	Unit:RegisterEvent("BlackwoodUrsa_Rejuvenation", 10000, 0)
end

function BlackwoodUrsa_Rejuvenation(pUnit, Event) 
	if(pUnit:GetHealthPct() < 15) then
		pUnit:FullCastSpell(1058)
	end
end

function BlackwoodUrsa_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BlackwoodUrsa_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2170, 1, "BlackwoodUrsa_OnCombat")
RegisterUnitEvent(2170, 2, "BlackwoodUrsa_OnLeaveCombat")
RegisterUnitEvent(2170, 4, "BlackwoodUrsa_OnDied")

--Blackwood Warrior
function BlackwoodWarrior_OnCombat(Unit, Event)
	Unit:RegisterEvent("BlackwoodWarrior_BattleStance", 2000, 1)
	Unit:RegisterEvent("BlackwoodWarrior_Thunderclap", 7000, 0)
end

function BlackwoodWarrior_BattleStance(pUnit, Event) 
	pUnit:CastSpell(7165) 
end

function BlackwoodWarrior_Thunderclap(pUnit, Event) 
	pUnit:CastSpell(8078) 
end

function BlackwoodWarrior_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BlackwoodWarrior_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2168, 1, "BlackwoodWarrior_OnCombat")
RegisterUnitEvent(2168, 2, "BlackwoodWarrior_OnLeaveCombat")
RegisterUnitEvent(2168, 4, "BlackwoodWarrior_OnDied")

--Blackwood Windtalker
function BlackwoodWindtalker_OnCombat(Unit, Event)
	Unit:RegisterEvent("BlackwoodWindtalker_GustofWind", 9000, 0)
end

function BlackwoodWindtalker_GustofWind(pUnit, Event) 
	pUnit:CastSpell(6982) 
end

function BlackwoodWindtalker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BlackwoodWindtalker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2324, 1, "BlackwoodWindtalker_OnCombat")
RegisterUnitEvent(2324, 2, "BlackwoodWindtalker_OnLeaveCombat")
RegisterUnitEvent(2324, 4, "BlackwoodWindtalker_OnDied")

--Cursed Highborne
function CursedHighborne_OnCombat(Unit, Event)
	Unit:RegisterEvent("CursedHighborne_BansheeCurse", 9000, 0)
end

function CursedHighborne_BansheeCurse(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(5884, pUnit:GetMainTank()) 
end

function CursedHighborne_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CursedHighborne_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2176, 1, "CursedHighborne_OnCombat")
RegisterUnitEvent(2176, 2, "CursedHighborne_OnLeaveCombat")
RegisterUnitEvent(2176, 4, "CursedHighborne_OnDied")

--Dark Strand Fanatic
function DarkStrandFanatic_OnCombat(Unit, Event)
	Unit:RegisterEvent("DarkStrandFanatic_CurseofMending", 5000, 1)
end

function DarkStrandFanatic_CurseofMending(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(7098, pUnit:GetMainTank()) 
end

function DarkStrandFanatic_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DarkStrandFanatic_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2336, 1, "DarkStrandFanatic_OnCombat")
RegisterUnitEvent(2336, 2, "DarkStrandFanatic_OnLeaveCombat")
RegisterUnitEvent(2336, 4, "DarkStrandFanatic_OnDied")

--Dark Strand Voidcaller
function DarkStrandVoidcaller_OnCombat(Unit, Event)
	Unit:RegisterEvent("DarkStrandVoidcaller_ShadowBolt", 8000, 0)
	Unit:RegisterEvent("DarkStrandVoidcaller_SummonVoidwalker", 2000, 1)
end

function DarkStrandVoidcaller_ShadowBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20807, pUnit:GetMainTank()) 
end

function DarkStrandVoidcaller_SummonVoidwalker(pUnit, Event) 
	pUnit:CastSpell(12746) 
end

function DarkStrandVoidcaller_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DarkStrandVoidcaller_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2337, 1, "DarkStrandVoidcaller_OnCombat")
RegisterUnitEvent(2337, 2, "DarkStrandVoidcaller_OnLeaveCombat")
RegisterUnitEvent(2337, 4, "DarkStrandVoidcaller_OnDied")

--Darkshore Thresher
function DarkshoreThresher_OnCombat(Unit, Event)
	Unit:RegisterEvent("DarkshoreThresher_PierceArmor", 9000, 0)
end

function DarkshoreThresher_PierceArmor(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6016, pUnit:GetMainTank()) 
end

function DarkshoreThresher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DarkshoreThresher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2185, 1, "DarkshoreThresher_OnCombat")
RegisterUnitEvent(2185, 2, "DarkshoreThresher_OnLeaveCombat")
RegisterUnitEvent(2185, 4, "DarkshoreThresher_OnDied")

--Den Mother
function DenMother_OnCombat(Unit, Event)
	Unit:RegisterEvent("DenMother_Ravage", 9000, 0)
end

function DenMother_Ravage(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3242, pUnit:GetMainTank()) 
end

function DenMother_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DenMother_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6788, 1, "DenMother_OnCombat")
RegisterUnitEvent(6788, 2, "DenMother_OnLeaveCombat")
RegisterUnitEvent(6788, 4, "DenMother_OnDied")

--Dethryll Satyr
function DethryllSatyr_OnCombat(Unit, Event)
	Unit:RegisterEvent("DethryllSatyr_Shoot", 6000, 0)
end

function DethryllSatyr_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6660, pUnit:GetMainTank()) 
end

function DethryllSatyr_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DethryllSatyr_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2212, 1, "DethryllSatyr_OnCombat")
RegisterUnitEvent(2212, 2, "DethryllSatyr_OnLeaveCombat")
RegisterUnitEvent(2212, 4, "DethryllSatyr_OnDied")

--Elder Darkshore Thresher
function ElderDarkshoreThresher_OnCombat(Unit, Event)
	Unit:RegisterEvent("ElderDarkshoreThresher_PierceArmor", 9000, 0)
end

function ElderDarkshoreThresher_PierceArmor(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6016, pUnit:GetMainTank()) 
end

function ElderDarkshoreThresher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ElderDarkshoreThresher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2187, 1, "ElderDarkshoreThresher_OnCombat")
RegisterUnitEvent(2187, 2, "ElderDarkshoreThresher_OnLeaveCombat")
RegisterUnitEvent(2187, 4, "ElderDarkshoreThresher_OnDied")

--Encrusted Tide Crawler
function EncrustedTideCrawler_OnCombat(Unit, Event)
	Unit:RegisterEvent("EncrustedTideCrawler_InfectedWound", 5000, 1)
end

function EncrustedTideCrawler_InfectedWound(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3427, pUnit:GetMainTank()) 
end

function EncrustedTideCrawler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function EncrustedTideCrawler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2233, 1, "EncrustedTideCrawler_OnCombat")
RegisterUnitEvent(2233, 2, "EncrustedTideCrawler_OnLeaveCombat")
RegisterUnitEvent(2233, 4, "EncrustedTideCrawler_OnDied")

--Fallenroot Satyr
function FallenrootSatyr_OnCombat(Unit, Event)
	Unit:RegisterEvent("FallenrootSatyr_DefensiveStance", 2000, 1)
	Unit:RegisterEvent("FallenrootSatyr_Disarm", 9000, 0)
end

function FallenrootSatyr_DefensiveStance(pUnit, Event) 
	pUnit:CastSpell(7164) 
end

function FallenrootSatyr_Disarm(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6713, pUnit:GetMainTank()) 
end

function FallenrootSatyr_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FallenrootSatyr_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4788, 1, "FallenrootSatyr_OnCombat")
RegisterUnitEvent(4788, 2, "FallenrootSatyr_OnLeaveCombat")
RegisterUnitEvent(4788, 4, "FallenrootSatyr_OnDied")

--Ghost Saber
function GhostSaber_OnCombat(Unit, Event)
	Unit:RegisterEvent("GhostSaber_Claw", 6000, 0)
end

function GhostSaber_Claw(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(16829, pUnit:GetMainTank()) 
end

function GhostSaber_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GhostSaber_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3619, 1, "GhostSaber_OnCombat")
RegisterUnitEvent(3619, 2, "GhostSaber_OnLeaveCombat")
RegisterUnitEvent(3619, 4, "GhostSaber_OnDied")

--Gravelflint Bonesnapper
function GravelflintBonesnapper_OnCombat(Unit, Event)
	Unit:RegisterEvent("GravelflintBonesnapper_HeadCrack", 8000, 0)
end

function GravelflintBonesnapper_HeadCrack(pUnit, Event) 
	pUnit:CastSpell(3148, pUnit:GetMainTank()) 
end

function GravelflintBonesnapper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GravelflintBonesnapper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2159, 1, "GravelflintBonesnapper_OnCombat")
RegisterUnitEvent(2159, 2, "GravelflintBonesnapper_OnLeaveCombat")
RegisterUnitEvent(2159, 4, "GravelflintBonesnapper_OnDied")

--Gravelflint Geomancer
function GravelflintGeomancer_OnCombat(Unit, Event)
	Unit:RegisterEvent("GravelflintGeomancer_Fireball", 8000, 0)
	Unit:RegisterEvent("GravelflintGeomancer_FrostArmor", 2000, 1)
end

function GravelflintGeomancer_Fireball(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(19816, pUnit:GetMainTank()) 
end

function GravelflintGeomancer_FrostArmor(pUnit, Event) 
	pUnit:CastSpell(12544) 
end

function GravelflintGeomancer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GravelflintGeomancer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2160, 1, "GravelflintGeomancer_OnCombat")
RegisterUnitEvent(2160, 2, "GravelflintGeomancer_OnLeaveCombat")
RegisterUnitEvent(2160, 4, "GravelflintGeomancer_OnDied")

--Greymist Hunter
function GreymistHunter_OnCombat(Unit, Event)
	Unit:RegisterEvent("GreymistHunter_Throw", 6000, 0)
end

function GreymistHunter_Throw(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(10277, pUnit:GetMainTank()) 
end

function GreymistHunter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GreymistHunter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2206, 1, "GreymistHunter_OnCombat")
RegisterUnitEvent(2206, 2, "GreymistHunter_OnLeaveCombat")
RegisterUnitEvent(2206, 4, "GreymistHunter_OnDied")

--Greymist Netter
function GreymistNetter_OnCombat(Unit, Event)
	Unit:RegisterEvent("GreymistNetter_Net", 10000, 0)
end

function GreymistNetter_Net(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12024, pUnit:GetMainTank()) 
end

function GreymistNetter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GreymistNetter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2204, 1, "GreymistNetter_OnCombat")
RegisterUnitEvent(2204, 2, "GreymistNetter_OnLeaveCombat")
RegisterUnitEvent(2204, 4, "GreymistNetter_OnDied")

--Greymist Oracle
function GreymistOracle_OnCombat(Unit, Event)
	Unit:RegisterEvent("GreymistOracle_HealingWave", 13000, 0)
	Unit:RegisterEvent("GreymistOracle_LightningBolt", 8000, 0)
end

function GreymistOracle_HealingWave(pUnit, Event) 
	pUnit:CastSpell(913) 
end

function GreymistOracle_LightningBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9532, pUnit:GetMainTank()) 
end

function GreymistOracle_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GreymistOracle_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2207, 1, "GreymistOracle_OnCombat")
RegisterUnitEvent(2207, 2, "GreymistOracle_OnLeaveCombat")
RegisterUnitEvent(2207, 4, "GreymistOracle_OnDied")

--Greymist Seer
function GreymistSeer_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("GreymistSeer_LightningBolt", math.random(3000,5000), 10)
	pUnit:RegisterEvent("GreymistSeer_HealingWave", 1000, 0)
	pUnit:RegisterEvent("GreymistSeer_LightningShield", 500, 1)
end

function GreymistSeer_LightningBolt(pUnit, Event)
	pUnit:FullCastSpellOnTarget(26364, pUnit:GetClosestPlayer())
end

function GreymistSeer_HealingWave(pUnit, Event)
	if(pUnit:GetHealthPct() < 15) then
		pUnit:FullCastSpell(547)
	end
end

function GreymistSeer_LightningShield(pUnit, Event)
	pUnit:FullCastSpell(324)
end

function GreymistSeer_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

function GreymistSeer_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2203, 1, "GreymistSeer_OnCombat")
RegisterUnitEvent(2203, 2, "GreymistSeer_OnLeaveCombat")
RegisterUnitEvent(2203, 4, "GreymistSeer_OnDied")

--Greymist Warrior
function GreymistWarrior_OnCombat(Unit, Event)
	Unit:RegisterEvent("GreymistWarrior_BattleShout", 2000, 1)
end

function GreymistWarrior_BattleShout(pUnit, Event) 
	pUnit:CastSpell(5242) 
end

function GreymistWarrior_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GreymistWarrior_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2205, 1, "GreymistWarrior_OnCombat")
RegisterUnitEvent(2205, 2, "GreymistWarrior_OnLeaveCombat")
RegisterUnitEvent(2205, 4, "GreymistWarrior_OnDied")

--Grizzled Thistle Bear
function GrizzledThistleBear_OnCombat(Unit, Event)
	Unit:RegisterEvent("GrizzledThistleBear_Ravage", 8000, 0)
end

function GrizzledThistleBear_Ravage(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3242, pUnit:GetMainTank()) 
end

function GrizzledThistleBear_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GrizzledThistleBear_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2165, 1, "GrizzledThistleBear_OnCombat")
RegisterUnitEvent(2165, 2, "GrizzledThistleBear_OnLeaveCombat")
RegisterUnitEvent(2165, 4, "GrizzledThistleBear_OnDied")

--Mariner Bladewhisper
function MarinerBladewhisper_OnCombat(Unit, Event)
	Unit:RegisterEvent("MarinerBladewhisper_Net", 10000, 0)
end

function MarinerBladewhisper_Net(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12024, pUnit:GetMainTank()) 
end

function MarinerBladewhisper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MarinerBladewhisper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24996, 1, "MarinerBladewhisper_OnCombat")
RegisterUnitEvent(24996, 2, "MarinerBladewhisper_OnLeaveCombat")
RegisterUnitEvent(24996, 4, "MarinerBladewhisper_OnDied")

--Mariner Evenmist
function MarinerEvenmist_OnCombat(Unit, Event)
	Unit:RegisterEvent("MarinerEvenmist_Net", 10000, 0)
end

function MarinerEvenmist_Net(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12024, pUnit:GetMainTank()) 
end

function MarinerEvenmist_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MarinerEvenmist_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25007, 1, "MarinerEvenmist_OnCombat")
RegisterUnitEvent(25007, 2, "MarinerEvenmist_OnLeaveCombat")
RegisterUnitEvent(25007, 4, "MarinerEvenmist_OnDied")

--Mariner Farseeker
function MarinerFarseeker_OnCombat(Unit, Event)
	Unit:RegisterEvent("MarinerFarseeker_Net", 10000, 0)
end

function MarinerFarseeker_Net(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12024, pUnit:GetMainTank()) 
end

function MarinerFarseeker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MarinerFarseeker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25053, 1, "MarinerFarseeker_OnCombat")
RegisterUnitEvent(25053, 2, "MarinerFarseeker_OnLeaveCombat")
RegisterUnitEvent(25053, 4, "MarinerFarseeker_OnDied")

--Mariner Farsight
function MarinerFarsight_OnCombat(Unit, Event)
	Unit:RegisterEvent("MarinerFarsight_Net", 10000, 0)
end

function MarinerFarsight_Net(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12024, pUnit:GetMainTank()) 
end

function MarinerFarsight_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MarinerFarsight_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24998, 1, "MarinerFarsight_OnCombat")
RegisterUnitEvent(24998, 2, "MarinerFarsight_OnLeaveCombat")
RegisterUnitEvent(24998, 4, "MarinerFarsight_OnDied")

--Mariner Frostnight
function MarinerFrostnight_OnCombat(Unit, Event)
	Unit:RegisterEvent("MarinerFrostnight_Net", 10000, 0)
end

function MarinerFrostnight_Net(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12024, pUnit:GetMainTank()) 
end

function MarinerFrostnight_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MarinerFrostnight_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25055, 1, "MarinerFrostnight_OnCombat")
RegisterUnitEvent(25055, 2, "MarinerFrostnight_OnLeaveCombat")
RegisterUnitEvent(25055, 4, "MarinerFrostnight_OnDied")

--Mariner Keenstar
function MarinerKeenstar_OnCombat(Unit, Event)
	Unit:RegisterEvent("MarinerKeenstar_Net", 10000, 0)
end

function MarinerKeenstar_Net(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12024, pUnit:GetMainTank()) 
end

function MarinerKeenstar_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MarinerKeenstar_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25054, 1, "MarinerKeenstar_OnCombat")
RegisterUnitEvent(25054, 2, "MarinerKeenstar_OnLeaveCombat")
RegisterUnitEvent(25054, 4, "MarinerKeenstar_OnDied")

--Mariner Stillglider
function MarinerStillglider_OnCombat(Unit, Event)
	Unit:RegisterEvent("MarinerStillglider_Net", 10000, 0)
end

function MarinerStillglider_Net(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12024, pUnit:GetMainTank()) 
end

function MarinerStillglider_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MarinerStillglider_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25056, 1, "MarinerStillglider_OnCombat")
RegisterUnitEvent(25056, 2, "MarinerStillglider_OnLeaveCombat")
RegisterUnitEvent(25056, 4, "MarinerStillglider_OnDied")

--Mariner Swiftstar
function MarinerSwiftstar_OnCombat(Unit, Event)
	Unit:RegisterEvent("MarinerSwiftstar_Net", 10000, 0)
end

function MarinerSwiftstar_Net(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12024, pUnit:GetMainTank()) 
end

function MarinerSwiftstar_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MarinerSwiftstar_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24997, 1, "MarinerSwiftstar_OnCombat")
RegisterUnitEvent(24997, 2, "MarinerSwiftstar_OnLeaveCombat")
RegisterUnitEvent(24997, 4, "MarinerSwiftstar_OnDied")

--Moonkin Oracle
function MoonkinOracle_OnCombat(Unit, Event)
	Unit:RegisterEvent("MoonkinOracle_Moonfire", 9000, 0)
	Unit:RegisterEvent("MoonkinOracle_Regrowth", 12000, 0)
	Unit:RegisterEvent("MoonkinOracle_Wrath", 7000, 0)
end

function MoonkinOracle_Moonfire(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(15795, pUnit:GetMainTank()) 
end

function MoonkinOracle_Regrowth(pUnit, Event) 
	pUnit:CastSpell(16561) 
end

function MoonkinOracle_Wrath(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9739, pUnit:GetMainTank()) 
end

function MoonkinOracle_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MoonkinOracle_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10157, 1, "MoonkinOracle_OnCombat")
RegisterUnitEvent(10157, 2, "MoonkinOracle_OnLeaveCombat")
RegisterUnitEvent(10157, 4, "MoonkinOracle_OnDied")

--Moonkin
function Moonkin_OnCombat(Unit, Event)
	Unit:RegisterEvent("Moonkin_Thrash", 6000, 0)
end

function Moonkin_Thrash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3391, pUnit:GetMainTank()) 
end

function Moonkin_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Moonkin_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10158, 1, "Moonkin_OnCombat")
RegisterUnitEvent(10158, 2, "Moonkin_OnLeaveCombat")
RegisterUnitEvent(10158, 4, "Moonkin_OnDied")

--Moonstalker Matriarch
function MoonstalkerMatriarch_OnCombat(Unit, Event)
	Unit:RegisterEvent("MoonstalkerMatriarch_SummonMoonstalkerRunt", 2000, 1)
end

function MoonstalkerMatriarch_SummonMoonstalkerRunt(pUnit, Event) 
	pUnit:CastSpell(8594) 
end

function MoonstalkerMatriarch_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MoonstalkerMatriarch_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2071, 1, "MoonstalkerMatriarch_OnCombat")
RegisterUnitEvent(2071, 2, "MoonstalkerMatriarch_OnLeaveCombat")
RegisterUnitEvent(2071, 4, "MoonstalkerMatriarch_OnDied")

--Moonstalker Runt
function MoonstalkerRunt_OnCombat(Unit, Event)
	Unit:RegisterEvent("MoonstalkerRunt_Claw", 6000, 0)
	Unit:RegisterEvent("MoonstalkerRunt_Rake", 10000, 0)
end

function MoonstalkerRunt_Claw(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(16828, pUnit:GetMainTank()) 
end

function MoonstalkerRunt_Rake(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(59881, pUnit:GetMainTank()) 
end

function MoonstalkerRunt_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MoonstalkerRunt_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2070, 1, "MoonstalkerRunt_OnCombat")
RegisterUnitEvent(2070, 2, "MoonstalkerRunt_OnLeaveCombat")
RegisterUnitEvent(2070, 4, "MoonstalkerRunt_OnDied")

--Rabid Thistle Bear
function RabidThistleBear_OnCombat(Unit, Event)
	Unit:RegisterEvent("RabidThistleBear_Rabies", 5000, 1)
end

function RabidThistleBear_Rabies(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3150, pUnit:GetMainTank()) 
end

function RabidThistleBear_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RabidThistleBear_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2164, 1, "RabidThistleBear_OnCombat")
RegisterUnitEvent(2164, 2, "RabidThistleBear_OnLeaveCombat")
RegisterUnitEvent(2164, 4, "RabidThistleBear_OnDied")

--Raging Moonkin
function RaginMoonkin_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("RaginMoonkin_Rend", math.random(5000,8000), 0)
	pUnit:RegisterEvent("RaginMoonkin_Enrage", 1000, 0)
end

function RaginMoonkin_Rend(pUnit, Event)
	pUnit:FullCastSpellOnTarget(13443, pUnit:GetClosestPlayer())
end

function RaginMoonkin_Enrage(Unit, Event)
	if(Unit:GetHealthPct() < 15) then
		Unit:CastSpell(8599)
	end
end

function RaginMoonkin_OnDead(pUnit, Event)
	pUnit:RemoveEvents()
end

function RaginMoonkin_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(10160, 1, "RaginMoonkin_OnCombat")
RegisterUnitEvent(10160, 2, "RaginMoonkin_OnLeaveCombat")
RegisterUnitEvent(10160, 4, "RaginMoonkin_OnDead")

--Raging Reef Crawler
function RagingReefCrawler_OnCombat(Unit, Event)
	Unit:RegisterEvent("RagingReefCrawler_Thrash", 6000, 0)
end

function RagingReefCrawler_Thrash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3391, pUnit:GetMainTank()) 
end

function RagingReefCrawler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RagingReefCrawler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2236, 1, "RagingReefCrawler_OnCombat")
RegisterUnitEvent(2236, 2, "RagingReefCrawler_OnLeaveCombat")
RegisterUnitEvent(2236, 4, "RagingReefCrawler_OnDied")

--Reef Crawler
function ReefCrawler_OnCombat(Unit, Event)
	Unit:RegisterEvent("ReefCrawler_MuscleTear", 8000, 0)
end

function ReefCrawler_MuscleTear(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12166, pUnit:GetMainTank()) 
end

function ReefCrawler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ReefCrawler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2235, 1, "ReefCrawler_OnCombat")
RegisterUnitEvent(2235, 2, "ReefCrawler_OnLeaveCombat")
RegisterUnitEvent(2235, 4, "ReefCrawler_OnDied")

--Reef Shark
function ReefShark_OnCombat(Unit, Event)
	Unit:RegisterEvent("ReefShark_Thrash", 6000, 0)
end

function ReefShark_Thrash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3391, pUnit:GetMainTank()) 
end

function ReefShark_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ReefShark_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12123, 1, "ReefShark_OnCombat")
RegisterUnitEvent(12123, 2, "ReefShark_OnLeaveCombat")
RegisterUnitEvent(12123, 4, "ReefShark_OnDied")

--Sentinel Brightgrass
function SentinelBrightgrass_OnCombat(Unit, Event)
	Unit:RegisterEvent("SentinelBrightgrass_Net", 10000, 0)
	Unit:RegisterEvent("SentinelBrightgrass_Shoot", 6000, 0)
end

function SentinelBrightgrass_Net(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12024, pUnit:GetMainTank()) 
end

function SentinelBrightgrass_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(23337, pUnit:GetMainTank()) 
end

function SentinelBrightgrass_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SentinelBrightgrass_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25013, 1, "SentinelBrightgrass_OnCombat")
RegisterUnitEvent(25013, 2, "SentinelBrightgrass_OnLeaveCombat")
RegisterUnitEvent(25013, 4, "SentinelBrightgrass_OnDied")

--Sentinel Winterdew
function SentinelWinterdew_OnCombat(Unit, Event)
	Unit:RegisterEvent("SentinelWinterdew_Net", 10000, 0)
	Unit:RegisterEvent("SentinelWinterdew_Shoot", 6000, 0)
end

function SentinelWinterdew_Net(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12024, pUnit:GetMainTank()) 
end

function SentinelWinterdew_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(23337, pUnit:GetMainTank()) 
end

function SentinelWinterdew_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SentinelWinterdew_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25014, 1, "SentinelWinterdew_OnCombat")
RegisterUnitEvent(25014, 2, "SentinelWinterdew_OnLeaveCombat")
RegisterUnitEvent(25014, 4, "SentinelWinterdew_OnDied")

--Stormscale Myrmidon
function StormscaleMyrmidon_OnCombat(Unit, Event)
	Unit:RegisterEvent("StormscaleMyrmidon_Knockdown", 8000, 0)
end

function StormscaleMyrmidon_Knockdown(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(5164, pUnit:GetMainTank()) 
end

function StormscaleMyrmidon_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function StormscaleMyrmidon_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2181, 1, "StormscaleMyrmidon_OnCombat")
RegisterUnitEvent(2181, 2, "StormscaleMyrmidon_OnLeaveCombat")
RegisterUnitEvent(2181, 4, "StormscaleMyrmidon_OnDied")

--Stormscale Siren
function StormscaleSiren_OnCombat(Unit, Event)
	Unit:RegisterEvent("StormscaleSiren_Heal", 13000, 0)
	Unit:RegisterEvent("StormscaleSiren_HolySmite", 8000, 0)
end

function StormscaleSiren_Heal(pUnit, Event) 
	pUnit:CastSpell(11642) 
end

function StormscaleSiren_HolySmite(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9734, pUnit:GetMainTank()) 
end

function StormscaleSiren_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function StormscaleSiren_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2180, 1, "StormscaleSiren_OnCombat")
RegisterUnitEvent(2180, 2, "StormscaleSiren_OnLeaveCombat")
RegisterUnitEvent(2180, 4, "StormscaleSiren_OnDied")

--Stormscale Sorceress
function StormscaleSorceress_OnCombat(Unit, Event)
	Unit:RegisterEvent("StormscaleSorceress_FrostArmor", 2000, 1)
	Unit:RegisterEvent("StormscaleSorceress_Frostbolt", 8000, 0)
end

function StormscaleSorceress_FrostArmor(pUnit, Event) 
	pUnit:CastSpell(12544) 
end

function StormscaleSorceress_Frostbolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20792, pUnit:GetMainTank()) 
end

function StormscaleSorceress_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function StormscaleSorceress_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2182, 1, "StormscaleSorceress_OnCombat")
RegisterUnitEvent(2182, 2, "StormscaleSorceress_OnLeaveCombat")
RegisterUnitEvent(2182, 4, "StormscaleSorceress_OnDied")

--Stormscale Toxicologist
function StormscaleToxicologist_OnCombat(Unit, Event)
	Unit:RegisterEvent("StormscaleToxicologist_HolySmite", 8000, 0)
end

function StormscaleToxicologist_HolySmite(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9734, pUnit:GetMainTank()) 
end

function StormscaleToxicologist_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function StormscaleToxicologist_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12321, 1, "StormscaleToxicologist_OnCombat")
RegisterUnitEvent(12321, 2, "StormscaleToxicologist_OnLeaveCombat")
RegisterUnitEvent(12321, 4, "StormscaleToxicologist_OnDied")

--Stormscale Warrior
function StormscaleWarrior_OnCombat(Unit, Event)
	Unit:RegisterEvent("StormscaleWarrior_ImprovedBlocking", 8000, 0)
end

function StormscaleWarrior_ImprovedBlocking(pUnit, Event) 
	pUnit:CastSpell(3248) 
end

function StormscaleWarrior_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function StormscaleWarrior_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2183, 1, "StormscaleWarrior_OnCombat")
RegisterUnitEvent(2183, 2, "StormscaleWarrior_OnLeaveCombat")
RegisterUnitEvent(2183, 4, "StormscaleWarrior_OnDied")

--Stormscale Wave Rider
function StormscaleWaveRider_OnCombat(Unit, Event)
	Unit:RegisterEvent("StormscaleWaveRider_AquaJet", 8000, 0)
end

function StormscaleWaveRider_AquaJet(pUnit, Event) 
	pUnit:CastSpell(13586) 
end

function StormscaleWaveRider_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function StormscaleWaveRider_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2179, 1, "StormscaleWaveRider_OnCombat")
RegisterUnitEvent(2179, 2, "StormscaleWaveRider_OnLeaveCombat")
RegisterUnitEvent(2179, 4, "StormscaleWaveRider_OnDied")

--Strider Clutchmother
function StriderClutchmother_OnCombat(Unit, Event)
	Unit:RegisterEvent("StriderClutchmother_DustCloud", 10000, 0)
	Unit:RegisterEvent("StriderClutchmother_Lash", 7000, 0)
end

function StriderClutchmother_DustCloud(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(7272, pUnit:GetMainTank()) 
end

function StriderClutchmother_Lash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6607, pUnit:GetMainTank()) 
end

function StriderClutchmother_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function StriderClutchmother_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2172, 1, "StriderClutchmother_OnCombat")
RegisterUnitEvent(2172, 2, "StriderClutchmother_OnLeaveCombat")
RegisterUnitEvent(2172, 4, "StriderClutchmother_OnDied")

--Thistle Bear
function ThistleBear_OnCombat(Unit, Event)
	Unit:RegisterEvent("ThistleBear_Claw", 5000, 0)
	Unit:RegisterEvent("ThistleBear_Ravage", 10000, 0)
	Unit:RegisterEvent("ThistleBear_Swipe", 8000, 0)
end

function ThistleBear_Claw(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(16828, pUnit:GetMainTank()) 
end

function ThistleBear_Ravage(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3242, pUnit:GetMainTank()) 
end

function ThistleBear_Swipe(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(50256, pUnit:GetMainTank()) 
end

function ThistleBear_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ThistleBear_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2163, 1, "ThistleBear_OnCombat")
RegisterUnitEvent(2163, 2, "ThistleBear_OnLeaveCombat")
RegisterUnitEvent(2163, 4, "ThistleBear_OnDied")

--Thistle Cub
function ThistleCub_OnCombat(Unit, Event)
	Unit:RegisterEvent("ThistleCub_Ravage", 9000, 0)
end

function ThistleCub_Ravage(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3242, pUnit:GetMainTank()) 
end

function ThistleCub_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ThistleCub_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6789, 1, "ThistleCub_OnCombat")
RegisterUnitEvent(6789, 2, "ThistleCub_OnLeaveCombat")
RegisterUnitEvent(6789, 4, "ThistleCub_OnDied")

--Twilight Disciple
function TwilightDisciple_OnCombat(Unit, Event)
	Unit:RegisterEvent("TwilightDisciple_Heal", 13000, 0)
	Unit:RegisterEvent("TwilightDisciple_Renew", 8000, 0)
end

function TwilightDisciple_Heal(pUnit, Event) 
	pUnit:CastSpell(2054) 
end

function TwilightDisciple_Renew(pUnit, Event) 
	pUnit:CastSpell(6074) 
end

function TwilightDisciple_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TwilightDisciple_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2338, 1, "TwilightDisciple_OnCombat")
RegisterUnitEvent(2338, 2, "TwilightDisciple_OnLeaveCombat")
RegisterUnitEvent(2338, 4, "TwilightDisciple_OnDied")

--Twilight Thug
function TwilightThug_OnCombat(Unit, Event)
	Unit:RegisterEvent("TwilightThug_BattleStance", 2000, 1)
	Unit:RegisterEvent("TwilightThug_BattleShout", 4000, 1)
	Unit:RegisterEvent("TwilightThug_Disarm", 9000, 0)
end

function TwilightThug_BattleStance(pUnit, Event) 
	pUnit:CastSpell(7165) 
end

function TwilightThug_BattleShout(pUnit, Event) 
	pUnit:CastSpell(5242) 
end

function TwilightThug_Disarm(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6713, pUnit:GetMainTank()) 
end

function TwilightThug_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TwilightThug_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2339, 1, "TwilightThug_OnCombat")
RegisterUnitEvent(2339, 2, "TwilightThug_OnLeaveCombat")
RegisterUnitEvent(2339, 4, "TwilightThug_OnDied")

--Wild Grell
function WildGrell_OnCombat(Unit, Event)
	Unit:RegisterEvent("WildGrell_Crazed", 10000, 1)
end

function WildGrell_Crazed(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(5915, pUnit:GetMainTank()) 
end

function WildGrell_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WildGrell_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2190, 1, "WildGrell_OnCombat")
RegisterUnitEvent(2190, 2, "WildGrell_OnLeaveCombat")
RegisterUnitEvent(2190, 4, "WildGrell_OnDied")