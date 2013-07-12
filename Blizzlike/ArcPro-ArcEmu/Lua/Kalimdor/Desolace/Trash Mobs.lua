--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--Ambereye Basilisk
function AmbereyeBasilisk_OnCombat(Unit, Event)
	Unit:RegisterEvent("AmbereyeBasilisk_Petrify", 15000, 0)
end

function AmbereyeBasilisk_Petrify(Unit, Event) 
	Unit:FullCastSpellOnTarget(11020, 	Unit:GetMainTank()) 
end

function AmbereyeBasilisk_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AmbereyeBasilisk_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11785, 1, "AmbereyeBasilisk_OnCombat")
RegisterUnitEvent(11785, 2, "AmbereyeBasilisk_OnLeaveCombat")
RegisterUnitEvent(11785, 4, "AmbereyeBasilisk_OnDied")

--Ambereye Reaver
function AmbereyeReaver_OnCombat(Unit, Event)
	Unit:RegisterEvent("AmbereyeReaver_Cleave", 8000, 0)
	Unit:RegisterEvent("AmbereyeReaver_Petrify", 15000, 0)
end

function AmbereyeReaver_Cleave(Unit, Event) 
	Unit:CastSpell(40504) 
end

function AmbereyeReaver_Petrify(Unit, Event) 
	Unit:FullCastSpellOnTarget(11020, 	Unit:GetMainTank()) 
end

function AmbereyeReaver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AmbereyeReaver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11786, 1, "AmbereyeReaver_OnCombat")
RegisterUnitEvent(11786, 2, "AmbereyeReaver_OnLeaveCombat")
RegisterUnitEvent(11786, 4, "AmbereyeReaver_OnDied")

--Ambershard Crusher
function AmbershardCrusher_OnCombat(Unit, Event)
	Unit:RegisterEvent("AmbershardCrusher_CrushArmor", 5000, 1)
end

function AmbershardCrusher_CrushArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(21055, 	Unit:GetMainTank()) 
end

function AmbershardCrusher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AmbershardCrusher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11781, 1, "AmbershardCrusher_OnCombat")
RegisterUnitEvent(11781, 2, "AmbershardCrusher_OnLeaveCombat")
RegisterUnitEvent(11781, 4, "AmbershardCrusher_OnDied")

--Ambershard Destroyer
function AmbershardDestroyer_OnCombat(Unit, Event)
	Unit:RegisterEvent("AmbershardDestroyer_Boulder", 8000, 0)
	Unit:RegisterEvent("AmbershardDestroyer_EarthShock", 11000, 0)
end

function AmbershardDestroyer_Boulder(Unit, Event) 
	Unit:FullCastSpellOnTarget(19701, 	Unit:GetMainTank()) 
end

function AmbershardDestroyer_EarthShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(13728, 	Unit:GetMainTank()) 
end

function AmbershardDestroyer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AmbershardDestroyer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11782, 1, "AmbershardDestroyer_OnCombat")
RegisterUnitEvent(11782, 2, "AmbershardDestroyer_OnLeaveCombat")
RegisterUnitEvent(11782, 4, "AmbershardDestroyer_OnDied")

--Burning Blade Adept
function BurningBladeAdept_OnCombat(Unit, Event)
	Unit:RegisterEvent("BurningBladeAdept_Bloodlust", 5000, 1)
	Unit:RegisterEvent("BurningBladeAdept_Fireball", 8000, 0)
end

function BurningBladeAdept_Bloodlust(Unit, Event) 
	Unit:CastSpell(6742) 
end

function BurningBladeAdept_Fireball(Unit, Event) 
	Unit:FullCastSpellOnTarget(19816, 	Unit:GetMainTank()) 
end

function BurningBladeAdept_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BurningBladeAdept_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4665, 1, "BurningBladeAdept_OnCombat")
RegisterUnitEvent(4665, 2, "BurningBladeAdept_OnLeaveCombat")
RegisterUnitEvent(4665, 4, "BurningBladeAdept_OnDied")

--Burning Blade Augur
function BurningBladeAugur_OnCombat(Unit, Event)
	Unit:RegisterEvent("BurningBladeAugur_CurseofThorns", 5000, 1)
	Unit:RegisterEvent("BurningBladeAugur_ShadowBolt", 8000, 0)
end

function BurningBladeAugur_CurseofThorns(Unit, Event) 
	Unit:FullCastSpellOnTarget(6909, 	Unit:GetMainTank()) 
end

