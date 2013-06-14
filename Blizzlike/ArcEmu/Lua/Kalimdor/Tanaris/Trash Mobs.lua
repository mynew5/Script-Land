--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--Centipaar Sandreaver
function CentipaarSandreaver_OnCombat(Unit, Event)
	Unit:RegisterEvent("CentipaarSandreaver_ArcingSmash", 5000, 0)
	Unit:RegisterEvent("CentipaarSandreaver_Thrash", 6000, 0)
end

function CentipaarSandreaver_ArcingSmash(Unit, Event) 
	Unit:CastSpell(8374) 
end

function CentipaarSandreaver_Thrash(Unit, Event) 
	Unit:FullCastSpellOnTarget(3391, Unit:GetMainTank()) 
end

function CentipaarSandreaver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CentipaarSandreaver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5460, 1, "CentipaarSandreaver_OnCombat")
RegisterUnitEvent(5460, 2, "CentipaarSandreaver_OnLeaveCombat")
RegisterUnitEvent(5460, 4, "CentipaarSandreaver_OnDied")

--Centipaar Stinger
function CentipaarStinger_OnCombat(Unit, Event)
	Unit:RegisterEvent("CentipaarStinger_VenomSting", 10000, 0)
	Unit:RegisterEvent("CentipaarStinger_Thrash", 6000, 0)
end

function CentipaarStinger_VenomSting(Unit, Event) 
	Unit:FullCastSpellOnTarget(5416, Unit:GetMainTank()) 
end

function CentipaarStinger_Thrash(Unit, Event) 
	Unit:FullCastSpellOnTarget(3391, Unit:GetMainTank()) 
end

function CentipaarStinger_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CentipaarStinger_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5456, 1, "CentipaarStinger_OnCombat")
RegisterUnitEvent(5456, 2, "CentipaarStinger_OnLeaveCombat")
RegisterUnitEvent(5456, 4, "CentipaarStinger_OnDied")

--Centipaar  Swarmer
function CentipaarSwarmer_OnCombat(Unit, Event)
	Unit:RegisterEvent("CentipaarSwarmer_SilithidSwarm", 10000, 1)
	Unit:RegisterEvent("CentipaarSwarmer_Thrash", 6000, 0)
end

function CentipaarSwarmer_SilithidSwarm(Unit, Event) 
	Unit:CastSpell(6589) 
end

function CentipaarSwarmer_Thrash(Unit, Event) 
	Unit:FullCastSpellOnTarget(3391, Unit:GetMainTank()) 
end

function CentipaarSwarmer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CentipaarSwarmer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5457, 1, "CentipaarSwarmer_OnCombat")
RegisterUnitEvent(5457, 2, "CentipaarSwarmer_OnLeaveCombat")
RegisterUnitEvent(5457, 4, "CentipaarSwarmer_OnDied")

--Centipaar Tunneler
function CentipaarTunneler_OnCombat(Unit, Event)
	Unit:RegisterEvent("CentipaarTunneler_PierceArmor", 15000, 0)
	Unit:RegisterEvent("CentipaarTunneler_Thrash", 6000, 0)
end

function CentipaarTunneler_PierceArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(6016, Unit:GetMainTank()) 
end

function CentipaarTunneler_Thrash(Unit, Event) 
	Unit:FullCastSpellOnTarget(3391, Unit:GetMainTank()) 
end

function CentipaarTunneler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CentipaarTunneler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5459, 1, "CentipaarTunneler_OnCombat")
RegisterUnitEvent(5459, 2, "CentipaarTunneler_OnLeaveCombat")
RegisterUnitEvent(5459, 4, "CentipaarTunneler_OnDied")

--Centipaar Wasp
function CentipaarWasp_OnCombat(Unit, Event)
	Unit:RegisterEvent("CentipaarWasp_Poison", 10000, 0)
	Unit:RegisterEvent("CentipaarWasp_Thrash", 6000, 0)
end

function CentipaarWasp_Poison(Unit, Event) 
	Unit:FullCastSpellOnTarget(744, Unit:GetMainTank()) 
end

function CentipaarWasp_Thrash(Unit, Event) 
	Unit:FullCastSpellOnTarget(3391, Unit:GetMainTank()) 
end

