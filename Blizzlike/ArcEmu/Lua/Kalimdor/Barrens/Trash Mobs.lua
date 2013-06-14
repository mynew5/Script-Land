--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--
function BaeldunExcavator_OnCombat(Unit, Event)
	Unit:RegisterEvent("BaeldunExcavator_DefensiveStance", 1000, 1)
	Unit:RegisterEvent("BaeldunExcavator_SunderArmor", 5000, 0)
end

function BaeldunExcavator_DefensiveStance(Unit, Event) 
	Unit:CastSpell(7164) 
end

function BaeldunExcavator_SunderArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(21081, Unit:GetMainTank()) 
end

function BaeldunExcavator_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BaeldunExcavator_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3374, 1, "BaeldunExcavator_OnCombat")
RegisterUnitEvent(3374, 2, "BaeldunExcavator_OnLeaveCombat")
RegisterUnitEvent(3374, 4, "BaeldunExcavator_OnDied")

--
function BaeldunForeman_OnCombat(Unit, Event)
	Unit:RegisterEvent("BaeldunForeman_TorchToss", 8000, 0)
end

function BaeldunForeman_TorchToss(Unit, Event) 
	Unit:FullCastSpellOnTarget(6257, Unit:GetMainTank()) 
end

function BaeldunForeman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BaeldunForeman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3375, 1, "BaeldunForeman_OnCombat")
RegisterUnitEvent(3375, 2, "BaeldunForeman_OnLeaveCombat")
RegisterUnitEvent(3375, 4, "BaeldunForeman_OnDied")

--
function BaeldunOfficer_OnCombat(Unit, Event)
	Unit:RegisterEvent("BaeldunOfficer_NimbleReflexes", 10000, 0)
	Unit:RegisterEvent("BaeldunOfficer_Thrash", 5000, 0)
end

function BaeldunOfficer_NimbleReflexes(Unit, Event) 
	Unit:CastSpell(6264) 
end

function BaeldunOfficer_Thrash(Unit, Event) 
	Unit:FullCastSpellOnTarget(3391, Unit:GetMainTank()) 
end

function BaeldunOfficer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BaeldunOfficer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3378, 1, "BaeldunOfficer_OnCombat")
RegisterUnitEvent(3378, 2, "BaeldunOfficer_OnLeaveCombat")
RegisterUnitEvent(3378, 4, "BaeldunOfficer_OnDied")

--
function BaeldunRifleman_OnCombat(Unit, Event)
	Unit:RegisterEvent("BaeldunRifleman_Shoot", 6000, 0)
end

function BaeldunRifleman_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function BaeldunRifleman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BaeldunRifleman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3377, 1, "BaeldunRifleman_OnCombat")
RegisterUnitEvent(3377, 2, "BaeldunRifleman_OnLeaveCombat")
RegisterUnitEvent(3377, 4, "BaeldunRifleman_OnDied")

--
function BarakKodobane_OnCombat(Unit, Event)
	Unit:RegisterEvent("BarakKodobane_Shoot", 6000, 0)
end

function BarakKodobane_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function BarakKodobane_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BarakKodobane_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3394, 1, "BarakKodobane_OnCombat")
RegisterUnitEvent(3394, 2, "BarakKodobane_OnLeaveCombat")
RegisterUnitEvent(3394, 4, "BarakKodobane_OnDied")

--
function BarrensKodo_OnCombat(Unit, Event)
	Unit:RegisterEvent("BarrensKodo_KodoStomp", 6000, 0)
end

function BarrensKodo_KodoStomp(Unit, Event) 
	Unit:CastSpell(6266) 
end

function BarrensKodo_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BarrensKodo_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3236, 1, "BarrensKodo_OnCombat")
RegisterUnitEvent(3236, 2, "BarrensKodo_OnLeaveCombat")
RegisterUnitEvent(3236, 4, "BarrensKodo_OnDied")

--
function BristlebackGeomancer_OnCombat(Unit, Event)
	Unit:RegisterEvent("BristlebackGeomancer_QuickFlameWard", 11000, 0)
	Unit:RegisterEvent("BristlebackGeomancer_Flamestrike", 10000, 0)
	Unit:RegisterEvent("BristlebackGeomancer_Fireball", 8000, 0)
end

function BristlebackGeomancer_QuickFlameWard(Unit, Event) 
	Unit:CastSpell(4979) 
end

function BristlebackGeomancer_Flamestrike(Unit, Event) 
	Unit:CastSpell(20794) 
end

function BristlebackGeomancer_Fireball(Unit, Event) 
	Unit:FullCastSpellOnTarget(20793, Unit:GetMainTank()) 
end

function BristlebackGeomancer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BristlebackGeomancer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3263, 1, "BristlebackGeomancer_OnCombat")
RegisterUnitEvent(3263, 2, "BristlebackGeomancer_OnLeaveCombat")
RegisterUnitEvent(3263, 4, "BristlebackGeomancer_OnDied")

--
function BristlebackHunter_OnCombat(Unit, Event)
	Unit:RegisterEvent("BristlebackHunter_Shoot", 5000, 0)
	Unit:RegisterEvent("BristlebackHunter_PoisonedShot", 1000, 1)
end

function BristlebackHunter_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function BristlebackHunter_PoisonedShot(Unit, Event) 
	Unit:FullCastSpellOnTarget(8806, Unit:GetMainTank()) 
end

function BristlebackHunter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BristlebackHunter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3258, 1, "BristlebackHunter_OnCombat")
RegisterUnitEvent(3258, 2, "BristlebackHunter_OnLeaveCombat")
RegisterUnitEvent(3258, 4, "BristlebackHunter_OnDied")