function BurningBladeAugur_ShadowBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(20807, 	Unit:GetMainTank()) 
end

function BurningBladeAugur_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BurningBladeAugur_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4663, 1, "BurningBladeAugur_OnCombat")
RegisterUnitEvent(4663, 2, "BurningBladeAugur_OnLeaveCombat")
RegisterUnitEvent(4663, 4, "BurningBladeAugur_OnDied")

--Burning Blade Invoker
function BurningBladeInvoker_OnCombat(Unit, Event)
	Unit:RegisterEvent("BurningBladeInvoker_FlameBuffet", 8000, 0)
end

function BurningBladeInvoker_FlameBuffet(Unit, Event) 
	Unit:FullCastSpellOnTarget(9658, 	Unit:GetMainTank()) 
end

function BurningBladeInvoker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BurningBladeInvoker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4705, 1, "BurningBladeInvoker_OnCombat")
RegisterUnitEvent(4705, 2, "BurningBladeInvoker_OnLeaveCombat")
RegisterUnitEvent(4705, 4, "BurningBladeInvoker_OnDied")

--Burning Blade Reaver
function BurningBladeReaver_OnCombat(Unit, Event)
	Unit:RegisterEvent("BurningBladeReaver_ArcingSmash", 8000, 0)
end

function BurningBladeReaver_ArcingSmash(Unit, Event) 
	Unit:CastSpell(8374) 
end

function BurningBladeReaver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BurningBladeReaver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4664, 1, "BurningBladeReaver_OnCombat")
RegisterUnitEvent(4664, 2, "BurningBladeReaver_OnLeaveCombat")
RegisterUnitEvent(4664, 4, "BurningBladeReaver_OnDied")

--Burning Blade Seer
function BurningBladeSeer_OnCombat(Unit, Event)
	Unit:RegisterEvent("BurningBladeSeer_FlameBuffet", 8000, 0)
	Unit:RegisterEvent("BurningBladeSeer_Flamestrike", 11000, 0)
end

function BurningBladeSeer_FlameBuffet(Unit, Event) 
	Unit:FullCastSpellOnTarget(9658, 	Unit:GetMainTank()) 
end

function BurningBladeSeer_Flamestrike(Unit, Event) 
	Unit:CastSpell(11829) 
end

function BurningBladeSeer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BurningBladeSeer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(13019, 1, "BurningBladeSeer_OnCombat")
RegisterUnitEvent(13019, 2, "BurningBladeSeer_OnLeaveCombat")
RegisterUnitEvent(13019, 4, "BurningBladeSeer_OnDied")

--Burning Blade Shadowmage
function BurningBladeShadowmage_OnCombat(Unit, Event)
	Unit:RegisterEvent("BurningBladeShadowmage_ShadowBolt", 8000, 0)
	Unit:RegisterEvent("BurningBladeShadowmage_ShadowShell", 10000, 0)
end

function BurningBladeShadowmage_ShadowBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(20816, 	Unit:GetMainTank()) 
end

function BurningBladeShadowmage_ShadowShell(Unit, Event) 
	Unit:CastSpell(9657) 
end

function BurningBladeShadowmage_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BurningBladeShadowmage_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4667, 1, "BurningBladeShadowmage_OnCombat")
RegisterUnitEvent(4667, 2, "BurningBladeShadowmage_OnLeaveCombat")
RegisterUnitEvent(4667, 4, "BurningBladeShadowmage_OnDied")

--Burning Blade Summoner
function BurningBladeSummoner_OnCombat(Unit, Event)
	Unit:RegisterEvent("BurningBladeSummoner_ShadowBolt", 8000, 0)
	Unit:RegisterEvent("BurningBladeSummoner_SummonImp", 5000, 1)
end

function BurningBladeSummoner_ShadowBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(20825, 	Unit:GetMainTank()) 
end

function BurningBladeSummoner_SummonImp(Unit, Event) 
	Unit:CastSpell(11939) 
end

function BurningBladeSummoner_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BurningBladeSummoner_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4668, 1, "BurningBladeSummoner_OnCombat")
RegisterUnitEvent(4668, 2, "BurningBladeSummoner_OnLeaveCombat")
RegisterUnitEvent(4668, 4, "BurningBladeSummoner_OnDied")

--Carrion Horror
function CarrionHorror_OnCombat(Unit, Event)
	Unit:RegisterEvent("CarrionHorror_InfectedWound", 5000, 2)
end

