--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--Axxarien Hellcaller
function AxxarienHellcaller_OnCombat(Unit, Event)
	Unit:RegisterEvent("AxxarienHellcaller_RainOfFire", 10000, 0)
end

function AxxarienHellcaller_RainOfFire(pUnit, Event) 
	pUnit:CastSpell(11990) 
end

function AxxarienHellcaller_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AxxarienHellcaller_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17342, 1, "AxxarienHellcaller_OnCombat")
RegisterUnitEvent(17342, 2, "AxxarienHellcaller_OnLeaveCombat")
RegisterUnitEvent(17342, 4, "AxxarienHellcaller_OnDied")

--Axxarien Shadowstalker
function AxxarienShadowstalker_OnCombat(Unit, Event)
	Unit:RegisterEvent("AxxarienShadowstalker_Corruption", 8000, 0)
end

function AxxarienShadowstalker_Corruption(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(21068, 	pUnit:GetMainTank()) 
end

function AxxarienShadowstalker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AxxarienShadowstalker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17340, 1, "AxxarienShadowstalker_OnCombat")
RegisterUnitEvent(17340, 2, "AxxarienShadowstalker_OnLeaveCombat")
RegisterUnitEvent(17340, 4, "AxxarienShadowstalker_OnDied")

--Axxarien Trickster
function AxxarienTrickster_OnCombat(Unit, Event)
	Unit:RegisterEvent("AxxarienTrickster_Eviscerate", 10000, 0)
end

function AxxarienTrickster_Eviscerate(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(15691, 	pUnit:GetMainTank()) 
end

function AxxarienTrickster_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AxxarienTrickster_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17341, 1, "AxxarienTrickster_OnCombat")
RegisterUnitEvent(17341, 2, "AxxarienTrickster_OnLeaveCombat")
RegisterUnitEvent(17341, 4, "AxxarienTrickster_OnDied")

--Blacksilt Seer
function BlacksiltSeer_OnCombat(Unit, Event)
	Unit:RegisterEvent("BlacksiltSeer_Rejuvenation", 10000, 0)
	Unit:RegisterEvent("BlacksiltSeer_Wrath", 7000, 0)
end

function BlacksiltSeer_Rejuvenation(pUnit, Event) 
	pUnit:CastSpell(12160) 
end

function BlacksiltSeer_Wrath(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9739, 	pUnit:GetMainTank()) 
end

function BlacksiltSeer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BlacksiltSeer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17330, 1, "BlacksiltSeer_OnCombat")
RegisterUnitEvent(17330, 2, "BlacksiltSeer_OnLeaveCombat")
RegisterUnitEvent(17330, 4, "BlacksiltSeer_OnDied")

--Blacksilt Shorestriker
function BlacksiltShorestriker_OnCombat(Unit, Event)
	Unit:RegisterEvent("BlacksiltShorestriker_Net", 8000, 0)
end

function BlacksiltShorestriker_Net(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(31290, 	pUnit:GetMainTank()) 
end

function BlacksiltShorestriker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BlacksiltShorestriker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17328, 1, "BlacksiltShorestriker_OnCombat")
RegisterUnitEvent(17328, 2, "BlacksiltShorestriker_OnLeaveCombat")
RegisterUnitEvent(17328, 4, "BlacksiltShorestriker_OnDied")

--Blacksilt Tidecaller
function BlacksiltTidecaller_OnCombat(Unit, Event)
	Unit:RegisterEvent("BlacksiltTidecaller_LightningShield", 5000, 0)
	Unit:RegisterEvent("BlacksiltTidecaller_Rejuvenation", 10000, 0)
end

function BlacksiltTidecaller_LightningShield(pUnit, Event) 
	pUnit:CastSpell(12550) 
end

function BlacksiltTidecaller_Rejuvenation(pUnit, Event) 
	pUnit:CastSpell(12160) 
end

function BlacksiltTidecaller_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BlacksiltTidecaller_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17327, 1, "BlacksiltTidecaller_OnCombat")
RegisterUnitEvent(17327, 2, "BlacksiltTidecaller_OnLeaveCombat")
RegisterUnitEvent(17327, 4, "BlacksiltTidecaller_OnDied")

--Bloodcursed Naga
function BloodcursedNaga_OnCombat(Unit, Event)
	Unit:RegisterEvent("BloodcursedNaga_FrostArmor", 2000, 1)
	Unit:RegisterEvent("BloodcursedNaga_Frostbolt", 8000, 0)
end

function BloodcursedNaga_FrostArmor(pUnit, Event) 
	pUnit:CastSpell(12544) 
end

function BloodcursedNaga_Frostbolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20792, 	pUnit:GetMainTank()) 
end