function CentipaarWasp_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CentipaarWasp_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5455, 1, "CentipaarWasp_OnCombat")
RegisterUnitEvent(5455, 2, "CentipaarWasp_OnLeaveCombat")
RegisterUnitEvent(5455, 4, "CentipaarWasp_OnDied")

--Centipaar Worker
function CentipaarWorker_OnCombat(Unit, Event)
	Unit:RegisterEvent("CentipaarWorker_Thrash", 6000, 0)
end

function CentipaarWorker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CentipaarWorker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5458, 1, "CentipaarWorker_OnCombat")
RegisterUnitEvent(5458, 2, "CentipaarWorker_OnLeaveCombat")
RegisterUnitEvent(5458, 4, "CentipaarWorker_OnDied")

--Dune Smasher
function DuneSmasher_OnCombat(Unit, Event)
	Unit:RegisterEvent("DuneSmasher_HeadCrack", 10000, 0)
end

function DuneSmasher_HeadCrack(Unit, Event) 
	Unit:FullCastSpellOnTarget(9791, Unit:GetMainTank()) 
end

function DuneSmasher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DuneSmasher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5469, 1, "DuneSmasher_OnCombat")
RegisterUnitEvent(5469, 2, "DuneSmasher_OnLeaveCombat")
RegisterUnitEvent(5469, 4, "DuneSmasher_OnDied")

--Dunemaul Brute
function DunemaulBrute_OnCombat(Unit, Event)
	Unit:RegisterEvent("DunemaulBrute_Uppercut", 7000, 0)
end

function DunemaulBrute_Uppercut(Unit, Event) 
	Unit:FullCastSpellOnTarget(10966, Unit:GetMainTank()) 
end

function DunemaulBrute_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DunemaulBrute_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5474, 1, "DunemaulBrute_OnCombat")
RegisterUnitEvent(5474, 2, "DunemaulBrute_OnLeaveCombat")
RegisterUnitEvent(5474, 4, "DunemaulBrute_OnDied")

--Dunemaul Enforcer
function DunemaulEnforcer_OnCombat(Unit, Event)
	Unit:RegisterEvent("DunemaulEnforcer_DemoralizingShout", 10000, 0)
end

function DunemaulEnforcer_DemoralizingShout(Unit, Event) 
	Unit:CastSpell(13730) 
end

function DunemaulEnforcer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DunemaulEnforcer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5472, 1, "DunemaulEnforcer_OnCombat")
RegisterUnitEvent(5472, 2, "DunemaulEnforcer_OnLeaveCombat")
RegisterUnitEvent(5472, 4, "DunemaulEnforcer_OnDied")

--Dunemaul Ogre Mage
function DunemaulOgreMage_OnCombat(Unit, Event)
	Unit:RegisterEvent("DunemaulOgreMage_Bloodlust", 10000, 0)
	Unit:RegisterEvent("DunemaulOgreMage_Slow", 15000, 0)
	Unit:RegisterEvent("DunemaulOgreMage_Fireball", 5000, 0)
end

function DunemaulOgreMage_Bloodlust(Unit, Event) 
	Unit:CastSpell(6742) 
end

function DunemaulOgreMage_Slow(Unit, Event) 
	Unit:FullCastSpellOnTarget(11436, Unit:GetMainTank()) 
end

function DunemaulOgreMage_Fireball(Unit, Event) 
	Unit:FullCastSpellOnTarget(9053, Unit:GetMainTank()) 
end

function DunemaulOgreMage_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DunemaulOgreMage_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5473, 1, "DunemaulOgreMage_OnCombat")
RegisterUnitEvent(5473, 2, "DunemaulOgreMage_OnLeaveCombat")
RegisterUnitEvent(5473, 4, "DunemaulOgreMage_OnDied")

--Dunemaul Ogre
function DunemaulOgre_OnCombat(Unit, Event)
	Unit:RegisterEvent("DunemaulOgre_BattleStance", 1000, 1)
	Unit:RegisterEvent("DunemaulOgre_HeroicStrike", 4000, 0)
end

function DunemaulOgre_BattleStance(Unit, Event) 
	Unit:CastSpell(7165) 
end

function DunemaulOgre_HeroicStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(25710, Unit:GetMainTank()) 
end

