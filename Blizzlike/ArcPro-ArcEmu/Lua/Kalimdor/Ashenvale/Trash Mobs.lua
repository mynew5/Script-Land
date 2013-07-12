--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--Ashenvale Outrunner
function AshenvaleOutrunner_OnCombat(Unit, Event)
	Unit:RegisterEvent("AshenvaleOutrunner_ScorpidSting", 8000, 0)
	Unit:RegisterEvent("AshenvaleOutrunner_Shoot", 6000, 0)
	Unit:RegisterEvent("AshenvaleOutrunner_SnapKick", 10000, 0)
end

function AshenvaleOutrunner_ScorpidSting(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(18545, pUnit:GetMainTank()) 
end

function AshenvaleOutrunner_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6660, pUnit:GetMainTank()) 
end

function AshenvaleOutrunner_SnapKick(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(8646, pUnit:GetMainTank()) 
end

function AshenvaleOutrunner_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AshenvaleOutrunner_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12856, 1, "AshenvaleOutrunner_OnCombat")
RegisterUnitEvent(12856, 2, "AshenvaleOutrunner_OnLeaveCombat")
RegisterUnitEvent(12856, 4, "AshenvaleOutrunner_OnDied")

--Befouled Water Elemental
function BefouledWaterElemental_OnCombat(Unit, Event)
	Unit:RegisterEvent("BefouledWaterElemental_FoulChill", 1000, 2)
	Unit:RegisterEvent("BefouledWaterElemental_Frostbolt", 8000, 0)
end

function BefouledWaterElemental_FoulChill(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6873, pUnit:GetMainTank()) 
end

function BefouledWaterElemental_Frostbolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9672, pUnit:GetMainTank()) 
end

function BefouledWaterElemental_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BefouledWaterElemental_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3917, 1, "BefouledWaterElemental_OnCombat")
RegisterUnitEvent(3917, 2, "BefouledWaterElemental_OnLeaveCombat")
RegisterUnitEvent(3917, 4, "BefouledWaterElemental_OnDied")

--Bleakheart Hellcaller
function BleakheartHellcaller_OnCombat(Unit, Event)
	Unit:RegisterEvent("BleakheartHellcaller_SummonImp", 1000, 0)
end

function BleakheartHellcaller_SummonImp(pUnit, Event) 
	pUnit:CastSpell(11939) 
end

function BleakheartHellcaller_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BleakheartHellcaller_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3771, 1, "BleakheartHellcaller_OnCombat")
RegisterUnitEvent(3771, 2, "BleakheartHellcaller_OnLeaveCombat")
RegisterUnitEvent(3771, 4, "BleakheartHellcaller_OnDied")

--Bleakheart Shadowstalker
function BleakheartShadowstalker_OnCombat(Unit, Event)
	Unit:RegisterEvent("BleakheartShadowstalker_ShadowstalkerSlash", 8000, 0)
end

function BleakheartShadowstalker_ShadowstalkerSlash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6927, pUnit:GetMainTank()) 
end

function BleakheartShadowstalker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BleakheartShadowstalker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3770, 1, "BleakheartShadowstalker_OnCombat")
RegisterUnitEvent(3770, 2, "BleakheartShadowstalker_OnLeaveCombat")
RegisterUnitEvent(3770, 4, "BleakheartShadowstalker_OnDied")

--Branch Snapper
function BranchSnapper_OnCombat(Unit, Event)
	Unit:RegisterEvent("BranchSnapper_DeadlyPoison", 10000, 0)
	Unit:RegisterEvent("BranchSnapper_KnockAway", 8000, 0)
end

function BranchSnapper_DeadlyPoison(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3583, pUnit:GetMainTank()) 
end

function BranchSnapper_KnockAway(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(10101, pUnit:GetMainTank()) 
end

function BranchSnapper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BranchSnapper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10641, 1, "BranchSnapper_OnCombat")
RegisterUnitEvent(10641, 2, "BranchSnapper_OnLeaveCombat")
RegisterUnitEvent(10641, 4, "BranchSnapper_OnDied")

--Cenarion Protector
function CenarionProtector_OnCombat(Unit, Event)
	Unit:RegisterEvent("CenarionProtector_BearForm", 1000, 1)
	Unit:RegisterEvent("CenarionProtector_DemoralizingRoar", 8000, 0)
end

function CenarionProtector_BearForm(pUnit, Event) 
	pUnit:CastSpell(7090) 
end

function CenarionProtector_DemoralizingRoar(pUnit, Event) 
	pUnit:CastSpell(15727) 
end

function CenarionProtector_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CenarionProtector_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3797, 1, "CenarionProtector_OnCombat")
RegisterUnitEvent(3797, 2, "CenarionProtector_OnLeaveCombat")
RegisterUnitEvent(3797, 4, "CenarionProtector_OnDied")

--Cenarion Vindicator
function CenarionVindicator_OnCombat(Unit, Event)
	Unit:RegisterEvent("CenarionVindicator_Moonfire", 7000, 0)
end

function CenarionVindicator_Moonfire(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(15798, pUnit:GetMainTank()) 
end

function CenarionVindicator_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CenarionVindicator_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3833, 1, "CenarionVindicator_OnCombat")
RegisterUnitEvent(3833, 2, "CenarionVindicator_OnLeaveCombat")
RegisterUnitEvent(3833, 4, "CenarionVindicator_OnDied")

--Crazed Ancient
function CrazedAncient_OnCombat(Unit, Event)
	Unit:RegisterEvent("CrazedAncient_CurseofThorns", 3000, 2)
end

function CrazedAncient_CurseofThorns(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6909, pUnit:GetMainTank()) 
end

function CrazedAncient_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CrazedAncient_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3834, 1, "CrazedAncient_OnCombat")
RegisterUnitEvent(3834, 2, "CrazedAncient_OnLeaveCombat")
RegisterUnitEvent(3834, 4, "CrazedAncient_OnDied")

--Dark Strand Adept
function DarkStrandAdept_OnCombat(Unit, Event)
	Unit:RegisterEvent("DarkStrandAdept_SummonVoidwalker", 1000, 1)
	Unit:RegisterEvent("DarkStrandAdept_ShadowBolt", 8000, 0)
end

function DarkStrandAdept_SummonVoidwalker(pUnit, Event) 
	pUnit:CastSpell(12746) 
end

function DarkStrandAdept_ShadowBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20791, pUnit:GetMainTank()) 
end

function DarkStrandAdept_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DarkStrandAdept_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3728, 1, "DarkStrandAdept_OnCombat")
RegisterUnitEvent(3728, 2, "DarkStrandAdept_OnLeaveCombat")
RegisterUnitEvent(3728, 4, "DarkStrandAdept_OnDied")

--Dark Strand Cultist
function DarkStrandCultist_OnCombat(Unit, Event)
	Unit:RegisterEvent("DarkStrandCultist_SummonImp", 1000, 1)
	Unit:RegisterEvent("DarkStrandCultist_Corruption", 2000, 2)
	Unit:RegisterEvent("DarkStrandCultist_ShadowBolt", 8000, 0)
end

function DarkStrandCultist_SummonImp(pUnit, Event) 
	pUnit:CastSpell(11939) 
end