function BloodcursedNaga_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BloodcursedNaga_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17713, 1, "BloodcursedNaga_OnCombat")
RegisterUnitEvent(17713, 2, "BloodcursedNaga_OnLeaveCombat")
RegisterUnitEvent(17713, 4, "BloodcursedNaga_OnDied")

--Blue Flutterer
function BlueFlutterer_OnCombat(Unit, Event)
	Unit:RegisterEvent("BlueFlutterer_Rake", 10000, 0)
end

function BlueFlutterer_Rake(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(36332, 	pUnit:GetMainTank()) 
end

function BlueFlutterer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BlueFlutterer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17349, 1, "BlueFlutterer_OnCombat")
RegisterUnitEvent(17349, 2, "BlueFlutterer_OnLeaveCombat")
RegisterUnitEvent(17349, 4, "BlueFlutterer_OnDied")

--Bristlelimb Shaman
function BristlelimbShaman_OnCombat(Unit, Event)
	Unit:RegisterEvent("BristlelimbShaman_FlameShock", 10000, 0)
	Unit:RegisterEvent("BristlelimbShaman_ScorchingTotem", 2000, 1)
end

function BristlelimbShaman_FlameShock(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(32967, 	pUnit:GetMainTank()) 
end

function BristlelimbShaman_ScorchingTotem(pUnit, Event) 
	pUnit:CastSpell(32968) 
end

function BristlelimbShaman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BristlelimbShaman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17320, 1, "BristlelimbShaman_OnCombat")
RegisterUnitEvent(17320, 2, "BristlelimbShaman_OnLeaveCombat")
RegisterUnitEvent(17320, 4, "BristlelimbShaman_OnDied")

--Bristlelimb Warrior
function BristlelimbWarrior_OnCombat(Unit, Event)
	Unit:RegisterEvent("BristlelimbWarrior_Strike", 6000, 0)
end

function BristlelimbWarrior_Strike(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11976, 	pUnit:GetMainTank()) 
end

function BristlelimbWarrior_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BristlelimbWarrior_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17321, 1, "BristlelimbWarrior_OnCombat")
RegisterUnitEvent(17321, 2, "BristlelimbWarrior_OnLeaveCombat")
RegisterUnitEvent(17321, 4, "BristlelimbWarrior_OnDied")

--Corrupted Stomper
function CorruptedStomper_OnCombat(Unit, Event)
	Unit:RegisterEvent("CorruptedStomper_Stomp", 8000, 0)
end

function CorruptedStomper_Stomp(pUnit, Event) 
	pUnit:CastSpell(31277) 
end

function CorruptedStomper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CorruptedStomper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17353, 1, "CorruptedStomper_OnCombat")
RegisterUnitEvent(17353, 2, "CorruptedStomper_OnLeaveCombat")
RegisterUnitEvent(17353, 4, "CorruptedStomper_OnDied")

--Elder Brown Bear
function ElderBrownBear_OnCombat(Unit, Event)
	Unit:RegisterEvent("ElderBrownBear_Swipe", 8000, 0)
end

function ElderBrownBear_Swipe(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(31279, 	pUnit:GetMainTank()) 
end

function ElderBrownBear_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ElderBrownBear_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17348, 1, "ElderBrownBear_OnCombat")
RegisterUnitEvent(17348, 2, "ElderBrownBear_OnLeaveCombat")
RegisterUnitEvent(17348, 4, "ElderBrownBear_OnDied")

--Enraged Ravager
function EnragedRavager_OnCombat(Unit, Event)
	Unit:RegisterEvent("EnragedRavager_Enrage", 10000, 1)
	Unit:RegisterEvent("EnragedRavager_Ravage", 8000, 0)
end

function EnragedRavager_Enrage(pUnit, Event) 
	pUnit:CastSpell(15716) 
end

function EnragedRavager_Ravage(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3242, 	pUnit:GetMainTank()) 
end

function EnragedRavager_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function EnragedRavager_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17527, 1, "EnragedRavager_OnCombat")
RegisterUnitEvent(17527, 2, "EnragedRavager_OnLeaveCombat")
RegisterUnitEvent(17527, 4, "EnragedRavager_OnDied")

--Fouled Water Spirit
function FouledWaterSpirit_OnCombat(Unit, Event)
	Unit:RegisterEvent("FouledWaterSpirit_Bloodbolt", 8000, 0)
	Unit:RegisterEvent("FouledWaterSpirit_BloodmystChill", 2000, 1)
end

function FouledWaterSpirit_Bloodbolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(31281, 	pUnit:GetMainTank()) 
end

