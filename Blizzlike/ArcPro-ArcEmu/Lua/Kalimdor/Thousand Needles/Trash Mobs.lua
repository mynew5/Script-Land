--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--Boiling Elemental
function BoilingElemental_OnCombat(Unit, Event)
	Unit:RegisterEvent("BoilingElemental_SteamJet", 15000, 0)
end

function BoilingElemental_SteamJet(Unit, Event) 
	Unit:CastSpell(11983) 
end

function BoilingElemental_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BoilingElemental_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10757, 1, "BoilingElemental_OnCombat")
RegisterUnitEvent(10757, 2, "BoilingElemental_OnLeaveCombat")
RegisterUnitEvent(10757, 4, "BoilingElemental_OnDied")

--Cloud Serpent
function CloudSerpent_OnCombat(Unit, Event)
	Unit:RegisterEvent("CloudSerpent_LightningBolt", 8000, 0)
end

function CloudSerpent_LightningBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(8246, UnitGetMainTank()) 
end

function CloudSerpent_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CloudSerpent_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4117, 1, "CloudSerpent_OnCombat")
RegisterUnitEvent(4117, 2, "CloudSerpent_OnLeaveCombat")
RegisterUnitEvent(4117, 4, "CloudSerpent_OnDied")

--Crag Stalker
function CragStalker_OnCombat(Unit, Event)
	Unit:RegisterEvent("CragStalker_SurpriseAttack", 8000, 0)
end

function CragStalker_SurpriseAttack(Unit, Event) 
	Unit:FullCastSpellOnTarget(8151, UnitGetMainTank()) 
end

function CragStalker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CragStalker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4126, 1, "CragStalker_OnCombat")
RegisterUnitEvent(4126, 2, "CragStalker_OnLeaveCombat")
RegisterUnitEvent(4126, 4, "CragStalker_OnDied")

--Deaths Head Cultist
function DeathsHeadCultist_OnCombat(Unit, Event)
	Unit:RegisterEvent("DeathsHeadCultist_DeathDecay", 15000, 0)
	Unit:RegisterEvent("DeathsHeadCultist_ShadowBolt", 8000, 0)
end

function DeathsHeadCultist_DeathDecay(Unit, Event) 
	Unit:CastSpell(11433) 
end

function DeathsHeadCultist_ShadowBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9613, UnitGetMainTank()) 
end

function DeathsHeadCultist_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DeathsHeadCultist_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7872, 1, "DeathsHeadCultist_OnCombat")
RegisterUnitEvent(7872, 2, "DeathsHeadCultist_OnLeaveCombat")
RegisterUnitEvent(7872, 4, "DeathsHeadCultist_OnDied")

--Elder Cloud Serpent
function ElderCloudSerpent_OnCombat(Unit, Event)
	Unit:RegisterEvent("ElderCloudSerpent_LightningBolt", 8000, 0)
end

function ElderCloudSerpent_LightningBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(8246, UnitGetMainTank()) 
end

function ElderCloudSerpent_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ElderCloudSerpent_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4119, 1, "ElderCloudSerpent_OnCombat")
RegisterUnitEvent(4119, 2, "ElderCloudSerpent_OnLeaveCombat")
RegisterUnitEvent(4119, 4, "ElderCloudSerpent_OnDied")

--Galak Assassin
function GalakAssassin_OnCombat(Unit, Event)
	Unit:RegisterEvent("GalakAssassin_Net", 10000, 0)
end

function GalakAssassin_Net(Unit, Event) 
	Unit:FullCastSpellOnTarget(6533, UnitGetMainTank()) 
end

function GalakAssassin_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GalakAssassin_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10720, 1, "GalakAssassin_OnCombat")
RegisterUnitEvent(10720, 2, "GalakAssassin_OnLeaveCombat")
RegisterUnitEvent(10720, 4, "GalakAssassin_OnDied")

--Galak Flame Guard
function GalakFlameGuard_OnCombat(Unit, Event)
	Unit:RegisterEvent("GalakFlameGuard_DemoralizingShout", 10000, 0)
end

function GalakFlameGuard_DemoralizingShout(Unit, Event) 
	Unit:CastSpell(13730) 
end