function CarrionHorror_InfectedWound(Unit, Event) 
	Unit:FullCastSpellOnTarget(3427, 	Unit:GetMainTank()) 
end

function CarrionHorror_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CarrionHorror_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4695, 1, "CarrionHorror_OnCombat")
RegisterUnitEvent(4695, 2, "CarrionHorror_OnLeaveCombat")
RegisterUnitEvent(4695, 4, "CarrionHorror_OnDied")

--Demon Spirit
function DemonSpirit_OnCombat(Unit, Event)
	Unit:RegisterEvent("DemonSpirit_SummonedDemon", 5000, 1)
end

function DemonSpirit_SummonedDemon(Unit, Event) 
	Unit:CastSpell(7741) 
end

function DemonSpirit_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DemonSpirit_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11876, 1, "DemonSpirit_OnCombat")
RegisterUnitEvent(11876, 2, "DemonSpirit_OnLeaveCombat")
RegisterUnitEvent(11876, 4, "DemonSpirit_OnDied")

--Doomwarder Captain
function DoomwarderCaptain_OnCombat(Unit, Event)
	Unit:RegisterEvent("DoomwarderCaptain_BattleShout", 5000, 1)
	Unit:RegisterEvent("DoomwarderCaptain_Ignite", 10000, 0)
end

function DoomwarderCaptain_BattleShout(Unit, Event) 
	Unit:CastSpell(6192) 
end

function DoomwarderCaptain_Ignite(Unit, Event) 
	Unit:FullCastSpellOnTarget(3261, 	Unit:GetMainTank()) 
end

function DoomwarderCaptain_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DoomwarderCaptain_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4680, 1, "DoomwarderCaptain_OnCombat")
RegisterUnitEvent(4680, 2, "DoomwarderCaptain_OnLeaveCombat")
RegisterUnitEvent(4680, 4, "DoomwarderCaptain_OnDied")

--Dread Flyer
function DreadFlyer_OnCombat(Unit, Event)
	Unit:RegisterEvent("DreadFlyer_Disarm", 10000, 0)
end

function DreadFlyer_Disarm(Unit, Event) 
	Unit:FullCastSpellOnTarget(6713, 	Unit:GetMainTank()) 
end

function DreadFlyer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DreadFlyer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4693, 1, "DreadFlyer_OnCombat")
RegisterUnitEvent(4693, 2, "DreadFlyer_OnLeaveCombat")
RegisterUnitEvent(4693, 4, "DreadFlyer_OnDied")

--Dread Ripper
function DreadRipper_OnCombat(Unit, Event)
	Unit:RegisterEvent("DreadRipper_RendFlesh", 8000, 0)
end

function DreadRipper_RendFlesh(Unit, Event) 
	Unit:FullCastSpellOnTarget(3147, Unit:GetMainTank()) 
end

function DreadRipper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DreadRipper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4694, 1, "DreadRipper_OnCombat")
RegisterUnitEvent(4694, 2, "DreadRipper_OnLeaveCombat")
RegisterUnitEvent(4694, 4, "DreadRipper_OnDied")

--Dread Swoop
function DreadSwoop_OnCombat(Unit, Event)
	Unit:RegisterEvent("DreadSwoop_Swoop", 8000, 0)
end

function DreadSwoop_Swoop(Unit, Event) 
	Unit:CastSpell(5708) 
end

function DreadSwoop_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DreadSwoop_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4692, 1, "DreadSwoop_OnCombat")
RegisterUnitEvent(4692, 2, "DreadSwoop_OnLeaveCombat")
RegisterUnitEvent(4692, 4, "DreadSwoop_OnDied")

--Drysnap Crawler
function DrysnapCrawler_OnCombat(Unit, Event)
	Unit:RegisterEvent("DrysnapCrawler_FrostArmor", 4000, 1)
	Unit:RegisterEvent("DrysnapCrawler_FrostShock", 9000, 0)
end

function DrysnapCrawler_FrostArmor(Unit, Event) 
	Unit:CastSpell(12544) 
end

function DrysnapCrawler_FrostShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(12548, Unit:GetMainTank()) 
end

function DrysnapCrawler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DrysnapCrawler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11562, 1, "DrysnapCrawler_OnCombat")
RegisterUnitEvent(11562, 2, "DrysnapCrawler_OnLeaveCombat")
RegisterUnitEvent(11562, 4, "DrysnapCrawler_OnDied")