function FouledWaterSpirit_BloodmystChill(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(31280, 	pUnit:GetMainTank()) 
end

function FouledWaterSpirit_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FouledWaterSpirit_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17358, 1, "FouledWaterSpirit_OnCombat")
RegisterUnitEvent(17358, 2, "FouledWaterSpirit_OnLeaveCombat")
RegisterUnitEvent(17358, 4, "FouledWaterSpirit_OnDied")

--Grizzled Brown Bear
function GrizzledBrownBear_OnCombat(Unit, Event)
	Unit:RegisterEvent("GrizzledBrownBear_Swipe", 8000, 0)
end

function GrizzledBrownBear_Swipe(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(31279, 	pUnit:GetMainTank()) 
end

function GrizzledBrownBear_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GrizzledBrownBear_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17347, 1, "GrizzledBrownBear_OnCombat")
RegisterUnitEvent(17347, 2, "GrizzledBrownBear_OnLeaveCombat")
RegisterUnitEvent(17347, 4, "GrizzledBrownBear_OnDied")

--Hand of Argus Swordsman
function HandofArgusSwordsman_OnCombat(Unit, Event)
	Unit:RegisterEvent("HandofArgusSwordsman_BattleSgout", 2000, 1)
	Unit:RegisterEvent("HandofArgusSwordsman_Strike", 6000, 0)
end

function HandofArgusSwordsman_BattleSgout(pUnit, Event) 
	pUnit:CastSpell(9128) 
end

function HandofArgusSwordsman_Strike(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11976, 	pUnit:GetMainTank()) 
end

function HandofArgusSwordsman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HandofArgusSwordsman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17704, 1, "HandofArgusSwordsman_OnCombat")
RegisterUnitEvent(17704, 2, "HandofArgusSwordsman_OnLeaveCombat")
RegisterUnitEvent(17704, 4, "HandofArgusSwordsman_OnDied")

--Infected Wildkin
function InfectedWildkin_OnCombat(Unit, Event)
	Unit:RegisterEvent("InfectedWildkin_InfectedWound", 10000, 0)
end

function InfectedWildkin_InfectedWound(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(31282, 	pUnit:GetMainTank()) 
end

function InfectedWildkin_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function InfectedWildkin_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17322, 1, "InfectedWildkin_OnCombat")
RegisterUnitEvent(17322, 2, "InfectedWildkin_OnLeaveCombat")
RegisterUnitEvent(17322, 4, "InfectedWildkin_OnDied")

--Mutated Tangler
function MutatedTangler_OnCombat(Unit, Event)
	Unit:RegisterEvent("MutatedTangler_EntanglingRoots", 10000, 0)
end

function MutatedTangler_EntanglingRoots(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(31287, 	pUnit:GetMainTank()) 
end

function MutatedTangler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MutatedTangler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17346, 1, "MutatedTangler_OnCombat")
RegisterUnitEvent(17346, 2, "MutatedTangler_OnLeaveCombat")
RegisterUnitEvent(17346, 4, "MutatedTangler_OnDied")

--Myst Leecher
function MystLeecher_OnCombat(Unit, Event)
	Unit:RegisterEvent("MystLeecher_LeechPoison", 10000, 0)
end

function MystLeecher_LeechPoison(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(31288, 	pUnit:GetMainTank()) 
end

function MystLeecher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MystLeecher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17523, 1, "MystLeecher_OnCombat")
RegisterUnitEvent(17523, 2, "MystLeecher_OnLeaveCombat")
RegisterUnitEvent(17523, 4, "MystLeecher_OnDied")

--Myst Spinner
function MystSpinner_OnCombat(Unit, Event)
	Unit:RegisterEvent("MystSpinner_Web", 10000, 0)
end

function MystSpinner_Web(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(745, 	pUnit:GetMainTank()) 
end

function MystSpinner_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MystSpinner_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17522, 1, "MystSpinner_OnCombat")
RegisterUnitEvent(17522, 2, "MystSpinner_OnLeaveCombat")
RegisterUnitEvent(17522, 4, "MystSpinner_OnDied")

--Royal Blue Flutterer
function RoyalBlueFlutterer_OnCombat(Unit, Event)
	Unit:RegisterEvent("RoyalBlueFlutterer_Rake", 8000, 0)
end

function RoyalBlueFlutterer_Rake(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(36332, 	pUnit:GetMainTank()) 
end

function RoyalBlueFlutterer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RoyalBlueFlutterer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17350, 1, "RoyalBlueFlutterer_OnCombat")
RegisterUnitEvent(17350, 2, "RoyalBlueFlutterer_OnLeaveCombat")
RegisterUnitEvent(17350, 4, "RoyalBlueFlutterer_OnDied")