function GalakFlameGuard_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GalakFlameGuard_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7404, 1, "GalakFlameGuard_OnCombat")
RegisterUnitEvent(7404, 2, "GalakFlameGuard_OnLeaveCombat")
RegisterUnitEvent(7404, 4, "GalakFlameGuard_OnDied")

--Galak Marauder
function GalakMarauder_OnCombat(Unit, Event)
	Unit:RegisterEvent("GalakMarauder_RushingCharge", 7000, 0)
end

function GalakMarauder_RushingCharge(Unit, Event) 
	Unit:CastSpell(6268) 
end

function GalakMarauder_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GalakMarauder_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4099, 1, "GalakMarauder_OnCombat")
RegisterUnitEvent(4099, 2, "GalakMarauder_OnLeaveCombat")
RegisterUnitEvent(4099, 4, "GalakMarauder_OnDied")

--Galak Mauler
function GalakMauler_OnCombat(Unit, Event)
	Unit:RegisterEvent("GalakMauler_DemoralizingShout", 10000, 0)
end

function GalakMauler_DemoralizingShout(Unit, Event) 
	Unit:CastSpell(13730) 
end

function GalakMauler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GalakMauler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4095, 1, "GalakMauler_OnCombat")
RegisterUnitEvent(4095, 2, "GalakMauler_OnLeaveCombat")
RegisterUnitEvent(4095, 4, "GalakMauler_OnDied")

--Galak Scout
function GalakScout_OnCombat(Unit, Event)
	Unit:RegisterEvent("GalakScout_Shot", 6000, 0)
end

function GalakScout_Shot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, UnitGetMainTank()) 
end

function GalakScout_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GalakScout_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4094, 1, "GalakScout_OnCombat")
RegisterUnitEvent(4094, 2, "GalakScout_OnLeaveCombat")
RegisterUnitEvent(4094, 4, "GalakScout_OnDied")

--Galak Stormer
function GalakStormer_OnCombat(Unit, Event)
	Unit:RegisterEvent("GalakStormer_LightningBolt", 8000, 0)
end

function GalakStormer_LightningBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9532, UnitGetMainTank()) 
end

function GalakStormer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GalakStormer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4097, 1, "GalakStormer_OnCombat")
RegisterUnitEvent(4097, 2, "GalakStormer_OnLeaveCombat")
RegisterUnitEvent(4097, 4, "GalakStormer_OnDied")

--Galak Windchaser
function GalakWindchaser_OnCombat(Unit, Event)
	Unit:RegisterEvent("GalakWindchaser_EnvelopingWinds", 13000, 0)
	Unit:RegisterEvent("GalakWindchaser_HealingWave", 8000, 0)
end

function GalakWindchaser_EnvelopingWinds(Unit, Event) 
	Unit:FullCastSpellOnTarget(6728, UnitGetMainTank()) 
end

function GalakWindchaser_HealingWave(Unit, Event) 
	Unit:CastSpell(939) 
end

function GalakWindchaser_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GalakWindchaser_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4096, 1, "GalakWindchaser_OnCombat")
RegisterUnitEvent(4096, 2, "GalakWindchaser_OnLeaveCombat")
RegisterUnitEvent(4096, 4, "GalakWindchaser_OnDied")

--Galak Wrangler
function GalakWrangler_OnCombat(Unit, Event)
	Unit:RegisterEvent("GalakWrangler_Shot", 6000, 0)
	Unit:RegisterEvent("GalakWrangler_Net", 8000, 0)
end

function GalakWrangler_Shot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, UnitGetMainTank()) 
end

function GalakWrangler_Net(Unit, Event) 
	Unit:FullCastSpellOnTarget(6533, UnitGetMainTank()) 
end

function GalakWrangler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GalakWrangler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4093, 1, "GalakWrangler_OnCombat")
RegisterUnitEvent(4093, 2, "GalakWrangler_OnLeaveCombat")
RegisterUnitEvent(4093, 4, "GalakWrangler_OnDied")

--Gravelsnout Digger
function GravelsnoutDigger_OnCombat(Unit, Event)
	Unit:RegisterEvent("GravelsnoutDigger_SkullCrack", 8000, 0)
end

