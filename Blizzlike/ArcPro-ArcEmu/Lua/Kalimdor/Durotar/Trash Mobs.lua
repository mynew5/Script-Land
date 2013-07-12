--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770, Yerney; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--Bloodtalon Scythemaw
function BloodtalonScythemaw_OnCombat(Unit, Event)
	UnitRegisterEvent("BloodtalonScythemaw_RushingCharge", 8000, 0)
end

function BloodtalonScythemaw_RushingCharge(Unit, Event) 
	UnitCastSpell(6268) 
end

function BloodtalonScythemaw_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function BloodtalonScythemaw_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(3123, 1, "BloodtalonScythemaw_OnCombat")
RegisterUnitEvent(3123, 2, "BloodtalonScythemaw_OnLeaveCombat")
RegisterUnitEvent(3123, 4, "BloodtalonScythemaw_OnDied")

--Bloodtalon Taillasher
function BloodtalonTaillasher_OnCombat(Unit, Event)
	UnitRegisterEvent("BloodtalonTaillasher_RushingCharge", 8000, 0)
end

function BloodtalonTaillasher_RushingCharge(Unit, Event) 
	UnitCastSpell(6268) 
end

function BloodtalonTaillasher_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function BloodtalonTaillasher_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(3122, 1, "BloodtalonTaillasher_OnCombat")
RegisterUnitEvent(3122, 2, "BloodtalonTaillasher_OnLeaveCombat")
RegisterUnitEvent(3122, 4, "BloodtalonTaillasher_OnDied")

--Burning Blade Apprentice
function BurningBladeApprentice_OnCombat(Unit, Event)
	UnitRegisterEvent("BurningBladeApprentice_ShadowBolt", 8000, 0)
	UnitRegisterEvent("BurningBladeApprentice_SummonVoidwalker", 1000, 1)
end

function BurningBladeApprentice_ShadowBolt(Unit, Event) 
	UnitFullCastSpellOnTarget(20791, UnitGetMainTank()) 
end

function BurningBladeApprentice_SummonVoidwalker(Unit, Event) 
	UnitCastSpell(12746) 
end

function BurningBladeApprentice_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function BurningBladeApprentice_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(3198, 1, "BurningBladeApprentice_OnCombat")
RegisterUnitEvent(3198, 2, "BurningBladeApprentice_OnLeaveCombat")
RegisterUnitEvent(3198, 4, "BurningBladeApprentice_OnDied")

--Burning Blade Cultist
function BurningBladeCultist_OnCombat(Unit, Event)
	UnitRegisterEvent("BurningBladeCultist_Immolate", 8000, 0)
end

function BurningBladeCultist_Immolate(Unit, Event) 
	UnitFullCastSpellOnTarget(11962, UnitGetMainTank()) 
end

function BurningBladeCultist_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function BurningBladeCultist_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(3199, 1, "BurningBladeCultist_OnCombat")
RegisterUnitEvent(3199, 2, "BurningBladeCultist_OnLeaveCombat")
RegisterUnitEvent(3199, 4, "BurningBladeCultist_OnDied")

--Burning Blade Fanatic
function BurningBladeFanatic_OnCombat(Unit, Event)
	UnitRegisterEvent("BurningBladeFanatic_FanaticBlade", 8000, 0)
end

function BurningBladeFanatic_FanaticBlade(Unit, Event) 
	UnitCastSpell(5262) 
end

function BurningBladeFanatic_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function BurningBladeFanatic_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(3197, 1, "BurningBladeFanatic_OnCombat")
RegisterUnitEvent(3197, 2, "BurningBladeFanatic_OnLeaveCombat")
RegisterUnitEvent(3197, 4, "BurningBladeFanatic_OnDied")

--Burning Blade Neophyte
function BurningBladeNeophyte_OnCombat(Unit, Event)
	UnitRegisterEvent("BurningBladeNeophyte_Inmolate", 8000, 0)
end

function BurningBladeNeophyte_Inmolate(Unit, Event) 
	UnitFullCastSpellOnTarget(348, UnitGetMainTank()) 
end

function BurningBladeNeophyte_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function BurningBladeNeophyte_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(3196, 1, "BurningBladeNeophyte_OnCombat")
RegisterUnitEvent(3196, 2, "BurningBladeNeophyte_OnLeaveCombat")
RegisterUnitEvent(3196, 4, "BurningBladeNeophyte_OnDied")