function DarkStrandCultist_Corruption(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6222, pUnit:GetMainTank()) 
end

function DarkStrandCultist_ShadowBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20791, pUnit:GetMainTank()) 
end

function DarkStrandCultist_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DarkStrandCultist_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3725, 1, "DarkStrandCultist_OnCombat")
RegisterUnitEvent(3725, 2, "DarkStrandCultist_OnLeaveCombat")
RegisterUnitEvent(3725, 4, "DarkStrandCultist_OnDied")

--Dark Strand Enforcer
function DarkStrandEnforcer_OnCombat(Unit, Event)
	Unit:RegisterEvent("DarkStrandEnforcer_Enrage", 10000, 0)
end

function DarkStrandEnforcer_Enrage(pUnit, Event) 
	pUnit:CastSpell(8599) 
end

function DarkStrandEnforcer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DarkStrandEnforcer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3727, 1, "DarkStrandEnforcer_OnCombat")
RegisterUnitEvent(3727, 2, "DarkStrandEnforcer_OnLeaveCombat")
RegisterUnitEvent(3727, 4, "DarkStrandEnforcer_OnDied")

--Elder Shadowhorn Stag
function ElderShadowhornStag_OnCombat(Unit, Event)
	Unit:RegisterEvent("ElderShadowhornStag_ShadowhornCharge", 8000, 0)
end

function ElderShadowhornStag_ShadowhornCharge(pUnit, Event) 
	pUnit:CastSpell(6921) 
end

function ElderShadowhornStag_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ElderShadowhornStag_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3818, 1, "ElderShadowhornStag_OnCombat")
RegisterUnitEvent(3818, 2, "ElderShadowhornStag_OnLeaveCombat")
RegisterUnitEvent(3818, 4, "ElderShadowhornStag_OnDied")

--Emeraldon Boughguard
function EmeraldonBoughguard_OnCombat(Unit, Event)
	Unit:RegisterEvent("EmeraldonBoughguard_Cleave", 6000, 0)
	Unit:RegisterEvent("EmeraldonBoughguard_Fixate", 8000, 0)
	Unit:RegisterEvent("EmeraldonBoughguard_MortalStrike", 10000, 0)
end

function EmeraldonBoughguard_Cleave(pUnit, Event) 
	pUnit:CastSpell(20666) 
end

function EmeraldonBoughguard_Fixate(pUnit, Event) 
	pUnit:CastSpell(12021) 
end

function EmeraldonBoughguard_MortalStrike(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(15708, pUnit:GetMainTank()) 
end

function EmeraldonBoughguard_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function EmeraldonBoughguard_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12474, 1, "EmeraldonBoughguard_OnCombat")
RegisterUnitEvent(12474, 2, "EmeraldonBoughguard_OnLeaveCombat")
RegisterUnitEvent(12474, 4, "EmeraldonBoughguard_OnDied")

--Emeraldon Oracle
function EmeraldonOracle_OnCombat(Unit, Event)
	Unit:RegisterEvent("EmeraldonOracle_Regrowth", 6000, 1)
	Unit:RegisterEvent("EmeraldonOracle_Rejuvenation", 12000, 0)
end

function EmeraldonOracle_Regrowth(pUnit, Event) 
	pUnit:CastSpell(20665) 
end

function EmeraldonOracle_Rejuvenation(pUnit, Event) 
	pUnit:CastSpell(20664) 
end

function EmeraldonOracle_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function EmeraldonOracle_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12476, 1, "EmeraldonOracle_OnCombat")
RegisterUnitEvent(12476, 2, "EmeraldonOracle_OnLeaveCombat")
RegisterUnitEvent(12476, 4, "EmeraldonOracle_OnDied")

--Emeraldon Tree Warder
function EmeraldonTreeWarder_OnCombat(Unit, Event)
	Unit:RegisterEvent("EmeraldonTreeWarder_FaerieFire", 2000, 2)
	Unit:RegisterEvent("EmeraldonTreeWarder_EntanglingRoots", 8000, 0)
end

function EmeraldonTreeWarder_FaerieFire(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20656, pUnit:GetMainTank()) 
end

function EmeraldonTreeWarder_EntanglingRoots(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20654, pUnit:GetMainTank()) 
end

function EmeraldonTreeWarder_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function EmeraldonTreeWarder_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12475, 1, "EmeraldonTreeWarder_OnCombat")
RegisterUnitEvent(12475, 2, "EmeraldonTreeWarder_OnLeaveCombat")
RegisterUnitEvent(12475, 4, "EmeraldonTreeWarder_OnDied")

--Felmusk Felsworn
function FelmuskFelsworn_OnCombat(Unit, Event)
	Unit:RegisterEvent("FelmuskFelsworn_OverwhelmingStench", 10000, 0)
end

function FelmuskFelsworn_OverwhelmingStench(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6942, pUnit:GetMainTank()) 
end

function FelmuskFelsworn_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FelmuskFelsworn_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3762, 1, "FelmuskFelsworn_OnCombat")
RegisterUnitEvent(3762, 2, "FelmuskFelsworn_OnLeaveCombat")
RegisterUnitEvent(3762, 4, "FelmuskFelsworn_OnDied")

--Felmusk Rogue
function FelmuskRogue_OnCombat(Unit, Event)
	Unit:RegisterEvent("FelmuskRogue_OverwhelmingStench", 10000, 0)
end

function FelmuskRogue_OverwhelmingStench(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6942, pUnit:GetMainTank()) 
end

function FelmuskRogue_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FelmuskRogue_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3759, 1, "FelmuskRogue_OnCombat")
RegisterUnitEvent(3759, 2, "FelmuskRogue_OnLeaveCombat")
RegisterUnitEvent(3759, 4, "FelmuskRogue_OnDied")

--Felmusk Satyr
function FelmuskSatyr_OnCombat(Unit, Event)
	Unit:RegisterEvent("FelmuskSatyr_OverwhelmingStench", 10000, 0)
end

function FelmuskSatyr_OverwhelmingStench(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6942, pUnit:GetMainTank()) 
end

function FelmuskSatyr_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FelmuskSatyr_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3758, 1, "FelmuskSatyr_OnCombat")
RegisterUnitEvent(3758, 2, "FelmuskSatyr_OnLeaveCombat")
RegisterUnitEvent(3758, 4, "FelmuskSatyr_OnDied")

--Felmusk Shadowstalker
function FelmuskShadowstalker_OnCombat(Unit, Event)
	Unit:RegisterEvent("FelmuskShadowstalker_OverwhelmingStench", 10000, 0)
end

function FelmuskShadowstalker_OverwhelmingStench(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6942, pUnit:GetMainTank()) 
end

function FelmuskShadowstalker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FelmuskShadowstalker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3763, 1, "FelmuskShadowstalker_OnCombat")
RegisterUnitEvent(3763, 2, "FelmuskShadowstalker_OnLeaveCombat")
RegisterUnitEvent(3763, 4, "FelmuskShadowstalker_OnDied")

--Felslayer
function Felslayer_OnCombat(Unit, Event)
	Unit:RegisterEvent("Felslayer_ManaBurn", 8000, 0)
end