function DunemaulOgre_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DunemaulOgre_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5471, 1, "DunemaulOgre_OnCombat")
RegisterUnitEvent(5471, 2, "DunemaulOgre_OnLeaveCombat")
RegisterUnitEvent(5471, 4, "DunemaulOgre_OnDied")

--Dunemaul Warlock
function DunemaulWarlock_OnCombat(Unit, Event)
	Unit:RegisterEvent("DunemaulWarlock_Shadowbolt", 8000, 0)
end

function DunemaulWarlock_Shadowbolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9613, Unit:GetMainTank()) 
end

function DunemaulWarlock_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DunemaulWarlock_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5475, 1, "DunemaulWarlock_OnCombat")
RegisterUnitEvent(5475, 2, "DunemaulWarlock_OnLeaveCombat")
RegisterUnitEvent(5475, 4, "DunemaulWarlock_OnDied")

--Fire Roc
function FireRoc_OnCombat(Unit, Event)
	Unit:RegisterEvent("FireRoc_Flamespit", 6000, 0)
end

function FireRoc_Flamespit(Unit, Event) 
	Unit:FullCastSpellOnTarget(11021, Unit:GetMainTank()) 
end

function FireRoc_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FireRoc_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5429, 1, "FireRoc_OnCombat")
RegisterUnitEvent(5429, 2, "FireRoc_OnLeaveCombat")
RegisterUnitEvent(5429, 4, "FireRoc_OnDied")

--Glasshide Basilisk
function GlasshideBasilisk_OnCombat(Unit, Event)
	Unit:RegisterEvent("GlasshideBasilisk_CrystalFlash", 12000, 2)
end

function GlasshideBasilisk_CrystalFlash(Unit, Event) 
	Unit:FullCastSpellOnTarget(5106, Unit:GetMainTank()) 
end

function GlasshideBasilisk_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GlasshideBasilisk_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5419, 1, "GlasshideBasilisk_OnCombat")
RegisterUnitEvent(5419, 2, "GlasshideBasilisk_OnLeaveCombat")
RegisterUnitEvent(5419, 4, "GlasshideBasilisk_OnDied")

--Glasshide Gazer
function GlasshideGazer_OnCombat(Unit, Event)
	Unit:RegisterEvent("GlasshideGazer_CrystalGaze", 10000, 0)
end

function GlasshideGazer_CrystalGaze(Unit, Event) 
	Unit:FullCastSpellOnTarget(3635, Unit:GetMainTank()) 
end

function GlasshideGazer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GlasshideGazer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5420, 1, "GlasshideGazer_OnCombat")
RegisterUnitEvent(5420, 2, "GlasshideGazer_OnLeaveCombat")
RegisterUnitEvent(5420, 4, "GlasshideGazer_OnDied")

--Glasshide Petrifier
function GlasshidePetrifier_OnCombat(Unit, Event)
	Unit:RegisterEvent("GlasshidePetrifier_CrystalGaze", 15000, 0)
end

function GlasshidePetrifier_CrystalGaze(Unit, Event) 
	Unit:FullCastSpellOnTarget(11020, Unit:GetMainTank()) 
end

function GlasshidePetrifier_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GlasshidePetrifier_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5421, 1, "GlasshidePetrifier_OnCombat")
RegisterUnitEvent(5421, 2, "GlasshidePetrifier_OnLeaveCombat")
RegisterUnitEvent(5421, 4, "GlasshidePetrifier_OnDied")

--Greater Firebird
function GreaterFirebird_OnCombat(Unit, Event)
	Unit:RegisterEvent("GreaterFirebird_CrimsonFury", 8000, 0)
	Unit:RegisterEvent("GreaterFirebird_FireNova", 10000, 0)
end

function GreaterFirebird_CrimsonFury(Unit, Event) 
	Unit:CastSpell(16843) 
end

function GreaterFirebird_FireNova(Unit, Event) 
	Unit:CastSpell(11970) 
end

function GreaterFirebird_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GreaterFirebird_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(8207, 1, "GreaterFirebird_OnCombat")
RegisterUnitEvent(8207, 2, "GreaterFirebird_OnLeaveCombat")
RegisterUnitEvent(8207, 4, "GreaterFirebird_OnDied")

--Gusting Vortex
function GustingVortex_OnCombat(Unit, Event)
	Unit:RegisterEvent("GustingVortex_GustofWind", 8000, 0)