--Drysnap Pincer
function DrysnapPincer_OnCombat(Unit, Event)
	Unit:RegisterEvent("DrysnapPincer_Rend", 10000, 0)
	Unit:RegisterEvent("DrysnapPincer_SunderArmor", 6000, 0)
end

function DrysnapPincer_Rend(Unit, Event) 
	Unit:FullCastSpellOnTarget(13443, 	Unit:GetMainTank()) 
end

function DrysnapPincer_SunderArmor(pUnit, Event) 
	Unit:FullCastSpellOnTarget(13444, 	Unit:GetMainTank()) 
end

function DrysnapPincer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DrysnapPincer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11563, 1, "DrysnapPincer_OnCombat")
RegisterUnitEvent(11563, 2, "DrysnapPincer_OnLeaveCombat")
RegisterUnitEvent(11563, 4, "DrysnapPincer_OnDied")

--Elder Thunder Lizard
function ElderThunderLizard_OnCombat(Unit, Event)
	Unit:RegisterEvent("ElderThunderLizard_LizardBolt", 8000, 0)
end

function ElderThunderLizard_LizardBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(5401, 	Unit:GetMainTank()) 
end

function ElderThunderLizard_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ElderThunderLizard_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4727, 1, "ElderThunderLizard_OnCombat")
RegisterUnitEvent(4727, 2, "ElderThunderLizard_OnLeaveCombat")
RegisterUnitEvent(4727, 4, "ElderThunderLizard_OnDied")

--Enraged Reef Crawler
function EnragedReefCrawler_OnCombat(Unit, Event)
	Unit:RegisterEvent("EnragedReefCrawler_Enrage", 10000, 1)
end

function EnragedReefCrawler_Enrage(Unit, Event) 
	Unit:CastSpell(8599) 
end

function EnragedReefCrawler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function EnragedReefCrawler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12347, 1, "EnragedReefCrawler_OnCombat")
RegisterUnitEvent(12347, 2, "EnragedReefCrawler_OnLeaveCombat")
RegisterUnitEvent(12347, 4, "EnragedReefCrawler_OnDied")

--Gelkis Earthcaller
function GelkisEarthcaller_OnCombat(Unit, Event)
	Unit:RegisterEvent("GelkisEarthcaller_Fireball", 8000, 0)
	Unit:RegisterEvent("GelkisEarthcaller_SummonGelkisRumbler", 4000, 1)
end

function GelkisEarthcaller_Fireball(Unit, Event) 
	Unit:FullCastSpellOnTarget(20815, 	Unit:GetMainTank()) 
end

function GelkisEarthcaller_SummonGelkisRumbler(Unit, Event) 
	Unit:CastSpell(9653) 
end

function GelkisEarthcaller_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GelkisEarthcaller_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4651, 1, "GelkisEarthcaller_OnCombat")
RegisterUnitEvent(4651, 2, "GelkisEarthcaller_OnLeaveCombat")
RegisterUnitEvent(4651, 4, "GelkisEarthcaller_OnDied")

--Gelkis Marauder
function GelkisMarauder_OnCombat(Unit, Event)
	Unit:RegisterEvent("GelkisMarauder_BerserkerStance", 3000, 1)
	Unit:RegisterEvent("GelkisMarauder_Cleave", 8000, 0)
end

function GelkisMarauder_BerserkerStance(Unit, Event) 
	Unit:CastSpell(7366) 
end

function GelkisMarauder_Cleave(Unit, Event) 
	Unit:CastSpell(845) 
end

function GelkisMarauder_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GelkisMarauder_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4653, 1, "GelkisMarauder_OnCombat")
RegisterUnitEvent(4653, 2, "GelkisMarauder_OnLeaveCombat")
RegisterUnitEvent(4653, 4, "GelkisMarauder_OnDied")

--Gelkis Mauler
function GelkisMauler_OnCombat(Unit, Event)
	Unit:RegisterEvent("GelkisMauler_Thrash", 5000, 0)
end

function GelkisMauler_Thrash(Unit, Event) 
	Unit:FullCastSpellOnTarget(3391, Unit:GetMainTank()) 
end

function GelkisMauler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GelkisMauler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4652, 1, "GelkisMauler_OnCombat")
RegisterUnitEvent(4652, 2, "GelkisMauler_OnLeaveCombat")
RegisterUnitEvent(4652, 4, "GelkisMauler_OnDied")

--Gelkis Scout
function GelkisScout_OnCombat(Unit, Event)
	Unit:RegisterEvent("GelkisScout_Shoot", 6000, 0)
end