--Corrupted Bloodtalon Scythemaw
function CorruptedBloodtalonScythemaw_OnCombat(Unit, Event)
	UnitRegisterEvent("CorruptedBloodtalonScythemaw_RushingCharge", 8000, 0)
end

function CorruptedBloodtalonScythemaw_RushingCharge(Unit, Event) 
	UnitCastSpell(6268) 
end

function CorruptedBloodtalonScythemaw_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function CorruptedBloodtalonScythemaw_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(3227, 1, "CorruptedBloodtalonScythemaw_OnCombat")
RegisterUnitEvent(3227, 2, "CorruptedBloodtalonScythemaw_OnLeaveCombat")
RegisterUnitEvent(3227, 4, "CorruptedBloodtalonScythemaw_OnDied")

--Corrupted Dreadmaw Crocolisk
function CorruptedDreadmawCrocolisk_OnCombat(Unit, Event)
	UnitRegisterEvent("CorruptedDreadmawCrocolisk_DecayedAgility", 10000, 1)
end

function CorruptedDreadmawCrocolisk_DecayedAgility(Unit, Event) 
	UnitFullCastSpellOnTarget(7901, UnitGetMainTank()) 
end

function CorruptedDreadmawCrocolisk_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function CorruptedDreadmawCrocolisk_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(3231, 1, "CorruptedDreadmawCrocolisk_OnCombat")
RegisterUnitEvent(3231, 2, "CorruptedDreadmawCrocolisk_OnLeaveCombat")
RegisterUnitEvent(3231, 4, "CorruptedDreadmawCrocolisk_OnDied")

--Corrupted Mottled Boar
function CorruptedMottledBoar_OnCombat(Unit, Event)
	UnitRegisterEvent("CorruptedMottledBoar_CorruptedIntellect", 10000, 0)
	UnitRegisterEvent("CorruptedMottledBoar_BoarCharge", 6000, 0)
end

function CorruptedMottledBoar_CorruptedIntellect(Unit, Event) 
	UnitFullCastSpellOnTarget(6818, UnitGetMainTank()) 
end

function CorruptedMottledBoar_BoarCharge(Unit, Event) 
	UnitCastSpell(3385) 
end

function CorruptedMottledBoar_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function CorruptedMottledBoar_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(3225, 1, "CorruptedMottledBoar_OnCombat")
RegisterUnitEvent(3225, 2, "CorruptedMottledBoar_OnLeaveCombat")
RegisterUnitEvent(3225, 4, "CorruptedMottledBoar_OnDied")

--Corrupted Scorpid
function CorruptedScorpid_OnCombat(Unit, Event)
	UnitRegisterEvent("CorruptedScorpid_NoxiousCatalyst", 10000, 0)
end

function CorruptedScorpid_NoxiousCatalyst(Unit, Event) 
	UnitFullCastSpellOnTarget(5413, UnitGetMainTank()) 
end

function CorruptedScorpid_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function CorruptedScorpid_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(3226, 1, "CorruptedScorpid_OnCombat")
RegisterUnitEvent(3226, 2, "CorruptedScorpid_OnLeaveCombat")
RegisterUnitEvent(3226, 4, "CorruptedScorpid_OnDied")

--Corrupted Surf Crawler
function CorruptedSurfCrawler_OnCombat(Unit, Event)
	UnitRegisterEvent("CorruptedSurfCrawler_DecayedStrength", 10000, 0)
end

function CorruptedSurfCrawler_DecayedStrength(Unit, Event) 
	UnitFullCastSpellOnTarget(6951, UnitGetMainTank()) 
end

function CorruptedSurfCrawler_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function CorruptedSurfCrawler_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(3228, 1, "CorruptedSurfCrawler_OnCombat")
RegisterUnitEvent(3228, 2, "CorruptedSurfCrawler_OnLeaveCombat")
RegisterUnitEvent(3228, 4, "CorruptedSurfCrawler_OnDied")

--Death Flayer
function DeathFlayer_OnCombat(Unit, Event)
	UnitRegisterEvent("DeathFlayer_VenomSting", 8000, 0)
end

function DeathFlayer_VenomSting(Unit, Event) 
	UnitFullCastSpellOnTarget(5416, UnitGetMainTank()) 
end

function DeathFlayer_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function DeathFlayer_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(5823, 1, "DeathFlayer_OnCombat")
RegisterUnitEvent(5823, 2, "DeathFlayer_OnLeaveCombat")
RegisterUnitEvent(5823, 4, "DeathFlayer_OnDied")