function GravelsnoutDigger_SkullCrack(Unit, Event) 
	Unit:CastSpell(3551) 
end

function GravelsnoutDigger_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GravelsnoutDigger_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4113, 1, "GravelsnoutDigger_OnCombat")
RegisterUnitEvent(4113, 2, "GravelsnoutDigger_OnLeaveCombat")
RegisterUnitEvent(4113, 4, "GravelsnoutDigger_OnDied")

--Gravelsnout Forager
function GravelsnoutForager_OnCombat(Unit, Event)
	Unit:RegisterEvent("GravelsnoutForager_CorrosiveAcid", 10000, 0)
end

function GravelsnoutForager_CorrosiveAcid(Unit, Event) 
	Unit:FullCastSpellOnTarget(8245, UnitGetMainTank()) 
end

function GravelsnoutForager_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GravelsnoutForager_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4114, 1, "GravelsnoutForager_OnCombat")
RegisterUnitEvent(4114, 2, "GravelsnoutForager_OnLeaveCombat")
RegisterUnitEvent(4114, 4, "GravelsnoutForager_OnDied")

--Gravelsnout Kobold
function GravelsnoutKobold_OnCombat(Unit, Event)
	Unit:RegisterEvent("GravelsnoutKobold_Strike", 4000, 0)
end

function GravelsnoutKobold_Strike(Unit, Event) 
	Unit:FullCastSpellOnTarget(11976, UnitGetMainTank()) 
end

function GravelsnoutKobold_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GravelsnoutKobold_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4111, 1, "GravelsnoutKobold_OnCombat")
RegisterUnitEvent(4111, 2, "GravelsnoutKobold_OnLeaveCombat")
RegisterUnitEvent(4111, 4, "GravelsnoutKobold_OnDied")

--Gravelsnout Surveyor
function GravelsnoutSurveyor_OnCombat(Unit, Event)
	Unit:RegisterEvent("GravelsnoutSurveyor_Frostbolt", 6000, 0)
end

function GravelsnoutSurveyor_Frostbolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(20806, UnitGetMainTank()) 
end

function GravelsnoutSurveyor_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GravelsnoutSurveyor_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4116, 1, "GravelsnoutSurveyor_OnCombat")
RegisterUnitEvent(4116, 2, "GravelsnoutSurveyor_OnLeaveCombat")
RegisterUnitEvent(4116, 4, "GravelsnoutSurveyor_OnDied")

--Gravelsnout Vermin
function GravelsnoutVermin_OnCombat(Unit, Event)
	Unit:RegisterEvent("GravelsnoutVermin_InfectedWound", 10000, 0)
end

function GravelsnoutVermin_InfectedWound(Unit, Event) 
	Unit:FullCastSpellOnTarget(3427, UnitGetMainTank()) 
end

function GravelsnoutVermin_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GravelsnoutVermin_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4112, 1, "GravelsnoutVermin_OnCombat")
RegisterUnitEvent(4112, 2, "GravelsnoutVermin_OnLeaveCombat")
RegisterUnitEvent(4112, 4, "GravelsnoutVermin_OnDied")

--Grimtotem Bandit
function GrimtotemBandit_OnCombat(Unit, Event)
	Unit:RegisterEvent("GrimtotemBandit_Disarm", 8000, 0)
	Unit:RegisterEvent("GrimtotemBandit_Kick", 9000, 0)
end

function GrimtotemBandit_Disarm(Unit, Event) 
	Unit:FullCastSpellOnTarget(6713, UnitGetMainTank()) 
end

function GrimtotemBandit_Kick(Unit, Event) 
	Unit:FullCastSpellOnTarget(11978, UnitGetMainTank()) 
end

function GrimtotemBandit_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GrimtotemBandit_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10758, 1, "GrimtotemBandit_OnCombat")
RegisterUnitEvent(10758, 2, "GrimtotemBandit_OnLeaveCombat")
RegisterUnitEvent(10758, 4, "GrimtotemBandit_OnDied")

--Grimtotem Geomancer
function GrimtotemGeomancer_OnCombat(Unit, Event)
	Unit:RegisterEvent("GrimtotemGeomancer_Slow", 15000, 0)
	Unit:RegisterEvent("GrimtotemGeomancer_Flamestrike", 10000, 0)
	Unit:RegisterEvent("GrimtotemGeomancer_Fireball", 5000, 0)