--
function BristlebackThornweaver_OnCombat(Unit, Event)
	Unit:RegisterEvent("BristlebackThornweaver_Thorns", 3000, 1)
	Unit:RegisterEvent("BristlebackThornweaver_EntanglingRoots", 12000, 0)
end

function BristlebackThornweaver_Thorns(Unit, Event) 
	Unit:CastSpell(782) 
end

function BristlebackThornweaver_EntanglingRoots(Unit, Event) 
	Unit:FullCastSpellOnTarget(12747, Unit:GetMainTank()) 
end

function BristlebackThornweaver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BristlebackThornweaver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3261, 1, "BristlebackThornweaver_OnCombat")
RegisterUnitEvent(3261, 2, "BristlebackThornweaver_OnLeaveCombat")
RegisterUnitEvent(3261, 4, "BristlebackThornweaver_OnDied")

--
function BristlebackWaterSeeker_OnCombat(Unit, Event)
	Unit:RegisterEvent("BristlebackWaterSeeker_FrostNova", 8000, 0)
end

function BristlebackWaterSeeker_FrostNova(Unit, Event) 
	Unit:CastSpell(12748) 
end

function BristlebackWaterSeeker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BristlebackWaterSeeker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3260, 1, "BristlebackWaterSeeker_OnCombat")
RegisterUnitEvent(3260, 2, "BristlebackWaterSeeker_OnLeaveCombat")
RegisterUnitEvent(3260, 4, "BristlebackWaterSeeker_OnDied")

--
function BurningBladeAcolyte_OnCombat(Unit, Event)
	Unit:RegisterEvent("BurningBladeAcolyte_CurseofAgony", 8000, 2)
	Unit:RegisterEvent("BurningBladeAcolyte_Inmolate", 3000, 2)
end

function BurningBladeAcolyte_CurseofAgony(Unit, Event) 
	Unit:FullCastSpellOnTarget(980, Unit:GetMainTank()) 
end

function BurningBladeAcolyte_Inmolate(Unit, Event) 
	Unit:FullCastSpellOnTarget(707, Unit:GetMainTank()) 
end

function BurningBladeAcolyte_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BurningBladeAcolyte_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3380, 1, "BurningBladeAcolyte_OnCombat")
RegisterUnitEvent(3380, 2, "BurningBladeAcolyte_OnLeaveCombat")
RegisterUnitEvent(3380, 4, "BurningBladeAcolyte_OnDied")

--
function BurningBladeToxicologist_OnCombat(Unit, Event)
	Unit:RegisterEvent("BurningBladeToxicologist_CurseofAgony", 8000, 2)
	Unit:RegisterEvent("BurningBladeToxicologist_Inmolate", 3000, 2)
end

function BurningBladeToxicologist_CurseofAgony(Unit, Event) 
	Unit:FullCastSpellOnTarget(980, Unit:GetMainTank()) 
end

function BurningBladeToxicologist_Inmolate(Unit, Event) 
	Unit:FullCastSpellOnTarget(707, Unit:GetMainTank()) 
end

function BurningBladeToxicologist_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BurningBladeToxicologist_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12319, 1, "BurningBladeToxicologist_OnCombat")
RegisterUnitEvent(12319, 2, "BurningBladeToxicologist_OnLeaveCombat")
RegisterUnitEvent(12319, 4, "BurningBladeToxicologist_OnDied")

--
function CorruptedDreadmawCrocolisk_OnCombat(Unit, Event)
	Unit:RegisterEvent("CorruptedDreadmawCrocolisk_DecayedAgility", 10000, 1)
end

function CorruptedDreadmawCrocolisk_DecayedAgility(Unit, Event) 
	Unit:FullCastSpellOnTarget(7901, Unit:GetMainTank()) 
end

function CorruptedDreadmawCrocolisk_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CorruptedDreadmawCrocolisk_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3231, 1, "CorruptedDreadmawCrocolisk_OnCombat")
RegisterUnitEvent(3231, 2, "CorruptedDreadmawCrocolisk_OnLeaveCombat")
RegisterUnitEvent(3231, 4, "CorruptedDreadmawCrocolisk_OnDied")

--
function DiggerFlameforge_OnCombat(Unit, Event)
	Unit:RegisterEvent("DiggerFlameforge_Backhand", 8000, 0)
	Unit:RegisterEvent("DiggerFlameforge_ThrowDynamite", 12000, 0)
end

function DiggerFlameforge_Backhand(Unit, Event) 
	Unit:FullCastSpellOnTarget(6253, Unit:GetMainTank()) 
end

function DiggerFlameforge_ThrowDynamite(Unit, Event) 
	Unit:CastSpell(7978) 
end

function DiggerFlameforge_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DiggerFlameforge_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5849, 1, "DiggerFlameforge_OnCombat")
RegisterUnitEvent(5849, 2, "DiggerFlameforge_OnLeaveCombat")
RegisterUnitEvent(5849, 4, "DiggerFlameforge_OnDied")

--
function DreadmawCrocolisk_OnCombat(Unit, Event)
	Unit:RegisterEvent("DreadmawCrocolisk_MuscleTear", 8000, 0)
end

function DreadmawCrocolisk_MuscleTear(Unit, Event) 
	Unit:FullCastSpellOnTarget(12166, Unit:GetMainTank()) 
end

function DreadmawCrocolisk_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DreadmawCrocolisk_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3110, 1, "DreadmawCrocolisk_OnCombat")
RegisterUnitEvent(3110, 2, "DreadmawCrocolisk_OnLeaveCombat")
RegisterUnitEvent(3110, 4, "DreadmawCrocolisk_OnDied")