function Felslayer_ManaBurn(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(2691, pUnit:GetRandomPlayer(4)) 
end

function Felslayer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Felslayer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3774, 1, "Felslayer_OnCombat")
RegisterUnitEvent(3774, 2, "Felslayer_OnLeaveCombat")
RegisterUnitEvent(3774, 4, "Felslayer_OnDied")

--Forsaken Dark Stalker
function ForsakenDarkStalker_OnCombat(Unit, Event)
	Unit:RegisterEvent("ForsakenDarkStalker_Throw", 6000, 0)
end

function ForsakenDarkStalker_Throw(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(10277, pUnit:GetMainTank()) 
end

function ForsakenDarkStalker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ForsakenDarkStalker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3808, 1, "ForsakenDarkStalker_OnCombat")
RegisterUnitEvent(3808, 2, "ForsakenDarkStalker_OnLeaveCombat")
RegisterUnitEvent(3808, 4, "ForsakenDarkStalker_OnDied")

--Forsaken Herbalist
function ForsakenHerbalist_OnCombat(Unit, Event)
	Unit:RegisterEvent("ForsakenHerbalist_ContagionofRot", 2000, 2)
end

function ForsakenHerbalist_ContagionofRot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(7102, pUnit:GetMainTank()) 
end

function ForsakenHerbalist_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ForsakenHerbalist_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3733, 1, "ForsakenHerbalist_OnCombat")
RegisterUnitEvent(3733, 2, "ForsakenHerbalist_OnLeaveCombat")
RegisterUnitEvent(3733, 4, "ForsakenHerbalist_OnDied")

--Forsaken Seeker
function ForsakenSeeker_OnCombat(Unit, Event)
	Unit:RegisterEvent("ForsakenSeeker_Heal", 12000, 0)
	Unit:RegisterEvent("ForsakenSeeker_HolySmite", 7000, 0)
end

function ForsakenSeeker_Heal(pUnit, Event) 
	pUnit:CastSpell(2054) 
end

function ForsakenSeeker_HolySmite(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9734, pUnit:GetMainTank()) 
end

function ForsakenSeeker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ForsakenSeeker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3732, 1, "ForsakenSeeker_OnCombat")
RegisterUnitEvent(3732, 2, "ForsakenSeeker_OnLeaveCombat")
RegisterUnitEvent(3732, 4, "ForsakenSeeker_OnDied")

--Forsaken Thug
function ForsakenThug_OnCombat(Unit, Event)
	Unit:RegisterEvent("ForsakenThug_Backhand", 7000, 0)
end

function ForsakenThug_Backhand(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6253, pUnit:GetMainTank()) 
end

function ForsakenThug_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ForsakenThug_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3734, 1, "ForsakenThug_OnCombat")
RegisterUnitEvent(3734, 2, "ForsakenThug_OnLeaveCombat")
RegisterUnitEvent(3734, 4, "ForsakenThug_OnDied")

--Foulweald Den Watcher
function FoulwealdDenWatcher_OnCombat(Unit, Event)
	Unit:RegisterEvent("FoulwealdDenWatcher_Thrash", 5000, 0)
end

function FoulwealdDenWatcher_Thrash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3391, pUnit:GetMainTank()) 
end

function FoulwealdDenWatcher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FoulwealdDenWatcher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3746, 1, "FoulwealdDenWatcher_OnCombat")
RegisterUnitEvent(3746, 2, "FoulwealdDenWatcher_OnLeaveCombat")
RegisterUnitEvent(3746, 4, "FoulwealdDenWatcher_OnDied")

--Foulweald Pathfinder
function FoulwealdPathfinder_OnCombat(Unit, Event)
	Unit:RegisterEvent("FoulwealdPathfinder_Shoot", 6000, 0)
end

function FoulwealdPathfinder_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6660, pUnit:GetMainTank()) 
end

function FoulwealdPathfinder_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FoulwealdPathfinder_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3745, 1, "FoulwealdPathfinder_OnCombat")
RegisterUnitEvent(3745, 2, "FoulwealdPathfinder_OnLeaveCombat")
RegisterUnitEvent(3745, 4, "FoulwealdPathfinder_OnDied")

--Foulweald Shaman
function FoulwealdShaman_OnCombat(Unit, Event)
	Unit:RegisterEvent("FoulwealdShaman_StrengthofEarthTotem", 2000, 1)
end

function FoulwealdShaman_StrengthofEarthTotem(pUnit, Event) 
	pUnit:CastSpell(8160) 
end

function FoulwealdShaman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FoulwealdShaman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3748, 1, "FoulwealdShaman_OnCombat")
RegisterUnitEvent(3748, 2, "FoulwealdShaman_OnLeaveCombat")
RegisterUnitEvent(3748, 4, "FoulwealdShaman_OnDied")

--Foulweald Totemic
function FoulwealdTotemic_OnCombat(Unit, Event)
	Unit:RegisterEvent("FoulwealdTotemic_SearingTotem", 2000, 1)
end

function FoulwealdTotemic_SearingTotem(pUnit, Event) 
	pUnit:CastSpell(6363) 
end

function FoulwealdTotemic_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FoulwealdTotemic_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3750, 1, "FoulwealdTotemic_OnCombat")
RegisterUnitEvent(3750, 2, "FoulwealdTotemic_OnLeaveCombat")
RegisterUnitEvent(3750, 4, "FoulwealdTotemic_OnDied")

--Foulweald Ursa
function FoulwealdUrsa_OnCombat(Unit, Event)
	Unit:RegisterEvent("FoulwealdUrsa_Hamstring", 10000, 0)
end

function FoulwealdUrsa_Hamstring(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9080, pUnit:GetMainTank()) 
end

function FoulwealdUrsa_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FoulwealdUrsa_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3749, 1, "FoulwealdUrsa_OnCombat")
RegisterUnitEvent(3749, 2, "FoulwealdUrsa_OnLeaveCombat")
RegisterUnitEvent(3749, 4, "FoulwealdUrsa_OnDied")

--Frostwave Lieutenant
function FrostwaveLieutenant_OnCombat(Unit, Event)
	Unit:RegisterEvent("FrostwaveLieutenant_FrostNova", 10000, 0)
	Unit:RegisterEvent("FrostwaveLieutenant_FrostShock", 8000, 0)
end

function FrostwaveLieutenant_FrostNova(pUnit, Event) 
	pUnit:CastSpell(122) 
end

function FrostwaveLieutenant_FrostShock(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(8056, pUnit:GetMainTank()) 
end

function FrostwaveLieutenant_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FrostwaveLieutenant_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26116, 1, "FrostwaveLieutenant_OnCombat")
RegisterUnitEvent(26116, 2, "FrostwaveLieutenant_OnLeaveCombat")
RegisterUnitEvent(26116, 4, "FrostwaveLieutenant_OnDied")

--Ghostpaw Howler
function GhostpawHowler_OnCombat(Unit, Event)
	Unit:RegisterEvent("GhostpawHowler_BloodHowl", 1000, 0)
end

function GhostpawHowler_BloodHowl(pUnit, Event) 
	pUnit:CastSpell(3264) 
end

function GhostpawHowler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GhostpawHowler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3824, 1, "GhostpawHowler_OnCombat")
RegisterUnitEvent(3824, 2, "GhostpawHowler_OnLeaveCombat")
RegisterUnitEvent(3824, 4, "GhostpawHowler_OnDied")