end

function GrimtotemGeomancer_Slow(Unit, Event) 
	Unit:FullCastSpellOnTarget(11436, UnitGetMainTank()) 
end

function GrimtotemGeomancer_Flamestrike(Unit, Event) 
	Unit:CastSpell(20813) 
end

function GrimtotemGeomancer_Fireball(Unit, Event) 
	Unit:FullCastSpellOnTarget(20811, UnitGetMainTank()) 
end

function GrimtotemGeomancer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GrimtotemGeomancer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10760, 1, "GrimtotemGeomancer_OnCombat")
RegisterUnitEvent(10760, 2, "GrimtotemGeomancer_OnLeaveCombat")
RegisterUnitEvent(10760, 4, "GrimtotemGeomancer_OnDied")

--Grimtotem Reaver
function GrimtotemReaver_OnCombat(Unit, Event)
	Unit:RegisterEvent("GrimtotemReaver_Cleave", 4000, 0)
	Unit:RegisterEvent("GrimtotemReaver_Strike", 5000, 0)
end

function GrimtotemReaver_Cleave(Unit, Event) 
	Unit:CastSpell(15496) 
end

function GrimtotemReaver_Strike(Unit, Event) 
	Unit:FullCastSpellOnTarget(11976, UnitGetMainTank()) 
end

function GrimtotemReaver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GrimtotemReaver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10761, 1, "GrimtotemReaver_OnCombat")
RegisterUnitEvent(10761, 2, "GrimtotemReaver_OnLeaveCombat")
RegisterUnitEvent(10761, 4, "GrimtotemReaver_OnDied")

--Grimtotem Stomper
function GrimtotemStomper_OnCombat(Unit, Event)
	Unit:RegisterEvent("GrimtotemStomper_EarthShock", 4000, 0)
	Unit:RegisterEvent("GrimtotemReaver_HealingWard", 8000, 0)
end

function GrimtotemStomper_EarthShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(13281, UnitGetMainTank()) 
end

function GrimtotemReaver_HealingWard(Unit, Event) 
	Unit:CastSpell(5605) 
end

function GrimtotemStomper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GrimtotemStomper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10759, 1, "GrimtotemStomper_OnCombat")
RegisterUnitEvent(10759, 2, "GrimtotemStomper_OnLeaveCombat")
RegisterUnitEvent(10759, 4, "GrimtotemStomper_OnDied")

--Highperch Consort
function HighperchConsort_OnCombat(Unit, Event)
	Unit:RegisterEvent("HighperchConsort_Poison", 12000, 0)
end

function HighperchConsort_Poison(Unit, Event) 
	Unit:FullCastSpellOnTarget(744, UnitGetMainTank()) 
end

function HighperchConsort_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HighperchConsort_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4109, 1, "HighperchConsort_OnCombat")
RegisterUnitEvent(4109, 2, "HighperchConsort_OnLeaveCombat")
RegisterUnitEvent(4109, 4, "HighperchConsort_OnDied")

--Highperch Patriarch
function HighperchPatriarch_OnCombat(Unit, Event)
	Unit:RegisterEvent("HighperchPatriarch_Poison", 12000, 0)
end

function HighperchPatriarch_Poison(Unit, Event) 
	Unit:FullCastSpellOnTarget(744, 	Unit:GetMainTank()) 
end

function HighperchPatriarch_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HighperchPatriarch_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4110, 1, "HighperchPatriarch_OnCombat")
RegisterUnitEvent(4110, 2, "HighperchPatriarch_OnLeaveCombat")
RegisterUnitEvent(4110, 4, "HighperchPatriarch_OnDied")

--Highperch Wyvern
function HighperchWyvern_OnCombat(Unit, Event)
	Unit:RegisterEvent("HighperchWyvern_Poison", 12000, 0)
end

function HighperchWyvern_Poison(Unit, Event) 
	Unit:FullCastSpellOnTarget(744, 	Unit:GetMainTank()) 
end