--
function ElderMysticRazorsnout_OnCombat(Unit, Event)
	Unit:RegisterEvent("ElderMysticRazorsnout_EarthbindTotem", 4000, 1)
	Unit:RegisterEvent("ElderMysticRazorsnout_HealingWave", 12000, 0)
end

function ElderMysticRazorsnout_EarthbindTotem(Unit, Event) 
	Unit:CastSpell(2484) 
end

function ElderMysticRazorsnout_HealingWave(Unit, Event) 
	Unit:CastSpell(547) 
end

function ElderMysticRazorsnout_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ElderMysticRazorsnout_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3270, 1, "ElderMysticRazorsnout_OnCombat")
RegisterUnitEvent(3270, 2, "ElderMysticRazorsnout_OnLeaveCombat")
RegisterUnitEvent(3270, 4, "ElderMysticRazorsnout_OnDied")

--
function GreaterBarrensKodo_OnCombat(Unit, Event)
	Unit:RegisterEvent("GreaterBarrensKodo_RushingCharge", 8000, 0)
end

function GreaterBarrensKodo_RushingCharge(Unit, Event) 
	Unit:CastSpell(6268) 
end

function GreaterBarrensKodo_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GreaterBarrensKodo_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3235, 1, "GreaterBarrensKodo_OnCombat")
RegisterUnitEvent(3235, 2, "GreaterBarrensKodo_OnLeaveCombat")
RegisterUnitEvent(3235, 4, "GreaterBarrensKodo_OnDied")

--
function GreaterThunderhawk_OnCombat(Unit, Event)
	Unit:RegisterEvent("GreaterThunderhawk_ThunderClap", 10000, 0)
end

function GreaterThunderhawk_ThunderClap(Unit, Event) 
	Unit:CastSpell(8078) 
end

function GreaterThunderhawk_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GreaterThunderhawk_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3249, 1, "GreaterThunderhawk_OnCombat")
RegisterUnitEvent(3249, 2, "GreaterThunderhawk_OnLeaveCombat")
RegisterUnitEvent(3249, 4, "GreaterThunderhawk_OnDied")

--
function KolkarBloodcharger_OnCombat(Unit, Event)
	Unit:RegisterEvent("KolkarBloodcharger_Bloodlust", 4000, 1)
	Unit:RegisterEvent("KolkarBloodcharger_Corruption", 10000, 0)
end

function KolkarBloodcharger_Bloodlust(Unit, Event) 
	Unit:CastSpell(6742) 
end

function KolkarBloodcharger_Corruption(Unit, Event) 
	Unit:FullCastSpellOnTarget(172, Unit:GetMainTank()) 
end

function KolkarBloodcharger_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KolkarBloodcharger_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3397, 1, "KolkarBloodcharger_OnCombat")
RegisterUnitEvent(3397, 2, "KolkarBloodcharger_OnLeaveCombat")
RegisterUnitEvent(3397, 4, "KolkarBloodcharger_OnDied")

--
function KolkarInvader_OnCombat(Unit, Event)
	Unit:RegisterEvent("KolkarInvader_FlingTorch", 2000, 1)
	Unit:RegisterEvent("KolkarInvader_RushingCharge", 8000, 0)
	Unit:RegisterEvent("KolkarInvader_Strike", 6000, 0)
	Unit:RegisterEvent("KolkarInvader_Tetanus", 4000, 1)
end

function KolkarInvader_FlingTorch(Unit, Event) 
	Unit:CastSpell(14292) 
end

function KolkarInvader_RushingCharge(Unit, Event) 
	Unit:CastSpell(6268) 
end

function KolkarInvader_Strike(Unit, Event) 
	Unit:FullCastSpellOnTarget(11976, Unit:GetMainTank()) 
end

function KolkarInvader_Tetanus(Unit, Event) 
	Unit:FullCastSpellOnTarget(8014, Unit:GetMainTank()) 
end

function KolkarInvader_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KolkarInvader_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(9524, 1, "KolkarInvader_OnCombat")
RegisterUnitEvent(9524, 2, "KolkarInvader_OnLeaveCombat")
RegisterUnitEvent(9524, 4, "KolkarInvader_OnDied")

--
function KolkarMarauder_OnCombat(Unit, Event)
	Unit:RegisterEvent("KolkarMarauder_Strike", 6000, 0)
end

function KolkarMarauder_Strike(Unit, Event) 
	Unit:FullCastSpellOnTarget(11976, Unit:GetMainTank()) 
end

function KolkarMarauder_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KolkarMarauder_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3275, 1, "KolkarMarauder_OnCombat")
RegisterUnitEvent(3275, 2, "KolkarMarauder_OnLeaveCombat")
RegisterUnitEvent(3275, 4, "KolkarMarauder_OnDied")

--
function KolkarPackRunner_OnCombat(Unit, Event)
	Unit:RegisterEvent("KolkarPackRunner_BattleShout", 4000, 1)
end

function KolkarPackRunner_BattleShout(Unit, Event) 
	Unit:CastSpell(9128) 
end

function KolkarPackRunner_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KolkarPackRunner_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3274, 1, "KolkarPackRunner_OnCombat")
RegisterUnitEvent(3274, 2, "KolkarPackRunner_OnLeaveCombat")
RegisterUnitEvent(3274, 4, "KolkarPackRunner_OnDied")

--
function KolkarStormer_OnCombat(Unit, Event)
	Unit:RegisterEvent("KolkarStormer_LightningBolt", 8000, 0)
	Unit:RegisterEvent("KolkarStormer_LightningCloud", 4000, 1)
end