end

function GustingVortex_GustofWind(Unit, Event) 
	Unit:CastSpell(6982) 
end

function GustingVortex_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GustingVortex_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(8667, 1, "GustingVortex_OnCombat")
RegisterUnitEvent(8667, 2, "GustingVortex_OnLeaveCombat")
RegisterUnitEvent(8667, 4, "GustingVortex_OnDied")

--Hazzali Sandreaver
function HazzaliSandreaver_OnCombat(Unit, Event)
	Unit:RegisterEvent("HazzaliSandreaver_ArcingSmash", 4000, 0)
end

function HazzaliSandreaver_ArcingSmash(Unit, Event) 
	Unit:CastSpell(8374) 
end

function HazzaliSandreaver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HazzaliSandreaver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5454, 1, "HazzaliSandreaver_OnCombat")
RegisterUnitEvent(5454, 2, "HazzaliSandreaver_OnLeaveCombat")
RegisterUnitEvent(5454, 4, "HazzaliSandreaver_OnDied")

--Hazzali Stinger
function HazzaliStinger_OnCombat(Unit, Event)
	Unit:RegisterEvent("HazzaliStinger_VenomSting", 10000, 0)
end

function HazzaliStinger_VenomSting(Unit, Event) 
	Unit:FullCastSpellOnTarget(5416, Unit:GetMainTank()) 
end

function HazzaliStinger_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HazzaliStinger_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5450, 1, "HazzaliStinger_OnCombat")
RegisterUnitEvent(5450, 2, "HazzaliStinger_OnLeaveCombat")
RegisterUnitEvent(5450, 4, "HazzaliStinger_OnDied")

--Hazzali Swarmer
function HazzaliSwarmer_OnCombat(Unit, Event)
	Unit:RegisterEvent("HazzaliSwarmer_SilithidSwarm", 10000, 1)
end

function HazzaliSwarmer_SilithidSwarm(Unit, Event) 
	Unit:CastSpell(6589) 
end

function HazzaliSwarmer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HazzaliSwarmer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5451, 1, "HazzaliSwarmer_OnCombat")
RegisterUnitEvent(5451, 2, "HazzaliSwarmer_OnLeaveCombat")
RegisterUnitEvent(5451, 4, "HazzaliSwarmer_OnDied")

--Hazzali Tunneler
function HazzaliTunneler_OnCombat(Unit, Event)
	Unit:RegisterEvent("HazzaliTunneler_PierceArmor", 10000, 0)
end

function HazzaliTunneler_PierceArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(6016, Unit:GetMainTank()) 
end

function HazzaliTunneler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HazzaliTunneler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5453, 1, "HazzaliTunneler_OnCombat")
RegisterUnitEvent(5453, 2, "HazzaliTunneler_OnLeaveCombat")
RegisterUnitEvent(5453, 4, "HazzaliTunneler_OnDied")

--Hazzali Wasp
function HazzaliWasp_OnCombat(Unit, Event)
	Unit:RegisterEvent("HazzaliWasp_Poison", 10000, 0)
end

function HazzaliWasp_Poison(Unit, Event) 
	Unit:FullCastSpellOnTarget(744, Unit:GetMainTank()) 
end

function HazzaliWasp_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HazzaliWasp_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5453, 1, "HazzaliWasp_OnCombat")
RegisterUnitEvent(5453, 2, "HazzaliWasp_OnLeaveCombat")
RegisterUnitEvent(5453, 4, "HazzaliWasp_OnDied")

--Land Rager
function LandRager_OnCombat(Unit, Event)
	Unit:RegisterEvent("LandRager_Enrage", 120000, 0)
end

function LandRager_Enrage(Unit, Event) 
	if(Unit:GetHealthPct() < 25) then
		Unit:CastSpell(8599) 
	end
end

function LandRager_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LandRager_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5465, 1, "LandRager_OnCombat")
RegisterUnitEvent(5465, 2, "LandRager_OnLeaveCombat")
RegisterUnitEvent(5465, 4, "LandRager_OnDied")

--Rabid Blisterpaw
function RabidBlisterpaw_OnCombat(Unit, Event)
	Unit:RegisterEvent("RabidBlisterpaw_Rabies", 10000, 1)