function HighperchWyvern_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HighperchWyvern_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4107, 1, "HighperchWyvern_OnCombat")
RegisterUnitEvent(4107, 2, "HighperchWyvern_OnLeaveCombat")
RegisterUnitEvent(4107, 4, "HighperchWyvern_OnDied")

--Pesterhide Snarler
function PesterhideSnarler_OnCombat(Unit, Event)
	Unit:RegisterEvent("PesterhideSnarler_IntimidatingGrowl", 8000, 0)
end

function PesterhideSnarler_IntimidatingGrowl(Unit, Event) 
	Unit:FullCastSpellOnTarget(6576, UnitGetMainTank()) 
end

function PesterhideSnarler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function PesterhideSnarler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4249, 1, "PesterhideSnarler_OnCombat")
RegisterUnitEvent(4249, 2, "PesterhideSnarler_OnLeaveCombat")
RegisterUnitEvent(4249, 4, "PesterhideSnarler_OnDied")

--Salt Flats Scavenger
function SaltFlatsScavenger_OnCombat(Unit, Event)
	Unit:RegisterEvent("SaltFlatsScavenger_Execute", 6000, 0)
end

function SaltFlatsScavenger_Execute(Unit, Event) 
	if(UnitGetHealthEnemy() < 20) then
		Unit:FullCastSpellOnTarget(7160, UnitGetMainTank()) 
	end
end

function SaltFlatsScavenger_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SaltFlatsScavenger_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4154, 1, "SaltFlatsScavenger_OnCombat")
RegisterUnitEvent(4154, 2, "SaltFlatsScavenger_OnLeaveCombat")
RegisterUnitEvent(4154, 4, "SaltFlatsScavenger_OnDied")

--Salt Flats Vulture
function SaltFlatsVulture_OnCombat(Unit, Event)
	Unit:RegisterEvent("SaltFlatsVulture_Execute", 6000, 0)
end

function SaltFlatsVulture_Execute(Unit, Event) 
	if(UnitGetHealthEnemy() < 20) then
		Unit:FullCastSpellOnTarget(7160, UnitGetMainTank()) 
	end
end

function SaltFlatsVulture_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SaltFlatsVulture_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4158, 1, "SaltFlatsVulture_OnCombat")
RegisterUnitEvent(4158, 2, "SaltFlatsVulture_OnLeaveCombat")
RegisterUnitEvent(4158, 4, "SaltFlatsVulture_OnDied")

--Saltstone Basilisk
function SaltstoneBasilisk_OnCombat(Unit, Event)
	Unit:RegisterEvent("SaltstoneBasilisk_CrystallineSlumber", 12000, 0)
end

function SaltstoneBasilisk_CrystallineSlumber(Unit, Event) 
	Unit:FullCastSpellOnTarget(3636, UnitGetMainTank()) 
end

function SaltstoneBasilisk_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SaltstoneBasilisk_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4147, 1, "SaltstoneBasilisk_OnCombat")
RegisterUnitEvent(4147, 2, "SaltstoneBasilisk_OnLeaveCombat")
RegisterUnitEvent(4147, 4, "SaltstoneBasilisk_OnDied")

--Saltstone Crystalhide
function SaltstoneCrystalhide_OnCombat(Unit, Event)
	Unit:RegisterEvent("SaltstoneCrystalhide_ManaBurn", 6000, 0)
end

function SaltstoneCrystalhide_ManaBurn(Unit, Event) 
	Unit:FullCastSpellOnTarget(8129, UnitGetRandomPlayer(4)) 
end

function SaltstoneCrystalhide_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SaltstoneCrystalhide_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4151, 1, "SaltstoneCrystalhide_OnCombat")
RegisterUnitEvent(4151, 2, "SaltstoneCrystalhide_OnLeaveCombat")
RegisterUnitEvent(4151, 4, "SaltstoneCrystalhide_OnDied")

--Saltstone Gazer
function SaltstoneGazer_OnCombat(Unit, Event)
	Unit:RegisterEvent("SaltstoneGazer_CrystalGaze", 12000, 0)
end

function SaltstoneGazer_CrystalGaze(Unit, Event) 
	Unit:FullCastSpellOnTarget(3635, UnitGetMainTank()) 
end