function KolkarStormer_LightningBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank()) 
end

function KolkarStormer_LightningCloud(Unit, Event) 
	Unit:CastSpell(6535) 
end

function KolkarStormer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KolkarStormer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3273, 1, "KolkarStormer_OnCombat")
RegisterUnitEvent(3273, 2, "KolkarStormer_OnLeaveCombat")
RegisterUnitEvent(3273, 4, "KolkarStormer_OnDied")

--
function KolkarStormseer_OnCombat(Unit, Event)
	Unit:RegisterEvent("KolkarStormseer_FlingTorch", 2000, 1)
	Unit:RegisterEvent("KolkarStormseer_LightningBolt", 8000, 0)
	Unit:RegisterEvent("KolkarStormseer_LightningCloud", 4000, 1)
end

function KolkarStormseer_FlingTorch(Unit, Event) 
	Unit:CastSpell(14292) 
end

function KolkarStormseer_LightningBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank()) 
end

function KolkarStormseer_LightningCloud(Unit, Event) 
	Unit:CastSpell(6535) 
end

function KolkarStormseer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KolkarStormseer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(9523, 1, "KolkarStormseer_OnCombat")
RegisterUnitEvent(9523, 2, "KolkarStormseer_OnLeaveCombat")
RegisterUnitEvent(9523, 4, "KolkarStormseer_OnDied")

--
function KolkarWrangler_OnCombat(Unit, Event)
	Unit:RegisterEvent("KolkarWrangler_Net", 10000, 0)
	Unit:RegisterEvent("KolkarWrangler_Shoot", 6000, 0)
end

function KolkarWrangler_Net(Unit, Event) 
	Unit:FullCastSpellOnTarget(12024, Unit:GetMainTank()) 
end

function KolkarWrangler_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function KolkarStormseer_LightningCloud(Unit, Event) 
	Unit:CastSpell(6535) 
end

function KolkarWrangler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KolkarWrangler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3272, 1, "KolkarWrangler_OnCombat")
RegisterUnitEvent(3272, 2, "KolkarWrangler_OnLeaveCombat")
RegisterUnitEvent(3272, 4, "KolkarWrangler_OnDied")

--
function LostBarrensKodo_OnCombat(Unit, Event)
	Unit:RegisterEvent("LostBarrensKodo_KodoStomp", 6000, 0)
end

function LostBarrensKodo_KodoStomp(Unit, Event) 
	Unit:CastSpell(6266) 
end

function LostBarrensKodo_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LostBarrensKodo_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3236, 1, "LostBarrensKodo_OnCombat")
RegisterUnitEvent(3236, 2, "LostBarrensKodo_OnLeaveCombat")
RegisterUnitEvent(3236, 4, "LostBarrensKodo_OnDied")

--
function OasisSnapjaw_OnCombat(Unit, Event)
	Unit:RegisterEvent("OasisSnapjaw_SlingDirt", 12000, 0)
end

function OasisSnapjaw_SlingDirt(Unit, Event) 
	Unit:FullCastSpellOnTarget(6530, Unit:GetMainTank()) 
end

function OasisSnapjaw_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function OasisSnapjaw_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3461, 1, "OasisSnapjaw_OnCombat")
RegisterUnitEvent(3461, 2, "OasisSnapjaw_OnLeaveCombat")
RegisterUnitEvent(3461, 4, "OasisSnapjaw_OnDied")

--
function RazorfenBattleguard_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazorfenBattleguard_Slam", 6000, 0)
end

function RazorfenBattleguard_Slam(Unit, Event) 
	Unit:FullCastSpellOnTarget(11430, Unit:GetMainTank()) 
end

function RazorfenBattleguard_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazorfenBattleguard_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7873, 1, "RazorfenBattleguard_OnCombat")
RegisterUnitEvent(7873, 2, "RazorfenBattleguard_OnLeaveCombat")
RegisterUnitEvent(7873, 4, "RazorfenBattleguard_OnDied")

--
function RazorfenThornweaver_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazorfenThornweaver_HealingTouch", 15000, 0)
	Unit:RegisterEvent("RazorfenThornweaver_Thorns", 4000, 1)
end

function RazorfenThornweaver_HealingTouch(Unit, Event) 
	Unit:CastSpell(11431) 
end

function RazorfenThornweaver_Thorns(Unit, Event) 
	Unit:CastSpell(7966) 
end

function RazorfenThornweaver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazorfenThornweaver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7874, 1, "RazorfenThornweaver_OnCombat")
RegisterUnitEvent(7874, 2, "RazorfenThornweaver_OnLeaveCombat")
RegisterUnitEvent(7874, 4, "RazorfenThornweaver_OnDied")

--
function RazormaneDefender_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazormaneDefender_BattleStance", 1000, 1)
	Unit:RegisterEvent("RazormaneDefender_DemoralizingShout", 4000, 1)
	Unit:RegisterEvent("RazormaneDefender_HeroicStrike", 6000, 0)
end

function RazormaneDefender_BattleStance(Unit, Event) 
	Unit:CastSpell(7165) 
end

function RazormaneDefender_DemoralizingShout(Unit, Event) 
	Unit:CastSpell(13730) 
end

function RazormaneDefender_HeroicStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(25710, Unit:GetMainTank()) 
end

function RazormaneDefender_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazormaneDefender_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3266, 1, "RazormaneDefender_OnCombat")
RegisterUnitEvent(3266, 2, "RazormaneDefender_OnLeaveCombat")
RegisterUnitEvent(3266, 4, "RazormaneDefender_OnDied")