--Horde Deforester
function HordeDeforester_OnCombat(Unit, Event)
	Unit:RegisterEvent("HordeDeforester_SunderArmor", 6000, 0)
end

function HordeDeforester_SunderArmor(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11971, pUnit:GetMainTank()) 
end

function HordeDeforester_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HordeDeforester_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11681, 1, "HordeDeforester_OnCombat")
RegisterUnitEvent(11681, 2, "HordeDeforester_OnLeaveCombat")
RegisterUnitEvent(11681, 4, "HordeDeforester_OnDied")

--Horde Scout
function HordeScout_OnCombat(Unit, Event)
	Unit:RegisterEvent("HordeScout_ScorpidSting", 8000, 0)
	Unit:RegisterEvent("HordeScout_Shoot", 6000, 0)
end

function HordeScout_ScorpidSting(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(18545, pUnit:GetMainTank()) 
end

function HordeScout_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6660, pUnit:GetMainTank()) 
end

function HordeScout_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HordeScout_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11680, 1, "HordeScout_OnCombat")
RegisterUnitEvent(11680, 2, "HordeScout_OnLeaveCombat")
RegisterUnitEvent(11680, 4, "HordeScout_OnDied")

--Lesser Felguard
function LesserFelguard_OnCombat(Unit, Event)
	Unit:RegisterEvent("LesserFelguard_FireShieldII", 1000, 1)
	Unit:RegisterEvent("LesserFelguard_Knockdown", 7000, 0)
end

function LesserFelguard_FireShieldII(pUnit, Event) 
	pUnit:CastSpell(184) 
end

function LesserFelguard_Knockdown(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(18812, pUnit:GetMainTank()) 
end

function LesserFelguard_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LesserFelguard_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3772, 1, "LesserFelguard_OnCombat")
RegisterUnitEvent(3772, 2, "LesserFelguard_OnLeaveCombat")
RegisterUnitEvent(3772, 4, "LesserFelguard_OnDied")

--Mannoroc Lasher
function MannorocLasher_OnCombat(Unit, Event)
	Unit:RegisterEvent("MannorocLasher_ShadowBolt", 8000, 0)
end

function MannorocLasher_ShadowBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9613, pUnit:GetMainTank()) 
end

function MannorocLasher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MannorocLasher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11697, 1, "MannorocLasher_OnCombat")
RegisterUnitEvent(11697, 2, "MannorocLasher_OnLeaveCombat")
RegisterUnitEvent(11697, 4, "MannorocLasher_OnDied")

--Mist Howler
function MistHowler_OnCombat(Unit, Event)
	Unit:RegisterEvent("MistHowler_Rend", 10000, 0)
	Unit:RegisterEvent("MistHowler_TendonRip", 8000, 0)
	Unit:RegisterEvent("MistHowler_TerrifyingHowl", 11000, 0)
end

function MistHowler_Rend(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(13443, pUnit:GetMainTank()) 
end

function MistHowler_TendonRip(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3604, pUnit:GetMainTank()) 
end

function MistHowler_TerrifyingHowl(pUnit, Event) 
	pUnit:CastSpell(8715) 
end

function MistHowler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MistHowler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10644, 1, "MistHowler_OnCombat")
RegisterUnitEvent(10644, 2, "MistHowler_OnLeaveCombat")
RegisterUnitEvent(10644, 4, "MistHowler_OnDied")

--Mystlash Hydra
function MystlashHydra_OnCombat(Unit, Event)
	Unit:RegisterEvent("MystlashHydra_VenomSpit", 8000, 0)
end

function MystlashHydra_VenomSpit(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6917, pUnit:GetMainTank()) 
end

function MystlashHydra_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MystlashHydra_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3721, 1, "MystlashHydra_OnCombat")
RegisterUnitEvent(3721, 2, "MystlashHydra_OnLeaveCombat")
RegisterUnitEvent(3721, 4, "MystlashHydra_OnDied")

--Roaming Felguard
function RoamingFelguard_OnCombat(Unit, Event)
	Unit:RegisterEvent("RoamingFelguard_Knockdown", 8000, 0)
end

function RoamingFelguard_Knockdown(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11428, pUnit:GetMainTank()) 
end

function RoamingFelguard_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RoamingFelguard_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6115, 1, "RoamingFelguard_OnCombat")
RegisterUnitEvent(6115, 2, "RoamingFelguard_OnLeaveCombat")
RegisterUnitEvent(6115, 4, "RoamingFelguard_OnDied")

--Rotting Slime
function RottingSlime_OnCombat(Unit, Event)
	Unit:RegisterEvent("RottingSlime_DiseasedSlime", 10000, 0)
end

function RottingSlime_DiseasedSlime(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6907, pUnit:GetMainTank()) 
end

function RottingSlime_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RottingSlime_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3928, 1, "RottingSlime_OnCombat")
RegisterUnitEvent(3928, 2, "RottingSlime_OnLeaveCombat")
RegisterUnitEvent(3928, 4, "RottingSlime_OnDied")

--Saltspittle Muckdweller
function SaltspittleMuckdweller_OnCombat(Unit, Event)
	Unit:RegisterEvent("SaltspittleMuckdweller_Throw", 6000, 0)
end

function SaltspittleMuckdweller_Throw(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(10277, pUnit:GetMainTank()) 
end

function SaltspittleMuckdweller_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SaltspittleMuckdweller_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3740, 1, "SaltspittleMuckdweller_OnCombat")
RegisterUnitEvent(3740, 2, "SaltspittleMuckdweller_OnLeaveCombat")
RegisterUnitEvent(3740, 4, "SaltspittleMuckdweller_OnDied")

--Saltspittle Oracle
function SaltspittleOracle_OnCombat(Unit, Event)
	Unit:RegisterEvent("SaltspittleOracle_HealingWave", 12000, 0)
	Unit:RegisterEvent("SaltspittleOracle_Shock", 6000, 0)
end

function SaltspittleOracle_HealingWave(pUnit, Event) 
	pUnit:CastSpell(913) 
end

function SaltspittleOracle_Shock(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(2608, pUnit:GetMainTank()) 
end

function SaltspittleOracle_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SaltspittleOracle_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3742, 1, "SaltspittleOracle_OnCombat")
RegisterUnitEvent(3742, 2, "SaltspittleOracle_OnLeaveCombat")
RegisterUnitEvent(3742, 4, "SaltspittleOracle_OnDied")

--Saltspittle Puddlejumper
function SaltspittlePuddlejumper_OnCombat(Unit, Event)
	Unit:RegisterEvent("SaltspittlePuddlejumper_BattleStance", 1000, 1)
	Unit:RegisterEvent("SaltspittlePuddlejumper_RushingCharge", 8000, 0)
end

function SaltspittlePuddlejumper_BattleStance(pUnit, Event) 
	pUnit:CastSpell(7165) 
end

function SaltspittlePuddlejumper_RushingCharge(pUnit, Event) 
	pUnit:CastSpell(6268) 
end

function SaltspittlePuddlejumper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SaltspittlePuddlejumper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3737, 1, "SaltspittlePuddlejumper_OnCombat")
RegisterUnitEvent(3737, 2, "SaltspittlePuddlejumper_OnLeaveCombat")
RegisterUnitEvent(3737, 4, "SaltspittlePuddlejumper_OnDied")