function SaltstoneGazer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SaltstoneGazer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4150, 1, "SaltstoneGazer_OnCombat")
RegisterUnitEvent(4150, 2, "SaltstoneGazer_OnLeaveCombat")
RegisterUnitEvent(4150, 4, "SaltstoneGazer_OnDied")

--Scalding Elemental
function ScaldingElemental_OnCombat(Unit, Event)
	Unit:RegisterEvent("ScaldingElemental_Scald", 10000, 0)
end

function ScaldingElemental_Scald(Unit, Event) 
	Unit:FullCastSpellOnTarget(17276, UnitGetMainTank()) 
end

function ScaldingElemental_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ScaldingElemental_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10756, 1, "ScaldingElemental_OnCombat")
RegisterUnitEvent(10756, 2, "ScaldingElemental_OnLeaveCombat")
RegisterUnitEvent(10756, 4, "ScaldingElemental_OnDied")

--Scorpid Reaver
function ScorpidReaver_OnCombat(Unit, Event)
	Unit:RegisterEvent("ScorpidReaver_Cleave", 4000, 0)
end

function ScorpidReaver_Cleave(Unit, Event) 
	Unit:CastSpell(40505) 
end

function ScorpidReaver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ScorpidReaver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4140, 1, "ScorpidReaver_OnCombat")
RegisterUnitEvent(4140, 2, "ScorpidReaver_OnLeaveCombat")
RegisterUnitEvent(4140, 4, "ScorpidReaver_OnDied")

--Scorpid Terror
function ScorpidTerror_OnCombat(Unit, Event)
	Unit:RegisterEvent("ScorpidTerror_Terrify", 10000, 0)
end

function ScorpidTerror_Terrify(Unit, Event) 
	Unit:FullCastSpellOnTarget(7399, UnitGetMainTank()) 
end

function ScorpidTerror_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ScorpidTerror_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4139, 1, "ScorpidTerror_OnCombat")
RegisterUnitEvent(4139, 2, "ScorpidTerror_OnLeaveCombat")
RegisterUnitEvent(4139, 4, "ScorpidTerror_OnDied")

--Screeching Harpy
function ScreechingHarpy_OnCombat(Unit, Event)
	Unit:RegisterEvent("ScreechingHarpy_DeafeningScreech", 10000, 0)
end

function ScreechingHarpy_DeafeningScreech(Unit, Event) 
	Unit:FullCastSpellOnTarget(3589, UnitGetMainTank()) 
end

function ScreechingHarpy_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ScreechingHarpy_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4100, 1, "ScreechingHarpy_OnCombat")
RegisterUnitEvent(4100, 2, "ScreechingHarpy_OnLeaveCombat")
RegisterUnitEvent(4100, 4, "ScreechingHarpy_OnDied")

--Screeching Roguefeather
function ScreechingRoguefeather_OnCombat(Unit, Event)
	Unit:RegisterEvent("ScreechingRoguefeather_ExploitWeakness", 5000, 0)
end

function ScreechingRoguefeather_ExploitWeakness(Unit, Event) 
	Unit:FullCastSpellOnTarget(6595, UnitGetMainTank()) 
end

function ScreechingRoguefeather_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ScreechingRoguefeather_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4101, 1, "ScreechingRoguefeather_OnCombat")
RegisterUnitEvent(4101, 2, "ScreechingRoguefeather_OnLeaveCombat")
RegisterUnitEvent(4101, 4, "ScreechingRoguefeather_OnDied")

--Screeching Windcaller
function ScreechingWindcaller_OnCombat(Unit, Event)
	Unit:RegisterEvent("ScreechingWindcaller_GustofWind", 10000, 0)
end

function ScreechingWindcaller_GustofWind(Unit, Event) 
	Unit:FullCastSpellOnTarget(6982, UnitGetMainTank()) 
end

function ScreechingWindcaller_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ScreechingWindcaller_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4104, 1, "ScreechingWindcaller_OnCombat")
RegisterUnitEvent(4104, 2, "ScreechingWindcaller_OnLeaveCombat")
RegisterUnitEvent(4104, 4, "ScreechingWindcaller_OnDied")