end

function RabidBlisterpaw_Rabies(Unit, Event) 
	Unit:FullCastSpellOnTarget(3150, Unit:GetMainTank()) 
end

function RabidBlisterpaw_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RabidBlisterpaw_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5427, 1, "RabidBlisterpaw_OnCombat")
RegisterUnitEvent(5427, 2, "RabidBlisterpaw_OnLeaveCombat")
RegisterUnitEvent(5427, 4, "RabidBlisterpaw_OnDied")

--Raging Dune Smasher
function RagingDuneSmasher_OnCombat(Unit, Event)
	Unit:RegisterEvent("RagingDuneSmasher_Enrage", 120000, 0)
end

function RagingDuneSmasher_Enrage(Unit, Event) 
	if(Unit:GetHealthPct() < 25) then
		Unit:CastSpell(8599) 
	end
end

function RagingDuneSmasher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RagingDuneSmasher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5470, 1, "RagingDuneSmasher_OnCombat")
RegisterUnitEvent(5470, 2, "RagingDuneSmasher_OnLeaveCombat")
RegisterUnitEvent(5470, 4, "RagingDuneSmasher_OnDied")

--Sandfury Axe Thrower
function SandfuryAxeThrower_OnCombat(Unit, Event)
	Unit:RegisterEvent("SandfuryAxeThrower_Throw", 4000, 0)
end

function SandfuryAxeThrower_Throw(Unit, Event) 
	Unit:FullCastSpellOnTarget(10277, Unit:GetMainTank()) 
end

function SandfuryAxeThrower_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SandfuryAxeThrower_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5646, 1, "SandfuryAxeThrower_OnCombat")
RegisterUnitEvent(5646, 2, "SandfuryAxeThrower_OnLeaveCombat")
RegisterUnitEvent(5646, 4, "SandfuryAxeThrower_OnDied")

--Sandfury Firecaller
function SandfuryFirecaller_OnCombat(Unit, Event)
	Unit:RegisterEvent("SandfuryFirecaller_Fireball", 5000, 0)
end

function SandfuryFirecaller_Fireball(Unit, Event) 
	Unit:FullCastSpellOnTarget(20823, Unit:GetMainTank()) 
end

function SandfuryFirecaller_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SandfuryFirecaller_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5647, 1, "SandfuryFirecaller_OnCombat")
RegisterUnitEvent(5647, 2, "SandfuryFirecaller_OnLeaveCombat")
RegisterUnitEvent(5647, 4, "SandfuryFirecaller_OnDied")

--Sandfury Hideskinner
function SandfuryHideskinner_OnCombat(Unit, Event)
	Unit:RegisterEvent("SandfuryHideskinner_Backstab", 4000, 0)
end

function SandfuryHideskinner_Backstab(Unit, Event) 
	Unit:FullCastSpellOnTarget(7159, Unit:GetMainTank()) 
end

function SandfuryHideskinner_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SandfuryHideskinner_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5645, 1, "SandfuryHideskinner_OnCombat")
RegisterUnitEvent(5645, 2, "SandfuryHideskinner_OnLeaveCombat")
RegisterUnitEvent(5645, 4, "SandfuryHideskinner_OnDied")

--Scorpid Duneburrower
function ScorpidDuneburrower_OnCombat(Unit, Event)
	Unit:RegisterEvent("ScorpidDuneburrower_VenomSting", 10000, 0)
end

function ScorpidDuneburrower_VenomSting(Unit, Event) 
	Unit:FullCastSpellOnTarget(5416, Unit:GetMainTank()) 
end

function ScorpidDuneburrower_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ScorpidDuneburrower_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7803, 1, "ScorpidDuneburrower_OnCombat")
RegisterUnitEvent(7803, 2, "ScorpidDuneburrower_OnLeaveCombat")
RegisterUnitEvent(7803, 4, "ScorpidDuneburrower_OnDied")

--Scorpid Dunestalker
function ScorpidDunestalker_OnCombat(Unit, Event)
	Unit:RegisterEvent("ScorpidDunestalker_VenomSting", 10000, 0)
end

function ScorpidDunestalker_VenomSting(Unit, Event) 
	Unit:FullCastSpellOnTarget(5416, Unit:GetMainTank()) 
end