--
function RazormaneGeomancer_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazormaneGeomancer_Fireball", 8000, 0)
	Unit:RegisterEvent("RazormaneGeomancer_FrostArmor", 1000, 1)
end

function RazormaneGeomancer_FrostArmor(Unit, Event) 
	Unit:CastSpell(12544) 
end

function RazormaneGeomancer_Fireball(Unit, Event) 
	Unit:FullCastSpellOnTarget(20793, Unit:GetMainTank()) 
end

function RazormaneGeomancer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazormaneGeomancer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3269, 1, "RazormaneGeomancer_OnCombat")
RegisterUnitEvent(3269, 2, "RazormaneGeomancer_OnLeaveCombat")
RegisterUnitEvent(3269, 4, "RazormaneGeomancer_OnDied")

--
function RazormaneHunter_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazormaneHunter_Shoot", 6000, 0)
	Unit:RegisterEvent("RazormaneHunter_RazormaneWolf", 3000, 1)
end

function RazormaneHunter_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function RazormaneHunter_RazormaneWolf(Unit, Event) 
	Unit:CastSpell(6479) 
end

function RazormaneHunter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazormaneHunter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3265, 1, "RazormaneHunter_OnCombat")
RegisterUnitEvent(3265, 2, "RazormaneHunter_OnLeaveCombat")
RegisterUnitEvent(3265, 4, "RazormaneHunter_OnDied")

--
function RazormaneMystic_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazormaneMystic_HealingWave", 12000, 0)
	Unit:RegisterEvent("RazormaneMystic_LightningShield", 3000, 0)
end

function RazormaneMystic_HealingWave(Unit, Event) 
	Unit:CastSpell(547) 
end

function RazormaneMystic_LightningShield(Unit, Event) 
	Unit:CastSpell(324) 
end

function RazormaneMystic_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazormaneMystic_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3271, 1, "RazormaneMystic_OnCombat")
RegisterUnitEvent(3271, 2, "RazormaneMystic_OnLeaveCombat")
RegisterUnitEvent(3271, 4, "RazormaneMystic_OnDied")

--
function RazormanePathfinder_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazormanePathfinder_Shoot", 6000, 0)
	Unit:RegisterEvent("RazormanePathfinder_Thrash", 4000, 1)
end

function RazormanePathfinder_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function RazormanePathfinder_Thrash(Unit, Event) 
	Unit:FullCastSpellOnTarget(3391, Unit:GetMainTank()) 
end

function RazormanePathfinder_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazormanePathfinder_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3456, 1, "RazormanePathfinder_OnCombat")
RegisterUnitEvent(3456, 2, "RazormanePathfinder_OnLeaveCombat")
RegisterUnitEvent(3456, 4, "RazormanePathfinder_OnDied")

--
function RazormaneSeer_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazormaneSeer_HealingWard", 2000, 1)
	Unit:RegisterEvent("RazormaneSeer_SearingTotem", 4000, 1)
end

function RazormaneSeer_HealingWard(Unit, Event) 
	Unit:CastSpell(6274) 
end

function RazormaneSeer_SearingTotem(Unit, Event) 
	Unit:CastSpell(6363) 
end

function RazormaneSeer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazormaneSeer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3458, 1, "RazormaneSeer_OnCombat")
RegisterUnitEvent(3458, 2, "RazormaneSeer_OnLeaveCombat")
RegisterUnitEvent(3458, 4, "RazormaneSeer_OnDied")

--
function RazormaneStalker_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazormaneStalker_SinesterStrike", 3000, 0)
end

function RazormaneStalker_SinesterStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(1758, Unit:GetMainTank()) 
end

function RazormaneStalker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazormaneStalker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3457, 1, "RazormaneStalker_OnCombat")
RegisterUnitEvent(3457, 2, "RazormaneStalker_OnLeaveCombat")
RegisterUnitEvent(3457, 4, "RazormaneStalker_OnDied")

--
function RazormaneThornweaver_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazormaneThornweaver_FaerieFire", 8000, 1)
	Unit:RegisterEvent("RazormaneThornweaver_Thorns", 2000, 1)
end

function RazormaneThornweaver_FaerieFire(Unit, Event) 
	Unit:FullCastSpellOnTarget(6950, Unit:GetMainTank()) 
end

function RazormaneThornweaver_Thorns(Unit, Event) 
	Unit:CastSpell(467) 
end

function RazormaneThornweaver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazormaneThornweaver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3268, 1, "RazormaneThornweaver_OnCombat")
RegisterUnitEvent(3268, 2, "RazormaneThornweaver_OnLeaveCombat")
RegisterUnitEvent(3268, 4, "RazormaneThornweaver_OnDied")

--
function RazormaneWaterSeeker_OnCombat(Unit, Event)
	Unit:RegisterEvent("RazormaneWaterSeeker_CreepingMold", 4000, 1)
end

function RazormaneWaterSeeker_CreepingMold(Unit, Event) 
	Unit:FullCastSpellOnTarget(6278, Unit:GetMainTank()) 
end

function RazormaneWaterSeeker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RazormaneWaterSeeker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3267, 1, "RazormaneWaterSeeker_OnCombat")
RegisterUnitEvent(3267, 2, "RazormaneWaterSeeker_OnLeaveCombat")
RegisterUnitEvent(3267, 4, "RazormaneWaterSeeker_OnDied")

--
function SavannahMatriarch_OnCombat(Unit, Event)
	Unit:RegisterEvent("SavannahMatriarch_SavannahCubs", 4000, 1)
end

function SavannahMatriarch_SavannahCubs(Unit, Event) 
	Unit:CastSpell(8210) 
end