--Sunhawk Agent
function SunhawkAgent_OnCombat(Unit, Event)
	Unit:RegisterEvent("SunhawkAgent_Eviscerate", 10000, 0)
	Unit:RegisterEvent("SunhawkAgent_MarkoftheSunhawk", 8000, 0)
	Unit:RegisterEvent("SunhawkAgent_SinisterStrike", 6000, 0)
end

function SunhawkAgent_Eviscerate(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(15691, 	pUnit:GetMainTank()) 
end

function SunhawkAgent_MarkoftheSunhawk(pUnit, Event) 
	pUnit:CastSpell(31734) 
end

function SunhawkAgent_SinisterStrike(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(14873, 	pUnit:GetMainTank()) 
end

function SunhawkAgent_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SunhawkAgent_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17610, 1, "SunhawkAgent_OnCombat")
RegisterUnitEvent(17610, 2, "SunhawkAgent_OnLeaveCombat")
RegisterUnitEvent(17610, 4, "SunhawkAgent_OnDied")

--Sunhawk Defender
function SunhawkDefender_OnCombat(Unit, Event)
	Unit:RegisterEvent("SunhawkDefender_Cleave", 9000, 0)
	Unit:RegisterEvent("SunhawkDefender_MarkoftheSunhawk", 7500, 0)
	Unit:RegisterEvent("SunhawkDefender_Whirlwind", 6000, 0)
end

function SunhawkDefender_Cleave(pUnit, Event) 
	pUnit:CastSpell(15284) 
end

function SunhawkDefender_MarkoftheSunhawk(pUnit, Event) 
	pUnit:CastSpell(31734) 
end

function SunhawkDefender_Whirlwind(pUnit, Event) 
	pUnit:CastSpell(31738) 
end

function SunhawkDefender_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SunhawkDefender_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17607, 1, "SunhawkDefender_OnCombat")
RegisterUnitEvent(17607, 2, "SunhawkDefender_OnLeaveCombat")
RegisterUnitEvent(17607, 4, "SunhawkDefender_OnDied")

--Sunhawk Pyromancer
function SunhawkPyromancer_OnCombat(Unit, Event)
	Unit:RegisterEvent("SunhawkPyromancer_Fireball", 8000, 0)
	Unit:RegisterEvent("SunhawkPyromancer_Immolate", 6000, 1)
	Unit:RegisterEvent("SunhawkPyromancer_MarkoftheSunhawk", 7500, 0)
end

function SunhawkPyromancer_Fireball(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9053, 	pUnit:GetMainTank()) 
end

function SunhawkPyromancer_Immolate(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11962, 	pUnit:GetMainTank()) 
end

function SunhawkPyromancer_MarkoftheSunhawk(pUnit, Event) 
	pUnit:CastSpell(31734) 
end

function SunhawkPyromancer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SunhawkPyromancer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17608, 1, "SunhawkPyromancer_OnCombat")
RegisterUnitEvent(17608, 2, "SunhawkPyromancer_OnLeaveCombat")
RegisterUnitEvent(17608, 4, "SunhawkPyromancer_OnDied")

--Sunhawk Reclaimer
function SunhawkReclaimer_OnCombat(Unit, Event)
	Unit:RegisterEvent("SunhawkReclaimer_Fireball", 8000, 0)
	Unit:RegisterEvent("SunhawkReclaimer_FrostArmor", 2000, 1)
	Unit:RegisterEvent("SunhawkReclaimer_MarkoftheSunhawk", 7500, 0)
end

function SunhawkReclaimer_Fireball(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(19816, 	pUnit:GetMainTank()) 
end

function SunhawkReclaimer_FrostArmor(pUnit, Event) 
	pUnit:CastSpell(12544) 
end

function SunhawkReclaimer_MarkoftheSunhawk(pUnit, Event) 
	pUnit:CastSpell(31734) 
end

function SunhawkReclaimer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SunhawkReclaimer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17606, 1, "SunhawkReclaimer_OnCombat")
RegisterUnitEvent(17606, 2, "SunhawkReclaimer_OnLeaveCombat")
RegisterUnitEvent(17606, 4, "SunhawkReclaimer_OnDied")

--Sunhawk Saboteur
function SunhawkSaboteur_OnCombat(Unit, Event)
	Unit:RegisterEvent("SunhawkSaboteur_MarkoftheSunhawk", 7500, 0)
	Unit:RegisterEvent("SunhawkSaboteur_MultiShot", 9000, 0)
	Unit:RegisterEvent("SunhawkSaboteur_Shoot", 6000, 0)
end