function GelkisScout_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function GelkisScout_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GelkisScout_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4647, 1, "GelkisScout_OnCombat")
RegisterUnitEvent(4647, 2, "GelkisScout_OnLeaveCombat")
RegisterUnitEvent(4647, 4, "GelkisScout_OnDied")

--Gelkis Stamper
function GelkisStamper_OnCombat(Unit, Event)
	Unit:RegisterEvent("GelkisStamper_Trample", 6000, 0)
end

function GelkisStamper_Trample(Unit, Event) 
	Unit:CastSpell(5568) 
end

function GelkisStamper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GelkisStamper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4648, 1, "GelkisStamper_OnCombat")
RegisterUnitEvent(4648, 2, "GelkisStamper_OnLeaveCombat")
RegisterUnitEvent(4648, 4, "GelkisStamper_OnDied")

--Gelkis Windchaser
function GelkisWindchaser_OnCombat(Unit, Event)
	Unit:RegisterEvent("GelkisWindchaser_HealingWave", 13000, 0)
	Unit:RegisterEvent("GelkisWindchaser_LightningBolt", 8000, 0)
end

function GelkisWindchaser_HealingWave(Unit, Event) 
	Unit:CastSpell(959) 
end

function GelkisWindchaser_LightningBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9532, 	Unit:GetMainTank()) 
end

function GelkisWindchaser_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GelkisWindchaser_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4649, 1, "GelkisWindchaser_OnCombat")
RegisterUnitEvent(4649, 2, "GelkisWindchaser_OnLeaveCombat")
RegisterUnitEvent(4649, 4, "GelkisWindchaser_OnDied")

--Ghostly Marauder
function GhostlyMarauder_OnCombat(Unit, Event)
	Unit:RegisterEvent("GhostlyMarauder_Strike", 6000, 0)
end

function GhostlyMarauder_Strike(Unit, Event) 
	Unit:FullCastSpellOnTarget(11976, 	Unit:GetMainTank()) 
end

function GhostlyMarauder_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GhostlyMarauder_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11687, 1, "GhostlyMarauder_OnCombat")
RegisterUnitEvent(11687, 2, "GhostlyMarauder_OnLeaveCombat")
RegisterUnitEvent(11687, 4, "GhostlyMarauder_OnDied")

--Ghostly Raider
function GhostlyRaider_OnCombat(Unit, Event)
	Unit:RegisterEvent("GhostlyRaider_ConcussiveShot", 10000, 0)
	Unit:RegisterEvent("GhostlyRaider_Net", 11000, 0)
	Unit:RegisterEvent("GhostlyRaider_Shoot", 6000, 0)
end

function GhostlyRaider_ConcussiveShot(Unit, Event) 
	Unit:FullCastSpellOnTarget(17174, 	Unit:GetMainTank()) 
end

function GhostlyRaider_Net(Unit, Event) 
	Unit:FullCastSpellOnTarget(5533, 	Unit:GetMainTank()) 
end

function GhostlyRaider_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, 	Unit:GetMainTank()) 
end

function GhostlyRaider_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GhostlyRaider_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11686, 1, "GhostlyRaider_OnCombat")
RegisterUnitEvent(11686, 2, "GhostlyRaider_OnLeaveCombat")
RegisterUnitEvent(11686, 4, "GhostlyRaider_OnDied")

--Hatefury Betrayer
function HatefuryBetrayer_OnCombat(Unit, Event)
	Unit:RegisterEvent("HatefuryBetrayer_Enrage", 10000, 1)
end

function HatefuryBetrayer_Enrage(Unit, Event) 
	Unit:CastSpell(8599) 
end

function HatefuryBetrayer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HatefuryBetrayer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4673, 1, "HatefuryBetrayer_OnCombat")
RegisterUnitEvent(4673, 2, "HatefuryBetrayer_OnLeaveCombat")
RegisterUnitEvent(4673, 4, "HatefuryBetrayer_OnDied")

--Hatefury Felsworn
function HatefuryFelsworn_OnCombat(Unit, Event)
	Unit:RegisterEvent("HatefuryFelsworn_Enrage", 10000, 1)
end

function HatefuryFelsworn_Enrage(Unit, Event) 
	Unit:CastSpell(8599) 
end

function HatefuryFelsworn_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HatefuryFelsworn_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4672, 1, "HatefuryFelsworn_OnCombat")
RegisterUnitEvent(4672, 2, "HatefuryFelsworn_OnLeaveCombat")
RegisterUnitEvent(4672, 4, "HatefuryFelsworn_OnDied")