--Dire Mottled Boar
function DireMottledBoar_OnCombat(Unit, Event)
	UnitRegisterEvent("DireMottledBoar_BoarCharge", 6000, 0)
end

function DireMottledBoar_BoarCharge(Unit, Event) 
	UnitCastSpell(3385) 
end

function DireMottledBoar_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function DireMottledBoar_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(3099, 1, "DireMottledBoar_OnCombat")
RegisterUnitEvent(3099, 2, "DireMottledBoar_OnLeaveCombat")
RegisterUnitEvent(3099, 4, "DireMottledBoar_OnDied")

--Dustwind Pillager
function DustwindPillager_OnCombat(Unit, Event)
	UnitRegisterEvent("DustwindPillager_RendFlesh", 8000, 0)
end

function DustwindPillager_RendFlesh(Unit, Event) 
	UnitFullCastSpellOnTarget(3147, UnitGetMainTank()) 
end

function DustwindPillager_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function DustwindPillager_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(3116, 1, "DustwindPillager_OnCombat")
RegisterUnitEvent(3116, 2, "DustwindPillager_OnLeaveCombat")
RegisterUnitEvent(3116, 4, "DustwindPillager_OnDied")

--Dustwind Storm Witch
function DustwindStormWitch_OnCombat(Unit, Event)
	UnitRegisterEvent("DustwindStormWitch_LightningBolt", 8000, 0)
end

function DustwindStormWitch_LightningBolt(Unit, Event) 
	UnitFullCastSpellOnTarget(9532, UnitGetMainTank()) 
end

function DustwindStormWitch_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function DustwindStormWitch_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(3118, 1, "DustwindStormWitch_OnCombat")
RegisterUnitEvent(3118, 2, "DustwindStormWitch_OnLeaveCombat")
RegisterUnitEvent(3118, 4, "DustwindStormWitch_OnDied")

--Elder Mottled Boar
function ElderMottledBoar_OnCombat(Unit, Event)
	UnitRegisterEvent("ElderMottledBoar_BoarCharge", 6000, 0)
end

function ElderMottledBoar_BoarCharge(Unit, Event) 
	UnitCastSpell(3385) 
end

function ElderMottledBoar_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function ElderMottledBoar_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(3100, 1, "ElderMottledBoar_OnCombat")
RegisterUnitEvent(3100, 2, "ElderMottledBoar_OnLeaveCombat")
RegisterUnitEvent(3100, 4, "ElderMottledBoar_OnDied")

--Encrusted Surf Crawler
function EncrustedSurfCrawler_OnCombat(Unit, Event)
	UnitRegisterEvent("EncrustedSurfCrawler_QuickSidestep", 8000, 0)
end

function EncrustedSurfCrawler_QuickSidestep(Unit, Event) 
	UnitCastSpell(5426) 
end

function EncrustedSurfCrawler_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function EncrustedSurfCrawler_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(3108, 1, "EncrustedSurfCrawler_OnCombat")
RegisterUnitEvent(3108, 2, "EncrustedSurfCrawler_OnLeaveCombat")
RegisterUnitEvent(3108, 4, "EncrustedSurfCrawler_OnDied")

--Felweaver Scornn
function FelweaverScornn_OnCombat(Unit, Event)
	Unit:RegisterEvent("FelweaverScornn_ShadowBolt", 8000, 0)
end

function FelweaverScornn_ShadowBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9613, Unit:GetMainTank()) 
end

function FelweaverScornn_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FelweaverScornn_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5822, 1, "FelweaverScornn_OnCombat")
RegisterUnitEvent(5822, 2, "FelweaverScornn_OnLeaveCombat")
RegisterUnitEvent(5822, 4, "FelweaverScornn_OnDied")

--Hexed Troll
function HexedTroll_OnCombat(Unit, Event)
	Unit:RegisterEvent("HexedTroll_Inmolate", 8000, 0)
end

function HexedTroll_Inmolate(Unit, Event) 
	Unit:FullCastSpellOnTarget(348, Unit:GetMainTank()) 
end

function HexedTroll_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HexedTroll_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3207, 1, "HexedTroll_OnCombat")
RegisterUnitEvent(3207, 2, "HexedTroll_OnLeaveCombat")
RegisterUnitEvent(3207, 4, "HexedTroll_OnDied")

--Kolkar Drudge
function KolkarDrudge_OnCombat(Unit, Event)
	Unit:RegisterEvent("KolkarDrudge_DustCloud", 12000, 0)