function ScorpidDunestalker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ScorpidDunestalker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5424, 1, "ScorpidDunestalker_OnCombat")
RegisterUnitEvent(5424, 2, "ScorpidDunestalker_OnLeaveCombat")
RegisterUnitEvent(5424, 4, "ScorpidDunestalker_OnDied")

--Scorpid Tail Lasher
function ScorpidTailLasher_OnCombat(Unit, Event)
	Unit:RegisterEvent("ScorpidTailLasher_Lash", 8000, 0)
end

function ScorpidTailLasher_Lash(Unit, Event) 
	Unit:FullCastSpellOnTarget(6607, Unit:GetMainTank()) 
end

function ScorpidTailLasher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ScorpidTailLasher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5423, 1, "ScorpidTailLasher_OnCombat")
RegisterUnitEvent(5423, 2, "ScorpidTailLasher_OnLeaveCombat")
RegisterUnitEvent(5423, 4, "ScorpidTailLasher_OnDied")

--Southsea Dock Worker
function SouthseaDockWorker_OnCombat(Unit, Event)
	Unit:RegisterEvent("SouthseaDockWorker_HeadCrack", 10000, 0)
end

function SouthseaDockWorker_HeadCrack(Unit, Event) 
	Unit:FullCastSpellOnTarget(3148, 	Unit:GetMainTank()) 
end

function SouthseaDockWorker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SouthseaDockWorker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7857, 1, "SouthseaDockWorker_OnCombat")
RegisterUnitEvent(7857, 2, "SouthseaDockWorker_OnLeaveCombat")
RegisterUnitEvent(7857, 4, "SouthseaDockWorker_OnDied")

--Southsea Freebooter
function SouthseaFreebooter_OnCombat(Unit, Event)
	Unit:RegisterEvent("SouthseaFreebooter_Shot", 6000, 0)
end

function SouthseaFreebooter_Shot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function SouthseaFreebooter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SouthseaFreebooter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7856, 1, "SouthseaFreebooter_OnCombat")
RegisterUnitEvent(7856, 2, "SouthseaFreebooter_OnLeaveCombat")
RegisterUnitEvent(7856, 4, "SouthseaFreebooter_OnDied")

--Southsea Pirate
function SouthseaPirate_OnCombat(Unit, Event)
	Unit:RegisterEvent("SouthseaPirate_Strike", 6000, 0)
end

function SouthseaPirate_Strike(Unit, Event) 
	Unit:FullCastSpellOnTarget(11976, Unit:GetMainTank()) 
end

function SouthseaPirate_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SouthseaPirate_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7855, 1, "SouthseaPirate_OnCombat")
RegisterUnitEvent(7855, 2, "SouthseaPirate_OnLeaveCombat")
RegisterUnitEvent(7855, 4, "SouthseaPirate_OnDied")

--Southsea Swashbuckler
function SouthseaSwashbuckler_OnCombat(Unit, Event)
	Unit:RegisterEvent("SouthseaSwashbuckler_Disarm", 10000, 0)
end

function SouthseaSwashbuckler_Disarm(Unit, Event) 
	Unit:FullCastSpellOnTarget(6713, Unit:GetMainTank()) 
end

function SouthseaSwashbuckler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SouthseaSwashbuckler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7858, 1, "SouthseaSwashbuckler_OnCombat")
RegisterUnitEvent(7858, 2, "SouthseaSwashbuckler_OnLeaveCombat")
RegisterUnitEvent(7858, 4, "SouthseaSwashbuckler_OnDied")

--Thistleshrub Dew Collector
function ThistleshrubDewCollector_OnCombat(Unit, Event)
	Unit:RegisterEvent("ThistleshrubDewCollector_EntanglingRoots", 10000, 0)
end

function ThistleshrubDewCollector_EntanglingRoots(Unit, Event) 
	Unit:FullCastSpellOnTarget(11922, Unit:GetMainTank()) 
end

function ThistleshrubDewCollector_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ThistleshrubDewCollector_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5481, 1, "ThistleshrubDewCollector_OnCombat")
RegisterUnitEvent(5481, 2, "ThistleshrubDewCollector_OnLeaveCombat")
RegisterUnitEvent(5481, 4, "ThistleshrubDewCollector_OnDied")