--Hatefury Hellcaller
function HatefuryHellcaller_OnCombat(Unit, Event)
	Unit:RegisterEvent("HatefuryHellcaller_Enrage", 10000, 1)
	Unit:RegisterEvent("HatefuryHellcaller_Immolate", 5000, 1)
	Unit:RegisterEvent("HatefuryHellcaller_RainofFire", 11000, 0)
end

function HatefuryHellcaller_Enrage(Unit, Event) 
	Unit:CastSpell(8599) 
end

function HatefuryHellcaller_Immolate(Unit, Event) 
	Unit:FullCastSpellOnTarget(1094, Unit:GetMainTank()) 
end

function HatefuryHellcaller_RainofFire(Unit, Event) 
	Unit:CastSpell(39273) 
end

function HatefuryHellcaller_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HatefuryHellcaller_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4675, 1, "HatefuryHellcaller_OnCombat")
RegisterUnitEvent(4675, 2, "HatefuryHellcaller_OnLeaveCombat")
RegisterUnitEvent(4675, 4, "HatefuryHellcaller_OnDied")

--Hatefury Rogue
function HatefuryRogue_OnCombat(Unit, Event)
	Unit:RegisterEvent("HatefuryRogue_Enrage", 10000, 1)
end

function HatefuryRogue_Enrage(Unit, Event) 
	Unit:CastSpell(8599) 
end

function HatefuryRogue_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HatefuryRogue_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4670, 1, "HatefuryRogue_OnCombat")
RegisterUnitEvent(4670, 2, "HatefuryRogue_OnLeaveCombat")
RegisterUnitEvent(4670, 4, "HatefuryRogue_OnDied")

--Hatefury Shadowstalker
function HatefuryShadowstalker_OnCombat(Unit, Event)
	Unit:RegisterEvent("HatefuryShadowstalker_Enrage", 10000, 1)
	Unit:RegisterEvent("HatefuryShadowstalker_ExploitWeakness", 11000, 0)
	Unit:RegisterEvent("HatefuryShadowstalker_Gouge", 8000, 0)
end

function HatefuryShadowstalker_Enrage(Unit, Event) 
	Unit:CastSpell(8599) 
end

function HatefuryShadowstalker_ExploitWeakness(Unit, Event) 
	Unit:FullCastSpellOnTarget(6595, Unit:GetMainTank()) 
end

function HatefuryShadowstalker_Gouge(Unit, Event) 
	Unit:FullCastSpellOnTarget(8629, Unit:GetMainTank()) 
end

function HatefuryShadowstalker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HatefuryShadowstalker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4674, 1, "HatefuryShadowstalker_OnCombat")
RegisterUnitEvent(4674, 2, "HatefuryShadowstalker_OnLeaveCombat")
RegisterUnitEvent(4674, 4, "HatefuryShadowstalker_OnDied")

--Hatefury Trickster
function HatefuryTrickster_OnCombat(Unit, Event)
	Unit:RegisterEvent("HatefuryTrickster_Enrage", 10000, 1)
	Unit:RegisterEvent("HatefuryTrickster_Poison", 8000, 1)
end

function HatefuryTrickster_Enrage(Unit, Event) 
	Unit:CastSpell(8599) 
end

function HatefuryTrickster_Poison(Unit, Event) 
	Unit:FullCastSpellOnTarget(744, Unit:GetMainTank()) 
end

function HatefuryTrickster_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HatefuryTrickster_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4671, 1, "HatefuryTrickster_OnCombat")
RegisterUnitEvent(4671, 2, "HatefuryTrickster_OnLeaveCombat")
RegisterUnitEvent(4671, 4, "HatefuryTrickster_OnDied")

--Hulking Gritjaw Basilisk
function HulkingGritjawBasilisk_OnCombat(Unit, Event)
	Unit:RegisterEvent("HulkingGritjawBasilisk_CrystallineSlumber", 15000, 1)
end

function HulkingGritjawBasilisk_CrystallineSlumber(Unit, Event) 
	Unit:FullCastSpellOnTarget(3636, Unit:GetMainTank()) 
end

function HulkingGritjawBasilisk_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HulkingGritjawBasilisk_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4729, 1, "HulkingGritjawBasilisk_OnCombat")
RegisterUnitEvent(4729, 2, "HulkingGritjawBasilisk_OnLeaveCombat")
RegisterUnitEvent(4729, 4, "HulkingGritjawBasilisk_OnDied")