--Saltspittle Warrior
function SaltspittleWarrior_OnCombat(Unit, Event)
	Unit:RegisterEvent("SaltspittleWarrior_DefensiveStance", 1000, 1)
	Unit:RegisterEvent("SaltspittleWarrior_ShieldBash", 8000, 0)
	Unit:RegisterEvent("SaltspittleWarrior_SunderArmor", 6000, 0)
end

function SaltspittleWarrior_DefensiveStance(pUnit, Event) 
	pUnit:CastSpell(7164) 
end

function SaltspittleWarrior_ShieldBash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(72, pUnit:GetMainTank()) 
end

function SaltspittleWarrior_SunderArmor(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(7386, pUnit:GetMainTank()) 
end

function SaltspittleWarrior_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SaltspittleWarrior_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3739, 1, "SaltspittleWarrior_OnCombat")
RegisterUnitEvent(3739, 2, "SaltspittleWarrior_OnLeaveCombat")
RegisterUnitEvent(3739, 4, "SaltspittleWarrior_OnDied")

--Severed Dreamer
function SeveredDreamer_OnCombat(Unit, Event)
	Unit:RegisterEvent("SeveredDreamer_SummonIllusionaryNightmare", 1000, 1)
end

function SeveredDreamer_SummonIllusionaryNightmare(pUnit, Event) 
	pUnit:CastSpell(6905) 
end

function SeveredDreamer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SeveredDreamer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3802, 1, "SeveredDreamer_OnCombat")
RegisterUnitEvent(3802, 2, "SeveredDreamer_OnLeaveCombat")
RegisterUnitEvent(3802, 4, "SeveredDreamer_OnDied")

--Severed Druid
function SeveredDruid_OnCombat(Unit, Event)
	Unit:RegisterEvent("SeveredDruid_Wrath", 6000, 0)
	Unit:RegisterEvent("SeveredDruid_Rejuvenation", 13000, 0)
end

function SeveredDruid_Wrath(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9739, pUnit:GetMainTank()) 
end

function SeveredDruid_Rejuvenation(pUnit, Event) 
	pUnit:CastSpell(1430) 
end

function SeveredDruid_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SeveredDruid_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3799, 1, "SeveredDruid_OnCombat")
RegisterUnitEvent(3799, 2, "SeveredDruid_OnLeaveCombat")
RegisterUnitEvent(3799, 4, "SeveredDruid_OnDied")

--Severed Sleeper
function SeveredSleeper_OnCombat(Unit, Event)
	Unit:RegisterEvent("SeveredSleeper_Sleep", 12000, 1)
end

function SeveredSleeper_Sleep(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(8399, pUnit:GetMainTank()) 
end

function SeveredSleeper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SeveredSleeper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3801, 1, "SeveredSleeper_OnCombat")
RegisterUnitEvent(3801, 2, "SeveredSleeper_OnLeaveCombat")
RegisterUnitEvent(3801, 4, "SeveredSleeper_OnDied")

--Severed Keeper
function SeveredKeeper_OnCombat(Unit, Event)
	Unit:RegisterEvent("SeveredKeeper_ManaBurn", 7000, 0)
end

function SeveredKeeper_ManaBurn(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(2691, pUnit:GetRandomPlayer(4)) 
end

function SeveredKeeper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SeveredKeeper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3803, 1, "SeveredKeeper_OnCombat")
RegisterUnitEvent(3803, 2, "SeveredKeeper_OnLeaveCombat")
RegisterUnitEvent(3803, 4, "SeveredKeeper_OnDied")

--Shadethicket Bark Ripper
function ShadethicketBarkRipper_OnCombat(Unit, Event)
	Unit:RegisterEvent("ShadethicketBarkRipper_TendonRip", 8000, 0)
end

function ShadethicketBarkRipper_TendonRip(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3604, pUnit:GetMainTank()) 
end

function ShadethicketBarkRipper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ShadethicketBarkRipper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3784, 1, "ShadethicketBarkRipper_OnCombat")
RegisterUnitEvent(3784, 2, "ShadethicketBarkRipper_OnLeaveCombat")
RegisterUnitEvent(3784, 4, "ShadethicketBarkRipper_OnDied")

--Shadethicket Raincaller
function ShadethicketRaincaller_OnCombat(Unit, Event)
	Unit:RegisterEvent("ShadethicketRaincaller_LightningBolt", 8000, 0)
	Unit:RegisterEvent("ShadethicketRaincaller_LightningCloud", 10000, 0)
end

function ShadethicketRaincaller_LightningBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9532, pUnit:GetMainTank()) 
end

function ShadethicketRaincaller_LightningCloud(pUnit, Event) 
	pUnit:CastSpell(6535) 
end

function ShadethicketRaincaller_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ShadethicketRaincaller_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3783, 1, "ShadethicketRaincaller_OnCombat")
RegisterUnitEvent(3783, 2, "ShadethicketRaincaller_OnLeaveCombat")
RegisterUnitEvent(3783, 4, "ShadethicketRaincaller_OnDied")

--Shadethicket Stone Mover
function ShadethicketStoneMover_OnCombat(Unit, Event)
	Unit:RegisterEvent("ShadethicketStoneMover_StrengthofStone", 10000, 0)
end

function ShadethicketStoneMover_StrengthofStone(pUnit, Event) 
	pUnit:CastSpell(6864) 
end

function ShadethicketStoneMover_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ShadethicketStoneMover_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3782, 1, "ShadethicketStoneMover_OnCombat")
RegisterUnitEvent(3782, 2, "ShadethicketStoneMover_OnLeaveCombat")
RegisterUnitEvent(3782, 4, "ShadethicketStoneMover_OnDied")

--Shadethicket Wood Shaper
function ShadethicketWoodShaper_OnCombat(Unit, Event)
	Unit:RegisterEvent("ShadethicketWoodShaper_EntanglingRoots", 8000, 0)
end

function ShadethicketWoodShaper_EntanglingRoots(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12747, pUnit:GetMainTank()) 
end

function ShadethicketWoodShaper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ShadethicketWoodShaper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3781, 1, "ShadethicketWoodShaper_OnCombat")
RegisterUnitEvent(3781, 2, "ShadethicketWoodShaper_OnLeaveCombat")
RegisterUnitEvent(3781, 4, "ShadethicketWoodShaper_OnDied")

--Shadowhorn Stag
function ShadowhornStag_OnCombat(Unit, Event)
	Unit:RegisterEvent("ShadowhornStag_ShadowhornCharge", 8000, 0)
end

function ShadowhornStag_ShadowhornCharge(pUnit, Event) 
	pUnit:CastSpell(6921) 
end

function ShadowhornStag_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ShadowhornStag_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3817, 1, "ShadowhornStag_OnCombat")
RegisterUnitEvent(3817, 2, "ShadowhornStag_OnLeaveCombat")
RegisterUnitEvent(3817, 4, "ShadowhornStag_OnDied")

--Silverwing Elite
function SilverwingElite_OnCombat(Unit, Event)
	Unit:RegisterEvent("SilverwingElite_Shoot", 6000, 0)
end

function SilverwingElite_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6660, pUnit:GetMainTank()) 
end