--Thistleshrub Rootshaper
function ThistleshrubRootshaper_OnCombat(Unit, Event)
	Unit:RegisterEvent("ThistleshrubRootshaper_EarthgrabTotem", 10000, 1)
end

function ThistleshrubRootshaper_EarthgrabTotem(Unit, Event) 
	Unit:CastSpell(8376) 
end

function ThistleshrubRootshaper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ThistleshrubRootshaper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5485, 1, "ThistleshrubRootshaper_OnCombat")
RegisterUnitEvent(5485, 2, "ThistleshrubRootshaper_OnLeaveCombat")
RegisterUnitEvent(5485, 4, "ThistleshrubRootshaper_OnDied")

--Wastewander Assassin
function WastewanderAssassin_OnCombat(Unit, Event)
	Unit:RegisterEvent("WastewanderAssassin_Execute", 5000, 0)
end

function WastewanderAssassin_Execute(Unit, Event) 
	Unit:FullCastSpellOnTarget(7160, Unit:GetMainTank()) 
end

function WastewanderAssassin_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WastewanderAssassin_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5623, 1, "WastewanderAssassin_OnCombat")
RegisterUnitEvent(5623, 2, "WastewanderAssassin_OnLeaveCombat")
RegisterUnitEvent(5623, 4, "WastewanderAssassin_OnDied")

--Wastewander Bandit
function WastewanderBandit_OnCombat(Unit, Event)
	Unit:RegisterEvent("WastewanderBandit_Backstab", 5000, 0)
	Unit:RegisterEvent("WastewanderBandit_Gouge", 6000, 0)
end

function WastewanderBandit_Backstab(Unit, Event) 
	Unit:FullCastSpellOnTarget(8721, Unit:GetMainTank()) 
end

function WastewanderBandit_Gouge(Unit, Event) 
	Unit:FullCastSpellOnTarget(8629, Unit:GetMainTank()) 
end

function WastewanderBandit_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WastewanderBandit_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5618, 1, "WastewanderBandit_OnCombat")
RegisterUnitEvent(5618, 2, "WastewanderBandit_OnLeaveCombat")
RegisterUnitEvent(5618, 4, "WastewanderBandit_OnDied")

--Wastewander Rogue
function WastewanderRogue_OnCombat(Unit, Event)
	Unit:RegisterEvent("WastewanderRogue_Backstab", 5000, 0)
end

function WastewanderRogue_Backstab(Unit, Event) 
	Unit:FullCastSpellOnTarget(8721, Unit:GetMainTank()) 
end

function WastewanderRogue_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WastewanderRogue_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5615, 1, "WastewanderRogue_OnCombat")
RegisterUnitEvent(5615, 2, "WastewanderRogue_OnLeaveCombat")
RegisterUnitEvent(5615, 4, "WastewanderRogue_OnDied")

--Wastewander Shadow Mage
function WastewanderShadowMage_OnCombat(Unit, Event)
	Unit:RegisterEvent("WastewanderShadowMage_Shadowbolt", 8000, 0)
	Unit:RegisterEvent("WastewanderShadowMage_Immolate", 10000, 2)
end

function WastewanderShadowMage_Shadowbolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(20825, Unit:GetMainTank()) 
end

function WastewanderShadowMage_Immolate(Unit, Event) 
	Unit:FullCastSpellOnTarget(20826, Unit:GetMainTank()) 
end

function WastewanderShadowMage_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WastewanderShadowMage_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5617, 1, "WastewanderShadowMage_OnCombat")
RegisterUnitEvent(5617, 2, "WastewanderShadowMage_OnLeaveCombat")
RegisterUnitEvent(5617, 4, "WastewanderShadowMage_OnDied")

--Wastewander Thief
function WastewanderThief_OnCombat(Unit, Event)
	Unit:RegisterEvent("WastewanderThief_Disarm", 10000, 0)
end

function WastewanderThief_Disarm(Unit, Event) 
	Unit:FullCastSpellOnTarget(6713, Unit:GetMainTank()) 
end

function WastewanderThief_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WastewanderThief_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5616, 1, "WastewanderThief_OnCombat")
RegisterUnitEvent(5616, 2, "WastewanderThief_OnLeaveCombat")
RegisterUnitEvent(5616, 4, "WastewanderThief_OnDied")