end

function KolkarDrudge_DustCloud(Unit, Event) 
	Unit:FullCastSpellOnTarget(7272, Unit:GetMainTank()) 
end

function KolkarDrudge_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KolkarDrudge_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3119, 1, "KolkarDrudge_OnCombat")
RegisterUnitEvent(3119, 2, "KolkarDrudge_OnLeaveCombat")
RegisterUnitEvent(3119, 4, "KolkarDrudge_OnDied")

--Kolkar Outrunner
function KolkarOutrunner_OnCombat(Unit, Event)
	Unit:RegisterEvent("KolkarOutrunner_Shoot", 6000, 0)
end

function KolkarOutrunner_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function KolkarOutrunner_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KolkarOutrunner_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3120, 1, "KolkarOutrunner_OnCombat")
RegisterUnitEvent(3120, 2, "KolkarOutrunner_OnLeaveCombat")
RegisterUnitEvent(3120, 4, "KolkarOutrunner_OnDied")

--KulTiras Marine
function KulTirasMarine_OnCombat(Unit, Event)
	Unit:RegisterEvent("KulTirasMarine_ShieldBash", 6000, 0)
end

function KulTirasMarine_ShieldBash(Unit, Event) 
	Unit:FullCastSpellOnTarget(11972, Unit:GetMainTank()) 
end

function KulTirasMarine_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KulTirasMarine_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3129, 1, "KulTirasMarine_OnCombat")
RegisterUnitEvent(3129, 2, "KulTirasMarine_OnLeaveCombat")
RegisterUnitEvent(3129, 4, "KulTirasMarine_OnDied")

--KulTiras Sailor
function KulTirasSailor_OnCombat(Unit, Event)
	Unit:RegisterEvent("KulTirasSailor_RushingCharge", 8000, 0)
end

function KulTirasSailor_RushingCharge(Unit, Event) 
	Unit:CastSpell(6268) 
end

function KulTirasSailor_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KulTirasSailor_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3128, 1, "KulTirasSailor_OnCombat")
RegisterUnitEvent(3128, 2, "KulTirasSailor_OnLeaveCombat")
RegisterUnitEvent(3128, 4, "KulTirasSailor_OnDied")

--Lightning Hide
function LightningHide_OnCombat(Unit, Event)
	Unit:RegisterEvent("LightningHide_LizardBolt", 5000, 0)
end

function LightningHide_LizardBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(5401, Unit:GetMainTank()) 
end

function LightningHide_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LightningHide_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3131, 1, "LightningHide_OnCombat")
RegisterUnitEvent(3131, 2, "LightningHide_OnLeaveCombat")
RegisterUnitEvent(3131, 4, "LightningHide_OnDied")

--Makrura Snapclaw
function MakruraSnapclaw_OnCombat(Unit, Event)
	Unit:RegisterEvent("MarkuraSnapclaw_Claw",8000,0)
end

function MarkuraSnapclaw_Claw(Unit,Event)
	Unit:FullCastSpellOnTarget(5424, Unit:GetMainTank())
end

function MakruraSnapclaw_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MakruraSnapclaw_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3105, 1, "MakruraSnapclaw_OnCombat")
RegisterUnitEvent(3105, 2, "MakruraSnapclaw_OnLeaveCombat")
RegisterUnitEvent(3105, 4, "MakruraSnapclaw_OnDied")

--Mammoth Shark
function MammothShark_OnCombat(Unit, Event)
	Unit:RegisterEvent("MammothShark_Thrash", 5000, 0)
end

function MammothShark_Thrash(Unit, Event) 
	Unit:FullCastSpellOnTarget(3391, Unit:GetMainTank()) 
end

function MammothShark_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MammothShark_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12125, 1, "MammothShark_OnCombat")
RegisterUnitEvent(12125, 2, "MammothShark_OnLeaveCombat")
RegisterUnitEvent(12125, 4, "MammothShark_OnDied")

--Razormane Battleguard
function RazormaneBattleguard_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazormaneBattleguard_ImprovedBlocking", 8000, 0)
end

function RazormaneBattleguard_ImprovedBlocking(Unit, Event) 
	Unit:CastSpell(3248) 
end

function RazormaneBattleguard_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazormaneBattleguard_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3114, 1, "RazormaneBattleguard_OnCombat")
RegisterUnitEvent(3114, 2, "RazormaneBattleguard_OnLeaveCombat")
RegisterUnitEvent(3114, 4, "RazormaneBattleguard_OnDied")