function SilverwingElite_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SilverwingElite_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14715, 1, "SilverwingElite_OnCombat")
RegisterUnitEvent(14715, 2, "SilverwingElite_OnLeaveCombat")
RegisterUnitEvent(14715, 4, "SilverwingElite_OnDied")

--Silverwing Sentinel
function SilverwingSentinel_OnCombat(Unit, Event)
	Unit:RegisterEvent("SilverwingSentinel_Shoot", 6000, 0)
end

function SilverwingSentinel_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6660, pUnit:GetMainTank()) 
end

function SilverwingSentinel_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SilverwingSentinel_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12896, 1, "SilverwingSentinel_OnCombat")
RegisterUnitEvent(12896, 2, "SilverwingSentinel_OnLeaveCombat")
RegisterUnitEvent(12896, 4, "SilverwingSentinel_OnDied")

--Silverwing Warrior
function SilverwingWarrior_OnCombat(Unit, Event)
	Unit:RegisterEvent("SilverwingWarrior_Rend", 10000, 0)
end

function SilverwingWarrior_Rend(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(13445, pUnit:GetMainTank()) 
end

function SilverwingWarrior_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SilverwingWarrior_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12897, 1, "SilverwingWarrior_OnCombat")
RegisterUnitEvent(12897, 2, "SilverwingWarrior_OnLeaveCombat")
RegisterUnitEvent(12897, 4, "SilverwingWarrior_OnDied")

--Splintertree Raider
function SplintertreeRaider_OnCombat(Unit, Event)
	Unit:RegisterEvent("SplintertreeRaider_Enrage", 10000, 0)
end

function SplintertreeRaider_Enrage(pUnit, Event) 
	pUnit:CastSpell(8599) 
end

function SplintertreeRaider_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SplintertreeRaider_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12859, 1, "SplintertreeRaider_OnCombat")
RegisterUnitEvent(12859, 2, "SplintertreeRaider_OnLeaveCombat")
RegisterUnitEvent(12859, 4, "SplintertreeRaider_OnDied")

--Terrowulf Fleshripper
function TerrowulfFleshripper_OnCombat(Unit, Event)
	Unit:RegisterEvent("TerrowulfFleshripper_TendonRip", 8000, 0)
end

function TerrowulfFleshripper_TendonRip(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3604, pUnit:GetMainTank()) 
end

function TerrowulfFleshripper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TerrowulfFleshripper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3789, 1, "TerrowulfFleshripper_OnCombat")
RegisterUnitEvent(3789, 2, "TerrowulfFleshripper_OnLeaveCombat")
RegisterUnitEvent(3789, 4, "TerrowulfFleshripper_OnDied")

--Terrowulf Shadow Weaver
function TerrowulfShadowWeaver_OnCombat(Unit, Event)
	Unit:RegisterEvent("TerrowulfShadowWeaver_VeilofShadow", 8000, 0)
end

function TerrowulfShadowWeaver_VeilofShadow(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(7068, pUnit:GetMainTank()) 
end

function TerrowulfShadowWeaver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TerrowulfShadowWeaver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3791, 1, "TerrowulfShadowWeaver_OnCombat")
RegisterUnitEvent(3791, 2, "TerrowulfShadowWeaver_OnLeaveCombat")
RegisterUnitEvent(3791, 4, "TerrowulfShadowWeaver_OnDied")

--Thistlefur Avenger
function ThistlefurAvenger_OnCombat(Unit, Event)
	Unit:RegisterEvent("ThistlefurAvenger_Vengeance", 13000, 0)
end

function ThistlefurAvenger_Vengeance(pUnit, Event) 
	pUnit:CastSpell(8602) 
end

function ThistlefurAvenger_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ThistlefurAvenger_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3925, 1, "ThistlefurAvenger_OnCombat")
RegisterUnitEvent(3925, 2, "ThistlefurAvenger_OnLeaveCombat")
RegisterUnitEvent(3925, 4, "ThistlefurAvenger_OnDied")

--Thistlefur Den Watcher
function ThistlefurDenWatcher_OnCombat(Unit, Event)
	Unit:RegisterEvent("ThistlefurDenWatcher_FrenziedRage", 8000, 0)
end

function ThistlefurDenWatcher_FrenziedRage(pUnit, Event) 
	pUnit:CastSpell(3940) 
end

function ThistlefurDenWatcher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ThistlefurDenWatcher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3923, 1, "ThistlefurDenWatcher_OnCombat")
RegisterUnitEvent(3923, 2, "ThistlefurDenWatcher_OnLeaveCombat")
RegisterUnitEvent(3923, 4, "ThistlefurDenWatcher_OnDied")

--Thistlefur Path finder
function ThistlefurPathfinder_OnCombat(Unit, Event)
	Unit:RegisterEvent("ThistlefurPathfinder_Shoot", 6000, 0)
end

function ThistlefurPathfinder_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6660, pUnit:GetMainTank()) 
end

function ThistlefurPathfinder_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ThistlefurPathfinder_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3926, 1, "ThistlefurPathfinder_OnCombat")
RegisterUnitEvent(3926, 2, "ThistlefurPathfinder_OnLeaveCombat")
RegisterUnitEvent(3926, 4, "ThistlefurPathfinder_OnDied")

--Thistlefur Shaman
function ThistlefurShaman_OnCombat(Unit, Event)
	Unit:RegisterEvent("ThistlefurShaman_Bloodlust", 2000, 2)
	Unit:RegisterEvent("ThistlefurShaman_HealingWave", 13000, 0)
end

function ThistlefurShaman_Bloodlust(pUnit, Event) 
	pUnit:CastSpell(6742) 
end

function ThistlefurShaman_HealingWave(pUnit, Event) 
	pUnit:CastSpell(11986) 
end

function ThistlefurShaman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ThistlefurShaman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3924, 1, "ThistlefurShaman_OnCombat")
RegisterUnitEvent(3924, 2, "ThistlefurShaman_OnLeaveCombat")
RegisterUnitEvent(3924, 4, "ThistlefurShaman_OnDied")

--Thistlefur Totemic
function ThistlefurTotemic_OnCombat(Unit, Event)
	Unit:RegisterEvent("ThistlefurTotemic_HealingWard", 12000, 0)
end

function ThistlefurTotemic_HealingWard(pUnit, Event) 
	pUnit:CastSpell(6274) 
end

function ThistlefurTotemic_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ThistlefurTotemic_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3922, 1, "ThistlefurTotemic_OnCombat")
RegisterUnitEvent(3922, 2, "ThistlefurTotemic_OnLeaveCombat")
RegisterUnitEvent(3922, 4, "ThistlefurTotemic_OnDied")

--Thistlefur Ursa
function ThistlefurUrsa_OnCombat(Unit, Event)
	Unit:RegisterEvent("ThistlefurUrsa_BattleStance", 1000, 1)
	Unit:RegisterEvent("ThistlefurUrsa_HeroicStrike", 6000, 0)
end

function ThistlefurUrsa_BattleStance(pUnit, Event) 
	pUnit:CastSpell(7165) 
end