function SavannahMatriarch_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SavannahMatriarch_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5865, 1, "SavannahMatriarch_OnCombat")
RegisterUnitEvent(5865, 2, "SavannahMatriarch_OnLeaveCombat")
RegisterUnitEvent(5865, 4, "SavannahMatriarch_OnDied")

--
function SilithidCreeperEgg_OnCombat(Unit, Event)
	Unit:RegisterEvent("SilithidCreeperEgg_Suicide", 20000, 1)
	Unit:RegisterEvent("SilithidCreeperEgg_SummonSilithidGrub", 4000, 1)
end

function SilithidCreeperEgg_Suicide(Unit, Event) 
	Unit:CastSpell(7) 
end

function SilithidCreeperEgg_SummonSilithidGrub(Unit, Event) 
	Unit:CastSpell(6588) 
end

function SilithidCreeperEgg_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SilithidCreeperEgg_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5781, 1, "SilithidCreeperEgg_OnCombat")
RegisterUnitEvent(5781, 2, "SilithidCreeperEgg_OnLeaveCombat")
RegisterUnitEvent(5781, 4, "SilithidCreeperEgg_OnDied")

--
function SilithidCreeper_OnCombat(Unit, Event)
	Unit:RegisterEvent("SilithidCreeper_SilithidCreeperEgg", 4000, 1)
end

function SilithidCreeper_SilithidCreeperEgg(Unit, Event) 
	Unit:CastSpell(6587) 
end

function SilithidCreeper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SilithidCreeper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3250, 1, "SilithidCreeper_OnCombat")
RegisterUnitEvent(3250, 2, "SilithidCreeper_OnLeaveCombat")
RegisterUnitEvent(3250, 4, "SilithidCreeper_OnDied")

--
function SilithidHarvester_OnCombat(Unit, Event)
	Unit:RegisterEvent("SilithidHarvester_HarvestSwarm", 6000, 0)
	Unit:RegisterEvent("SilithidHarvester_SummonHarvesterSwarm", 3000, 1)
end

function SilithidHarvester_HarvestSwarm(Unit, Event) 
	Unit:FullCastSpellOnTarget(7277, Unit:GetMainTank()) 
end

function SilithidHarvester_SummonHarvesterSwarm(Unit, Event) 
	Unit:CastSpell(7278) 
end

function SilithidHarvester_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SilithidHarvester_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3253, 1, "SilithidHarvester_OnCombat")
RegisterUnitEvent(3253, 2, "SilithidHarvester_OnLeaveCombat")
RegisterUnitEvent(3253, 4, "SilithidHarvester_OnDied")

--
function SilithidSwarmer_OnCombat(Unit, Event)
	Unit:RegisterEvent("SilithidSwarmer_SilithidSwarm", 3000, 1)
end

function SilithidSwarmer_SilithidSwarm(Unit, Event) 
	Unit:CastSpell(6589) 
end

function SilithidSwarmer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SilithidSwarmer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3252, 1, "SilithidSwarmer_OnCombat")
RegisterUnitEvent(3252, 2, "SilithidSwarmer_OnLeaveCombat")
RegisterUnitEvent(3252, 4, "SilithidSwarmer_OnDied")

--
function SludgeBeast_OnCombat(Unit, Event)
	Unit:RegisterEvent("SludgeBeast_BlackSludge", 6000, 0)
end

function SludgeBeast_BlackSludge(Unit, Event) 
	Unit:CastSpell(7279) 
end

function SludgeBeast_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SludgeBeast_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

function SludgeBeast_OnKilledTarget(Unit, Event) 
end

RegisterUnitEvent(3295, 1, "SludgeBeast_OnCombat")
RegisterUnitEvent(3295, 2, "SludgeBeast_OnLeaveCombat")
RegisterUnitEvent(3295, 4, "SludgeBeast_OnDied")

--
function SouthseaBrigand_OnCombat(Unit, Event)
	Unit:RegisterEvent("SouthseaBrigand_Backhand", 8000, 0)
end

function SouthseaBrigand_Backhand(Unit, Event) 
	Unit:FullCastSpellOnTarget(6253, Unit:GetMainTank()) 
end

function SouthseaBrigand_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SouthseaBrigand_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3381, 1, "SouthseaBrigand_OnCombat")
RegisterUnitEvent(3381, 2, "SouthseaBrigand_OnLeaveCombat")
RegisterUnitEvent(3381, 4, "SouthseaBrigand_OnDied")

--
function SouthseaCannoneer_OnCombat(Unit, Event)
	Unit:RegisterEvent("SouthseaCannoneer_Shoot", 6000, 0)
end

function SouthseaCannoneer_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function SouthseaCannoneer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SouthseaCannoneer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3382, 1, "SouthseaCannoneer_OnCombat")
RegisterUnitEvent(3382, 2, "SouthseaCannoneer_OnLeaveCombat")
RegisterUnitEvent(3382, 4, "SouthseaCannoneer_OnDied")

--
function SouthseaPrivateer_OnCombat(Unit, Event)
	Unit:RegisterEvent("SouthseaPrivateer_FireShot", 9000, 0)
	Unit:RegisterEvent("SouthseaPrivateer_Shoot", 6000, 0)
end

function SouthseaPrivateer_FireShot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6979, Unit:GetMainTank()) 
end

function SouthseaPrivateer_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function SouthseaPrivateer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SouthseaPrivateer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3384, 1, "SouthseaPrivateer_OnCombat")
RegisterUnitEvent(3384, 2, "SouthseaPrivateer_OnLeaveCombat")
RegisterUnitEvent(3384, 4, "SouthseaPrivateer_OnDied")