--Silithid Invader
function SilithidInvader_OnCombat(Unit, Event)
	Unit:RegisterEvent("SilithidInvader_PierceArmor", 10000, 0)
end

function SilithidInvader_PierceArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(6016, UnitGetMainTank()) 
end

function SilithidInvader_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SilithidInvader_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4131, 1, "SilithidInvader_OnCombat")
RegisterUnitEvent(4131, 2, "SilithidInvader_OnLeaveCombat")
RegisterUnitEvent(4131, 4, "SilithidInvader_OnDied")

--Silithid Ravager
function SilithidRavager_OnCombat(Unit, Event)
	Unit:RegisterEvent("SilithidRavager_StrongCleave", 5000, 0)
end

function SilithidRavager_StrongCleave(Unit, Event) 
	Unit:CastSpell(8255) 
end

function SilithidRavager_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SilithidRavager_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4132, 1, "SilithidRavager_OnCombat")
RegisterUnitEvent(4132, 2, "SilithidRavager_OnLeaveCombat")
RegisterUnitEvent(4132, 4, "SilithidRavager_OnDied")

--Sparkleshell Borer
function SparkleshellBorer_OnCombat(Unit, Event)
	Unit:RegisterEvent("SparkleshellBorer_PierceArmor", 10000, 0)
end

function SparkleshellBorer_PierceArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(6016, UnitGetMainTank()) 
end

function SparkleshellBorer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SparkleshellBorer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4144, 1, "SparkleshellBorer_OnCombat")
RegisterUnitEvent(4144, 2, "SparkleshellBorer_OnLeaveCombat")
RegisterUnitEvent(4144, 4, "SparkleshellBorer_OnDied")

--Sparkleshell Snapper
function SparkleshellSnapper_OnCombat(Unit, Event)
	Unit:RegisterEvent("SparkleshellSnapper_HeadButt", 10000, 0)
end

function SparkleshellSnapper_HeadButt(Unit, Event) 
	Unit:FullCastSpellOnTarget(6730, UnitGetClosestPlayer()) 
end

function SparkleshellSnapper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SparkleshellSnapper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4143, 1, "SparkleshellSnapper_OnCombat")
RegisterUnitEvent(4143, 2, "SparkleshellSnapper_OnLeaveCombat")
RegisterUnitEvent(4143, 4, "SparkleshellSnapper_OnDied")

--Thundering Boulderkin
function ThunderingBoulderkin_OnCombat(Unit, Event)
	Unit:RegisterEvent("ThunderingBoulderkin_GroundTremor", 10000, 0)
end

function ThunderingBoulderkin_GroundTremor(Unit, Event) 
	Unit:CastSpell(6524) 
end

function ThunderingBoulderkin_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ThunderingBoulderkin_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4120, 1, "ThunderingBoulderkin_OnCombat")
RegisterUnitEvent(4120, 2, "ThunderingBoulderkin_OnLeaveCombat")
RegisterUnitEvent(4120, 4, "ThunderingBoulderkin_OnDied")

--Venomous Cloud Serpent
function VenomousCloudSerpent_OnCombat(Unit, Event)
	Unit:RegisterEvent("VenomousCloudSerpent_DeadlyPoison", 10000, 0)
end

function VenomousCloudSerpent_DeadlyPoison(Unit, Event) 
	Unit:FullCastSpellOnTarget(3583, UnitGetMainTank()) 
end

function VenomousCloudSerpent_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function VenomousCloudSerpent_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4118, 1, "VenomousCloudSerpent_OnCombat")
RegisterUnitEvent(4118, 2, "VenomousCloudSerpent_OnLeaveCombat")
RegisterUnitEvent(4118, 4, "VenomousCloudSerpent_OnDied")

--Vile Sting
function VileSting_OnCombat(Unit, Event)
	Unit:RegisterEvent("VileSting_VenomSting", 10000, 0)
end

function VileSting_VenomSting(Unit, Event) 
	Unit:FullCastSpellOnTarget(8257, UnitGetMainTank()) 
end

function VileSting_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function VileSting_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5937, 1, "VileSting_OnCombat")
RegisterUnitEvent(5937, 2, "VileSting_OnLeaveCombat")
RegisterUnitEvent(5937, 4, "VileSting_OnDied")