function ThistlefurUrsa_HeroicStrike(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(25712, pUnit:GetMainTank()) 
end

function ThistlefurUrsa_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ThistlefurUrsa_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3921, 1, "ThistlefurUrsa_OnCombat")
RegisterUnitEvent(3921, 2, "ThistlefurUrsa_OnLeaveCombat")
RegisterUnitEvent(3921, 4, "ThistlefurUrsa_OnDied")

--Twilight Firesworn
function TwilightFiresworn_OnCombat(Unit, Event)
	Unit:RegisterEvent("TwilightFiresworn_FireShieldII", 1000, 1)
	Unit:RegisterEvent("TwilightFiresworn_Fireball", 7000, 0)
end

function TwilightFiresworn_FireShieldII(pUnit, Event) 
	pUnit:CastSpell(184) 
end

function TwilightFiresworn_Fireball(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20793, pUnit:GetMainTank()) 
end

function TwilightFiresworn_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TwilightFiresworn_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25863, 1, "TwilightFiresworn_OnCombat")
RegisterUnitEvent(25863, 2, "TwilightFiresworn_OnLeaveCombat")
RegisterUnitEvent(25863, 4, "TwilightFiresworn_OnDied")

--Twilight Speaker Viktor
function TwilightSpeakerViktor_OnCombat(Unit, Event)
	Unit:RegisterEvent("TwilightSpeakerViktor_Fireball", 7000, 0)
end

function TwilightSpeakerViktor_Fireball(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20793, pUnit:GetMainTank()) 
end

function TwilightSpeakerViktor_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TwilightSpeakerViktor_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25924, 1, "TwilightSpeakerViktor_OnCombat")
RegisterUnitEvent(25924, 2, "TwilightSpeakerViktor_OnLeaveCombat")
RegisterUnitEvent(25924, 4, "TwilightSpeakerViktor_OnDied")

--Wandering Protector
function WanderingProtector_OnCombat(Unit, Event)
	Unit:RegisterEvent("WanderingProtector_EntanglingRoots", 10000, 0)
	Unit:RegisterEvent("WanderingProtector_WarStomp", 6000, 0)
end

function WanderingProtector_EntanglingRoots(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11922, pUnit:GetMainTank()) 
end

function WanderingProtector_WarStomp(pUnit, Event) 
	pUnit:CastSpell(45) 
end

function WanderingProtector_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WanderingProtector_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12836, 1, "WanderingProtector_OnCombat")
RegisterUnitEvent(12836, 2, "WanderingProtector_OnLeaveCombat")
RegisterUnitEvent(12836, 4, "WanderingProtector_OnDied")

--Warsong Grunt
function WarsongGrunt_OnCombat(Unit, Event)
	Unit:RegisterEvent("WarsongGrunt_Cleave", 8000, 0)
	Unit:RegisterEvent("WarsongGrunt_ShieldBash", 6000, 0)
end

function WarsongGrunt_Cleave(pUnit, Event) 
	pUnit:CastSpell(15496) 
end

function WarsongGrunt_ShieldBash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11972, pUnit:GetMainTank()) 
end

function WarsongGrunt_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WarsongGrunt_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11682, 1, "WarsongGrunt_OnCombat")
RegisterUnitEvent(11682, 2, "WarsongGrunt_OnLeaveCombat")
RegisterUnitEvent(11682, 4, "WarsongGrunt_OnDied")

--Warsong Outrider
function WarsongOutrider_OnCombat(Unit, Event)
	Unit:RegisterEvent("WarsongOutrider_ScorpidSting", 8000, 0)
	Unit:RegisterEvent("WarsongOutrider_Shoot", 6000, 0)
end

function WarsongOutrider_ScorpidSting(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(18545, pUnit:GetMainTank()) 
end

function WarsongOutrider_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6660, pUnit:GetMainTank()) 
end

function WarsongOutrider_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WarsongOutrider_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12864, 1, "WarsongOutrider_OnCombat")
RegisterUnitEvent(12864, 2, "WarsongOutrider_OnLeaveCombat")
RegisterUnitEvent(12864, 4, "WarsongOutrider_OnDied")

--Warsong Shaman
function WarsongShaman_OnCombat(Unit, Event)
	Unit:RegisterEvent("WarsongShaman_Bloodlust", 2000, 2)
	Unit:RegisterEvent("WarsongShaman_LightningBolt", 13000, 0)
end

function WarsongShaman_Bloodlust(pUnit, Event) 
	pUnit:CastSpell(6742) 
end

function WarsongShaman_LightningBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20805, pUnit:GetMainTank()) 
end

function WarsongShaman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WarsongShaman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11683, 1, "WarsongShaman_OnCombat")
RegisterUnitEvent(11683, 2, "WarsongShaman_OnLeaveCombat")
RegisterUnitEvent(11683, 4, "WarsongShaman_OnDied")

--Warsong Shredder
function WarsongShredder_OnCombat(Unit, Event)
	Unit:RegisterEvent("WarsongShredder_Overdrive", 10000, 0)
end

function WarsongShredder_Overdrive(pUnit, Event) 
	pUnit:CastSpell(18546) 
end

function WarsongShredder_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WarsongShredder_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11684, 1, "WarsongShredder_OnCombat")
RegisterUnitEvent(11684, 2, "WarsongShredder_OnLeaveCombat")
RegisterUnitEvent(11684, 4, "WarsongShredder_OnDied")

--Wild Buck
function WildBuck_OnCombat(Unit, Event)
	Unit:RegisterEvent("WildBuck_RushingCharge", 8000, 0)
end

function WildBuck_RushingCharge(pUnit, Event) 
	pUnit:CastSpell(6268) 
end

function WildBuck_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WildBuck_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3816, 1, "WildBuck_OnCombat")
RegisterUnitEvent(3816, 2, "WildBuck_OnLeaveCombat")
RegisterUnitEvent(3816, 4, "WildBuck_OnDied")

--Wildthorn Lurker
function WildthornLurker_OnCombat(Unit, Event)
	Unit:RegisterEvent("WildthornLurker_Hide", 1000, 1)
end

function WildthornLurker_Hide(pUnit, Event) 
	pUnit:CastSpell(6920) 
end

function WildthornLurker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WildthornLurker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3821, 1, "WildthornLurker_OnCombat")
RegisterUnitEvent(3821, 2, "WildthornLurker_OnLeaveCombat")
RegisterUnitEvent(3821, 4, "WildthornLurker_OnDied")

--Wildthorn Stalker
function WildthornStalker_OnCombat(Unit, Event)
	Unit:RegisterEvent("WildthornStalker_Web", 10000, 0)
end

function WildthornStalker_Web(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12023, pUnit:GetMainTank()) 
end

function WildthornStalker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WildthornStalker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3819, 1, "WildthornStalker_OnCombat")
RegisterUnitEvent(3819, 2, "WildthornStalker_OnLeaveCombat")
RegisterUnitEvent(3819, 4, "WildthornStalker_OnDied")

--Wildthorn Venomspitter
function WildthornVenomspitter_OnCombat(Unit, Event)
	Unit:RegisterEvent("WildthornVenomspitter_VenomSpit", 8000, 0)
end

function WildthornVenomspitter_VenomSpit(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6917, pUnit:GetMainTank()) 
end