--
function Stormsnout_OnCombat(Unit, Event)
	Unit:RegisterEvent("Stormsnout_LizardBolt", 6000, 0)
end

function Stormsnout_LizardBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(5401, Unit:GetMainTank()) 
end

function Stormsnout_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Stormsnout_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3240, 1, "Stormsnout_OnCombat")
RegisterUnitEvent(3240, 2, "Stormsnout_OnLeaveCombat")
RegisterUnitEvent(3240, 4, "Stormsnout_OnDied")

--
function SummonedFelhunter_OnCombat(Unit, Event)
	Unit:RegisterEvent("SummonedFelhunter_ManaBurn", 6000, 0)
end

function SummonedFelhunter_ManaBurn(Unit, Event) 
	Unit:FullCastSpellOnTarget(2691, Unit:GetRandomPlayer(4)) 
end

function SummonedFelhunter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SummonedFelhunter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6268, 1, "SummonedFelhunter_OnCombat")
RegisterUnitEvent(6268, 2, "SummonedFelhunter_OnLeaveCombat")
RegisterUnitEvent(6268, 4, "SummonedFelhunter_OnDied")

--
function SunscaleLashtail_OnCombat(Unit, Event)
	Unit:RegisterEvent("SunscaleLashtail_Lash", 6000, 0)
end

function SunscaleLashtail_Lash(Unit, Event) 
	Unit:FullCastSpellOnTarget(6607, Unit:GetMainTank()) 
end

function SunscaleLashtail_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SunscaleLashtail_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3254, 1, "SunscaleLashtail_OnCombat")
RegisterUnitEvent(3254, 2, "SunscaleLashtail_OnLeaveCombat")
RegisterUnitEvent(3254, 4, "SunscaleLashtail_OnDied")

--
function SunscaleScytheclaw_OnCombat(Unit, Event)
	Unit:RegisterEvent("SunscaleScytheclaw_Thrash", 6000, 0)
end

function SunscaleScytheclaw_Thrash(Unit, Event) 
	Unit:FullCastSpellOnTarget(3391, Unit:GetMainTank()) 
end

function SunscaleScytheclaw_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SunscaleScytheclaw_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3256, 1, "SunscaleScytheclaw_OnCombat")
RegisterUnitEvent(3256, 2, "SunscaleScytheclaw_OnLeaveCombat")
RegisterUnitEvent(3256, 4, "SunscaleScytheclaw_OnDied")

--
function SwinegartSpearhide_OnCombat(Unit, Event)
	Unit:RegisterEvent("SwinegartSpearhide_PierceArmor", 10000, 0)
end

function SwinegartSpearhide_PierceArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(6016, Unit:GetMainTank()) 
end

function SwinegartSpearhide_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SwinegartSpearhide_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5864, 1, "SwinegartSpearhide_OnCombat")
RegisterUnitEvent(5864, 2, "SwinegartSpearhide_OnLeaveCombat")
RegisterUnitEvent(5864, 4, "SwinegartSpearhide_OnDied")

--
function TheramoreMarine_OnCombat(Unit, Event)
	Unit:RegisterEvent("TheramoreMarine_DefensiveStance", 2000, 1)
	Unit:RegisterEvent("TheramoreMarine_Disarm", 6000, 0)
	Unit:RegisterEvent("TheramoreMarine_ShieldBash", 8000, 0)
end

function TheramoreMarine_DefensiveStance(Unit, Event) 
	Unit:CastSpell(7164) 
end

function TheramoreMarine_Disarm(Unit, Event) 
	Unit:FullCastSpellOnTarget(6713, Unit:GetMainTank()) 
end

function TheramoreMarine_ShieldBash(Unit, Event) 
	Unit:FullCastSpellOnTarget(72, Unit:GetMainTank()) 
end

function TheramoreMarine_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TheramoreMarine_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3385, 1, "TheramoreMarine_OnCombat")
RegisterUnitEvent(3385, 2, "TheramoreMarine_OnLeaveCombat")
RegisterUnitEvent(3385, 4, "TheramoreMarine_OnDied")

--
function TheramorePreserver_OnCombat(Unit, Event)
	Unit:RegisterEvent("TheramorePreserver_Smite", 8000, 0)
	Unit:RegisterEvent("TheramorePreserver_LesserHeal", 12000, 0)
	Unit:RegisterEvent("TheramorePreserver_Renew", 5000, 1)
end

function TheramorePreserver_Smite(Unit, Event) 
	Unit:FullCastSpellOnTarget(9734, Unit:GetMainTank()) 
end

function TheramorePreserver_LesserHeal(Unit, Event) 
	Unit:CastSpell(2052) 
end

function TheramorePreserver_Renew(Unit, Event) 
	Unit:CastSpell(6074) 
end

function TheramorePreserver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TheramorePreserver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3386, 1, "TheramorePreserver_OnCombat")
RegisterUnitEvent(3386, 2, "TheramorePreserver_OnLeaveCombat")
RegisterUnitEvent(3386, 4, "TheramorePreserver_OnDied")

--
function ThunderhawkCloudscraper_OnCombat(Unit, Event)
	Unit:RegisterEvent("ThunderhawkCloudscraper_ThunderClap", 10000, 0)
end

function ThunderhawkCloudscraper_ThunderClap(Unit, Event) 
	Unit:CastSpell(8078) 
end

function ThunderhawkCloudscraper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ThunderhawkCloudscraper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3424, 1, "ThunderhawkCloudscraper_OnCombat")
RegisterUnitEvent(3424, 2, "ThunderhawkCloudscraper_OnLeaveCombat")
RegisterUnitEvent(3424, 4, "ThunderhawkCloudscraper_OnDied")