function SunhawkSaboteur_MarkoftheSunhawk(pUnit, Event) 
	pUnit:CastSpell(31734) 
end

function SunhawkSaboteur_MultiShot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(14433, 	pUnit:GetMainTank()) 
end

function SunhawkSaboteur_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6660, 	pUnit:GetMainTank()) 
end

function SunhawkSaboteur_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SunhawkSaboteur_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17609, 1, "SunhawkSaboteur_OnCombat")
RegisterUnitEvent(17609, 2, "SunhawkSaboteur_OnLeaveCombat")
RegisterUnitEvent(17609, 4, "SunhawkSaboteur_OnDied")

--Sunhawk Spy
function SunhawkSpy_OnCombat(Unit, Event)
	Unit:RegisterEvent("SunhawkSpy_DemoralizingShout", 2000, 0)
	Unit:RegisterEvent("SunhawkSpy_HeroicStrike", 6000, 0)
	Unit:RegisterEvent("SunhawkSpy_MarkoftheSunhawk", 7500, 0)
end

function SunhawkSpy_DemoralizingShout(pUnit, Event) 
	pUnit:CastSpell(13730) 
end

function SunhawkSpy_HeroicStrike(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(31827, 	pUnit:GetMainTank()) 
end

function SunhawkSpy_MarkoftheSunhawk(pUnit, Event) 
	pUnit:CastSpell(31734) 
end

function SunhawkSpy_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SunhawkSpy_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17604, 1, "SunhawkSpy_OnCombat")
RegisterUnitEvent(17604, 2, "SunhawkSpy_OnLeaveCombat")
RegisterUnitEvent(17604, 4, "SunhawkSpy_OnDied")

--Thistle Lasher
function ThistleLasher_OnCombat(Unit, Event)
	Unit:RegisterEvent("ThistleLasher_Lash", 8000, 0)
end

function ThistleLasher_Lash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(31286, pUnit:GetMainTank()) 
end

function ThistleLasher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents()
end

function ThistleLasher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17343, 1, "ThistleLasher_OnCombat")
RegisterUnitEvent(17343, 2, "ThistleLasher_OnLeaveCombat")
RegisterUnitEvent(17343, 4, "ThistleLasher_OnDied")

--Veridian Broodling
function VeridianBroodling_OnCombat(Unit, Event)
	Unit:RegisterEvent("VeridianBroodling_PoisonBolt", 8000, 0)
end

function VeridianBroodling_PoisonBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(21067, pUnit:GetMainTank()) 
end

function VeridianBroodling_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function VeridianBroodling_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17589, 1, "VeridianBroodling_OnCombat")
RegisterUnitEvent(17589, 2, "VeridianBroodling_OnLeaveCombat")
RegisterUnitEvent(17589, 4, "VeridianBroodling_OnDied")

--Wrathscale Marauder
function WrathscaleMarauder_OnCombat(Unit, Event)
	Unit:RegisterEvent("WrathscaleMarauder_Pummel", 8000, 0)
end

function WrathscaleMarauder_Pummel(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12555, 	pUnit:GetMainTank()) 
end

function WrathscaleMarauder_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents()
end

function WrathscaleMarauder_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17334, 1, "WrathscaleMarauder_OnCombat")
RegisterUnitEvent(17334, 2, "WrathscaleMarauder_OnLeaveCombat")
RegisterUnitEvent(17334, 4, "WrathscaleMarauder_OnDied")

--Wrathscale Shorestalker
function WrathscaleShorestalker_OnCombat(Unit, Event)
	Unit:RegisterEvent("WrathscaleShorestalker_Strike", 6000, 0)
end

function WrathscaleShorestalker_Strike(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11976, 	pUnit:GetMainTank()) 
end

function WrathscaleShorestalker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WrathscaleShorestalker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17331, 1, "WrathscaleShorestalker_OnCombat")
RegisterUnitEvent(17331, 2, "WrathscaleShorestalker_OnLeaveCombat")
RegisterUnitEvent(17331, 4, "WrathscaleShorestalker_OnDied")

--Wrathscale Sorceress
function WrathscaleSorceress_OnCombat(Unit, Event)
	Unit:RegisterEvent("WrathscaleSorceress_Frostbolt", 8000, 0)
end

function WrathscaleSorceress_Frostbolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9672, 	pUnit:GetMainTank()) 
end

function WrathscaleSorceress_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WrathscaleSorceress_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17336, 1, "WrathscaleSorceress_OnCombat")
RegisterUnitEvent(17336, 2, "WrathscaleSorceress_OnLeaveCombat")
RegisterUnitEvent(17336, 4, "WrathscaleSorceress_OnDied")