--Razormane Dustrunner
function RazormaneDustrunner_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazormaneDustrunner_FaerieFire", 2000, 2)
	Unit:RegisterEvent("RazormaneDustrunner_Rejuvenation", 12000, 0)
end

function RazormaneDustrunner_FaerieFire(Unit, Event) 
	Unit:FullCastSpellOnTarget(6950, Unit:GetMainTank()) 
end

function RazormaneDustrunner_Rejuvenation(Unit, Event) 
	Unit:CastSpell(774) 
end

function RazormaneDustrunner_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazormaneDustrunner_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3113, 1, "RazormaneDustrunner_OnCombat")
RegisterUnitEvent(3113, 2, "RazormaneDustrunner_OnLeaveCombat")
RegisterUnitEvent(3113, 4, "RazormaneDustrunner_OnDied")

--Razormane Quilboar
function RazormaneQuilboar_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazormaneQuilboar_RazorMane", 2000, 2)
end

function RazormaneQuilboar_RazorMane(Unit, Event) 
	Unit:CastSpell(5280) 
end

function RazormaneQuilboar_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazormaneQuilboar_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3111, 1, "RazormaneQuilboar_OnCombat")
RegisterUnitEvent(3111, 2, "RazormaneQuilboar_OnLeaveCombat")
RegisterUnitEvent(3111, 4, "RazormaneQuilboar_OnDied")

--Razormane Scout
function RazormaneScout_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazormaneScout_Shoot", 6000, 0)
end

function RazormaneScout_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function RazormaneScout_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazormaneScout_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3112, 1, "RazormaneScout_OnCombat")
RegisterUnitEvent(3112, 2, "RazormaneScout_OnLeaveCombat")
RegisterUnitEvent(3112, 4, "RazormaneScout_OnDied")

--Thunder Lizard
function ThunderLizard_OnCombat(Unit, Event)
	Unit:RegisterEvent("ThunderLizard_LizardBolt", 5000, 0)
end

function ThunderLizard_LizardBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(5401, Unit:GetMainTank()) 
end

function ThunderLizard_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ThunderLizard_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3130, 1, "ThunderLizard_OnCombat")
RegisterUnitEvent(3130, 2, "ThunderLizard_OnLeaveCombat")
RegisterUnitEvent(3130, 4, "ThunderLizard_OnDied")

--Venomtail Scorpid
function VenomtailScorpid_OnCombat(Unit, Event)
	Unit:RegisterEvent("VenomtailScorpid_VenomSting", 10000, 0)
end

function VenomtailScorpid_VenomSting(Unit, Event) 
	Unit:FullCastSpellOnTarget(5416, Unit:GetMainTank()) 
end

function VenomtailScorpid_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function VenomtailScorpid_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3127, 1, "VenomtailScorpid_OnCombat")
RegisterUnitEvent(3127, 2, "VenomtailScorpid_OnLeaveCombat")
RegisterUnitEvent(3127, 4, "VenomtailScorpid_OnDied")

--Vile Familiar
function VileFamiliar_OnCombat(Unit, Event)
	Unit:RegisterEvent("VileFamiliar_Fireball", 8000, 0)
end

function VileFamiliar_Fireball(Unit, Event) 
	Unit:FullCastSpellOnTarget(11921, Unit:GetMainTank()) 
end

function VileFamiliar_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function VileFamiliar_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3101, 1, "VileFamiliar_OnCombat")
RegisterUnitEvent(3101, 2, "VileFamiliar_OnLeaveCombat")
RegisterUnitEvent(3101, 4, "VileFamiliar_OnDied")

--Voodoo Troll
function VoodooTroll_OnCombat(Unit, Event)
	Unit:RegisterEvent("VoodooTroll_LightningShield", 5000, 0)
	Unit:RegisterEvent("VoodooTroll_HealingWave", 12000, 0)
end

function VoodooTroll_LightningShield(Unit, Event) 
	Unit:CastSpell(324) 
end

function VoodooTroll_HealingWave(Unit, Event) 
	Unit:CastSpell(332) 
end

function VoodooTroll_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function VoodooTroll_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3206, 1, "VoodooTroll_OnCombat")
RegisterUnitEvent(3206, 2, "VoodooTroll_OnLeaveCombat")
RegisterUnitEvent(3206, 4, "VoodooTroll_OnDied")