function WildthornVenomspitter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WildthornVenomspitter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3820, 1, "WildthornVenomspitter_OnCombat")
RegisterUnitEvent(3820, 2, "WildthornVenomspitter_OnLeaveCombat")
RegisterUnitEvent(3820, 4, "WildthornVenomspitter_OnDied")

--Withered Ancient
function WitheredAncient_OnCombat(Unit, Event)
	Unit:RegisterEvent("WitheredAncient_CurseofThorns", 8000, 0)
end

function WitheredAncient_CurseofThorns(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6909, pUnit:GetMainTank()) 
end

function WitheredAncient_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WitheredAncient_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3919, 1, "WitheredAncient_OnCombat")
RegisterUnitEvent(3919, 2, "WitheredAncient_OnLeaveCombat")
RegisterUnitEvent(3919, 4, "WitheredAncient_OnDied")

--Wrathtail Myrmidon
function WrathtailMyrmidon_OnCombat(Unit, Event)
	Unit:RegisterEvent("WrathtailMyrmidon_Rend", 8000, 0)
	Unit:RegisterEvent("WrathtailMyrmidon_Strike", 6000, 0)
end

function WrathtailMyrmidon_Rend(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11977, pUnit:GetMainTank()) 
end

function WrathtailMyrmidon_Strike(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11976, pUnit:GetMainTank()) 
end

function WrathtailMyrmidon_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WrathtailMyrmidon_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3711, 1, "WrathtailMyrmidon_OnCombat")
RegisterUnitEvent(3711, 2, "WrathtailMyrmidon_OnLeaveCombat")
RegisterUnitEvent(3711, 4, "WrathtailMyrmidon_OnDied")

--Wrathtail Priestess
function WrathtailPriestess_OnCombat(Unit, Event)
	Unit:RegisterEvent("WrathtailPriestess_Heal", 13000, 0)
	Unit:RegisterEvent("WrathtailPriestess_Sleep", 15000, 0)
end

function WrathtailPriestess_Heal(pUnit, Event) 
	pUnit:CastSpell(11642) 
end

function WrathtailPriestess_Sleep(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(15970, pUnit:GetMainTank()) 
end

function WrathtailPriestess_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WrathtailPriestess_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3944, 1, "WrathtailPriestess_OnCombat")
RegisterUnitEvent(3944, 2, "WrathtailPriestess_OnLeaveCombat")
RegisterUnitEvent(3944, 4, "WrathtailPriestess_OnDied")

--Wrathtail Razortail
function WrathtailRazortail_OnCombat(Unit, Event)
	Unit:RegisterEvent("WrathtailRazortail_PierceArmor", 10000, 0)
	Unit:RegisterEvent("WrathtailRazortail_Thorns", 2000, 2)
end

function WrathtailRazortail_PierceArmor(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6016, pUnit:GetMainTank()) 
end

function WrathtailRazortail_Thorns(pUnit, Event) 
	pUnit:CastSpell(782) 
end

function WrathtailRazortail_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WrathtailRazortail_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3712, 1, "WrathtailRazortail_OnCombat")
RegisterUnitEvent(3712, 2, "WrathtailRazortail_OnLeaveCombat")
RegisterUnitEvent(3712, 4, "WrathtailRazortail_OnDied")

--Wrathtail Sea Witch
function WrathtailSeaWitch_OnCombat(Unit, Event)
	Unit:RegisterEvent("WrathtailSeaWitch_LightningBlast", 8000, 0)
end

function WrathtailSeaWitch_LightningBlast(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(8598, pUnit:GetMainTank()) 
end

function WrathtailSeaWitch_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WrathtailSeaWitch_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3715, 1, "WrathtailSeaWitch_OnCombat")
RegisterUnitEvent(3715, 2, "WrathtailSeaWitch_OnLeaveCombat")
RegisterUnitEvent(3715, 4, "WrathtailSeaWitch_OnDied")

--Wrathtail Sorceress
function WrathtailSorceress_OnCombat(Unit, Event)
	Unit:RegisterEvent("WrathtailSorceress_Frostbolt", 7000, 0)
end

function WrathtailSorceress_Frostbolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20792, pUnit:GetMainTank()) 
end

function WrathtailSorceress_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WrathtailSorceress_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3717, 1, "WrathtailSorceress_OnCombat")
RegisterUnitEvent(3717, 2, "WrathtailSorceress_OnLeaveCombat")
RegisterUnitEvent(3717, 4, "WrathtailSorceress_OnDied")

--Xavian Betrayer
function XavianBetrayer_OnCombat(Unit, Event)
	Unit:RegisterEvent("XavianBetrayer_BattleShout", 2000, 1)
	Unit:RegisterEvent("XavianBetrayer_GiftoftheXavian", 13000, 0)
end

function XavianBetrayer_BattleShout(pUnit, Event) 
	pUnit:CastSpell(5242) 
end

function XavianBetrayer_GiftoftheXavian(pUnit, Event) 
	pUnit:CastSpell(6925) 
end

function XavianBetrayer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function XavianBetrayer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3754, 1, "XavianBetrayer_OnCombat")
RegisterUnitEvent(3754, 2, "XavianBetrayer_OnLeaveCombat")
RegisterUnitEvent(3754, 4, "XavianBetrayer_OnDied")

--Xavian Felsworn
function XavianFelsworn_OnCombat(Unit, Event)
	Unit:RegisterEvent("XavianFelsworn_Corruption", 8000, 0)
	Unit:RegisterEvent("XavianFelsworn_GiftoftheXavian", 13000, 0)
end

function XavianFelsworn_Corruption(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6223, pUnit:GetMainTank()) 
end

function XavianFelsworn_GiftoftheXavian(pUnit, Event) 
	pUnit:CastSpell(6925) 
end

function XavianFelsworn_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function XavianFelsworn_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3755, 1, "XavianFelsworn_OnCombat")
RegisterUnitEvent(3755, 2, "XavianFelsworn_OnLeaveCombat")
RegisterUnitEvent(3755, 4, "XavianFelsworn_OnDied")

--Xavian Hellcaller
function XavianHellcaller_OnCombat(Unit, Event)
	Unit:RegisterEvent("XavianHellcaller_Fireball", 8000, 0)
	Unit:RegisterEvent("XavianHellcaller_GiftoftheXavian", 13000, 0)
end

function XavianHellcaller_Fireball(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9053, pUnit:GetMainTank()) 
end

function XavianHellcaller_GiftoftheXavian(pUnit, Event) 
	pUnit:CastSpell(6925) 
end

function XavianHellcaller_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function XavianHellcaller_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3757, 1, "XavianHellcaller_OnCombat")
RegisterUnitEvent(3757, 2, "XavianHellcaller_OnLeaveCombat")
RegisterUnitEvent(3757, 4, "XavianHellcaller_OnDied")

--Xavian Rogue
function XavianRogue_OnCombat(Unit, Event)
	Unit:RegisterEvent("XavianRogue_GiftoftheXavian", 13000, 0)
end

function XavianRogue_GiftoftheXavian(pUnit, Event) 
	pUnit:CastSpell(6925) 
end

function XavianRogue_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function XavianRogue_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3752, 1, "XavianRogue_OnCombat")
RegisterUnitEvent(3752, 2, "XavianRogue_OnLeaveCombat")
RegisterUnitEvent(3752, 4, "XavianRogue_OnDied")