--
function ThunderhawkHatchling_OnCombat(Unit, Event)
	Unit:RegisterEvent("ThunderhawkHatchling_LightningShield", 4000, 0)
	Unit:RegisterEvent("ThunderhawkHatchling_LightningBolt", 8000, 0)
end

function ThunderhawkHatchling_LightningBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank()) 
end

function ThunderhawkHatchling_LightningShield(Unit, Event) 
	Unit:CastSpell(325) 
end

function ThunderhawkHatchling_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ThunderhawkHatchling_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3247, 1, "ThunderhawkHatchling_OnCombat")
RegisterUnitEvent(3247, 2, "ThunderhawkHatchling_OnLeaveCombat")
RegisterUnitEvent(3247, 4, "ThunderhawkHatchling_OnDied")

--
function VentureCoEnforcer_OnCombat(Unit, Event)
	Unit:RegisterEvent("VentureCoEnforcer_BattleShout", 2000, 1)
	Unit:RegisterEvent("VentureCoEnforcer_Disarm", 10000, 0)
end

function VentureCoEnforcer_BattleShout(Unit, Event) 
	Unit:CastSpell(9128) 
end

function VentureCoEnforcer_Disarm(Unit, Event) 
	Unit:FullCastSpellOnTarget(6713, Unit:GetMainTank()) 
end

function VentureCoEnforcer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function VentureCoEnforcer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3283, 1, "VentureCoEnforcer_OnCombat")
RegisterUnitEvent(3283, 2, "VentureCoEnforcer_OnLeaveCombat")
RegisterUnitEvent(3283, 4, "VentureCoEnforcer_OnDied")

--
function VentureCoMercenary_OnCombat(Unit, Event)
	Unit:RegisterEvent("VentureCoMercenary_Shoot", 6000, 0)
end

function VentureCoMercenary_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function VentureCoMercenary_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function VentureCoMercenary_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3382, 1, "VentureCoMercenary_OnCombat")
RegisterUnitEvent(3382, 2, "VentureCoMercenary_OnLeaveCombat")
RegisterUnitEvent(3382, 4, "VentureCoMercenary_OnDied")

--
function WitchwingAmbusher_OnCombat(Unit, Event)
	Unit:RegisterEvent("WitchwingAmbusher_ExploitWeakness", 5000, 0)
end

function WitchwingAmbusher_ExploitWeakness(Unit, Event) 
	Unit:FullCastSpellOnTarget(6595, Unit:GetMainTank()) 
end

function WitchwingAmbusher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WitchwingAmbusher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3279, 1, "WitchwingAmbusher_OnCombat")
RegisterUnitEvent(3279, 2, "WitchwingAmbusher_OnLeaveCombat")
RegisterUnitEvent(3279, 4, "WitchwingAmbusher_OnDied")

--
function WitchwingHarpy_OnCombat(Unit, Event)
	Unit:RegisterEvent("WitchwingHarpy_CurseofMending", 4000, 1)
end

function WitchwingHarpy_CurseofMending(Unit, Event) 
	Unit:FullCastSpellOnTarget(7098, Unit:GetMainTank()) 
end

function WitchwingHarpy_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WitchwingHarpy_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3276, 1, "WitchwingHarpy_OnCombat")
RegisterUnitEvent(3276, 2, "WitchwingHarpy_OnLeaveCombat")
RegisterUnitEvent(3276, 4, "WitchwingHarpy_OnDied")

--
function WitchwingRoguefeather_OnCombat(Unit, Event)
	Unit:RegisterEvent("WitchwingRoguefeather_ExploitWeakness", 60000, 0)
	Unit:RegisterEvent("WitchwingRoguefeather_SlowingPoison", 10000, 0)
end

function WitchwingRoguefeather_ExploitWeakness(Unit, Event) 
	Unit:FullCastSpellOnTarget(6595, Unit:GetMainTank()) 
end

function WitchwingRoguefeather_SlowingPoison(Unit, Event) 
	Unit:FullCastSpellOnTarget(7992, Unit:GetMainTank()) 
end

function WitchwingRoguefeather_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WitchwingRoguefeather_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3277, 1, "WitchwingRoguefeather_OnCombat")
RegisterUnitEvent(3277, 2, "WitchwingRoguefeather_OnLeaveCombat")
RegisterUnitEvent(3277, 4, "WitchwingRoguefeather_OnDied")

--
function WitchwingSlayer_OnCombat(Unit, Event)
	Unit:RegisterEvent("WitchwingSlayer_DemoralizingShout", 3000, 1)
end

function WitchwingSlayer_DemoralizingShout(Unit, Event) 
	Unit:CastSpell(13730) 
end

function WitchwingSlayer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WitchwingSlayer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3278, 1, "WitchwingSlayer_OnCombat")
RegisterUnitEvent(3278, 2, "WitchwingSlayer_OnLeaveCombat")
RegisterUnitEvent(3278, 4, "WitchwingSlayer_OnDied")

--
function WitchwingWindcaller_OnCombat(Unit, Event)
	Unit:RegisterEvent("WitchwingWindcaller_EnvelopingWinds", 10000, 0)
end

function WitchwingWindcaller_EnvelopingWinds(Unit, Event) 
	Unit:FullCastSpellOnTarget(6728, Unit:GetMainTank()) 
end

function WitchwingWindcaller_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WitchwingWindcaller_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3280, 1, "WitchwingWindcaller_OnCombat")
RegisterUnitEvent(3280, 2, "WitchwingWindcaller_OnLeaveCombat")
RegisterUnitEvent(3280, 4, "WitchwingWindcaller_OnDied")