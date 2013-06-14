--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--Arkkoran Oracle
function ArkkoranOracle_OnCombat(Unit, Event)
	Unit:RegisterEvent("ArkkoranOracle_HealingWave", 13000, 0)
	Unit:RegisterEvent("ArkkoranOracle_LightningShield", 3000, 0)
	Unit:RegisterEvent("ArkkoranOracle_Shock", 5000, 0)
end

function ArkkoranOracle_HealingWave(pUnit, Event) 
	pUnit:CastSpell(11986) 
end

function ArkkoranOracle_LightningShield(pUnit, Event) 
	pUnit:CastSpell(12550) 
end

function ArkkoranOracle_Shock(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11824, 	pUnit:GetMainTank()) 
end

function ArkkoranOracle_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ArkkoranOracle_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6138, 1, "ArkkoranOracle_OnCombat")
RegisterUnitEvent(6138, 2, "ArkkoranOracle_OnLeaveCombat")
RegisterUnitEvent(6138, 4, "ArkkoranOracle_OnDied")

--Arkkoran Pincer
function ArkkoranPincer_OnCombat(Unit, Event)
	Unit:RegisterEvent("ArkkoranPincer_Rend", 10000, 0)
end

function ArkkoranPincer_Rend(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(13445, 	pUnit:GetMainTank()) 
end

function ArkkoranPincer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ArkkoranPincer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6137, 1, "ArkkoranPincer_OnCombat")
RegisterUnitEvent(6137, 2, "ArkkoranPincer_OnLeaveCombat")
RegisterUnitEvent(6137, 4, "ArkkoranPincer_OnDied")

--Blood Elf Defender
function BloodElfDefender_OnCombat(Unit, Event)
	Unit:RegisterEvent("BloodElfDefender_Revenge", 6000, 0)
	Unit:RegisterEvent("BloodElfDefender_ShieldBlock", 8000, 0)
end

function BloodElfDefender_Revenge(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12170, 	pUnit:GetMainTank()) 
end

function BloodElfDefender_ShieldBlock(pUnit, Event) 
	pUnit:CastSpell(12169) 
end

function BloodElfDefender_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BloodElfDefender_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(8581, 1, "BloodElfDefender_OnCombat")
RegisterUnitEvent(8581, 2, "BloodElfDefender_OnLeaveCombat")
RegisterUnitEvent(8581, 4, "BloodElfDefender_OnDied")

--Blood Elf Reclaimer
function BloodElfReclaimer_OnCombat(Unit, Event)
	Unit:RegisterEvent("BloodElfReclaimer_Fireball", 8000, 0)
	Unit:RegisterEvent("BloodElfReclaimer_Heal", 14000, 0)
	Unit:RegisterEvent("BloodElfReclaimer_Renew", 10000, 0)
end

function BloodElfReclaimer_Fireball(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20823, 	pUnit:GetMainTank()) 
end

function BloodElfReclaimer_Heal(pUnit, Event) 
	pUnit:CastSpell(11642) 
end

function BloodElfReclaimer_Renew(pUnit, Event) 
	pUnit:CastSpell(11640) 
end

function BloodElfReclaimer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BloodElfReclaimer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6199, 1, "BloodElfReclaimer_OnCombat")
RegisterUnitEvent(6199, 2, "BloodElfReclaimer_OnLeaveCombat")
RegisterUnitEvent(6199, 4, "BloodElfReclaimer_OnDied")

--Blood Elf Surveyor
function BloodElfSurveyor_OnCombat(Unit, Event)
	Unit:RegisterEvent("BloodElfSurveyor_FireNova", 6000, 0)
end

function BloodElfSurveyor_FireNova(pUnit, Event) 
	pUnit:CastSpell(11969) 
end

function BloodElfSurveyor_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BloodElfSurveyor_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6198, 1, "BloodElfSurveyor_OnCombat")
RegisterUnitEvent(6198, 2, "BloodElfSurveyor_OnLeaveCombat")
RegisterUnitEvent(6198, 4, "BloodElfSurveyor_OnDied")

--Cliff Thunderer
function CliffThunderer_OnCombat(Unit, Event)
	Unit:RegisterEvent("CliffThunderer_Thunderclap", 8000, 0)
end

function CliffThunderer_Thunderclap(pUnit, Event) 
	pUnit:CastSpell(8147) 
end

function CliffThunderer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CliffThunderer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6147, 1, "CliffThunderer_OnCombat")
RegisterUnitEvent(6147, 2, "CliffThunderer_OnLeaveCombat")
RegisterUnitEvent(6147, 4, "CliffThunderer_OnDied")

--Cliff Walker
function CliffWalker_OnCombat(Unit, Event)
	Unit:RegisterEvent("CliffWalker_WarStomp", 8000, 0)
end

function CliffWalker_WarStomp(pUnit, Event) 
	pUnit:CastSpell(11876) 
end

function CliffWalker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CliffWalker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6148, 1, "CliffWalker_OnCombat")
RegisterUnitEvent(6148, 2, "CliffWalker_OnLeaveCombat")
RegisterUnitEvent(6148, 4, "CliffWalker_OnDied")

--Draconic Magelord
function DraconicMagelord_OnCombat(Unit, Event)
	Unit:RegisterEvent("DraconicMagelord_FrostShock", 5000, 0)
	Unit:RegisterEvent("DraconicMagelord_Frostbolt", 8000, 0)
end

function DraconicMagelord_FrostShock(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12548, 	pUnit:GetMainTank()) 
end

function DraconicMagelord_Frostbolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9672, 	pUnit:GetMainTank()) 
end

function DraconicMagelord_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DraconicMagelord_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6129, 1, "DraconicMagelord_OnCombat")
RegisterUnitEvent(6129, 2, "DraconicMagelord_OnLeaveCombat")
RegisterUnitEvent(6129, 4, "DraconicMagelord_OnDied")

--Draconic Mageweaver
function DraconicMageweaver_OnCombat(Unit, Event)
	Unit:RegisterEvent("DraconicMageweaver_ConeofCold", 11000, 0)
	Unit:RegisterEvent("DraconicMageweaver_Frostbolt", 8000, 0)
end

function DraconicMageweaver_ConeofCold(pUnit, Event) 
	pUnit:CastSpell(12557) 
end

function DraconicMageweaver_Frostbolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9672, 	pUnit:GetMainTank()) 
end

function DraconicMageweaver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DraconicMageweaver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6131, 1, "DraconicMageweaver_OnCombat")
RegisterUnitEvent(6131, 2, "DraconicMageweaver_OnLeaveCombat")
RegisterUnitEvent(6131, 4, "DraconicMageweaver_OnDied")

--Forest Ooze
function ForestOoze_OnCombat(Unit, Event)
	Unit:RegisterEvent("ForestOoze_DiseasedSlime", 2000, 2)
end

function ForestOoze_DiseasedSlime(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6907, 	pUnit:GetMainTank()) 
end

function ForestOoze_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ForestOoze_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(8766, 1, "ForestOoze_OnCombat")
RegisterUnitEvent(8766, 2, "ForestOoze_OnLeaveCombat")
RegisterUnitEvent(8766, 4, "ForestOoze_OnDied")

--Great Wavethrasher
function GreatWavethrasher_OnCombat(Unit, Event)
	Unit:RegisterEvent("GreatWavethrasher_Thrash", 5000, 0)
end

function GreatWavethrasher_Thrash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3391, 	pUnit:GetMainTank()) 
end

function GreatWavethrasher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GreatWavethrasher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6349, 1, "GreatWavethrasher_OnCombat")
RegisterUnitEvent(6349, 2, "GreatWavethrasher_OnLeaveCombat")
RegisterUnitEvent(6349, 4, "GreatWavethrasher_OnDied")

--Haldarr Felsworn
function HaldarrFelsworn_OnCombat(Unit, Event)
	Unit:RegisterEvent("HaldarrFelsworn_ShadowBolt", 8000, 0)
end

function HaldarrFelsworn_ShadowBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20825, 	pUnit:GetMainTank()) 
end

function HaldarrFelsworn_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HaldarrFelsworn_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6127, 1, "HaldarrFelsworn_OnCombat")
RegisterUnitEvent(6127, 2, "HaldarrFelsworn_OnLeaveCombat")
RegisterUnitEvent(6127, 4, "HaldarrFelsworn_OnDied")

--Haldarr Trickster
function HaldarrTrickster_OnCombat(Unit, Event)
	Unit:RegisterEvent("HaldarrTrickster_CurseofMending", 8000, 0)
end

function HaldarrTrickster_CurseofMending(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(7098, 	pUnit:GetMainTank()) 
end

function HaldarrTrickster_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HaldarrTrickster_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6126, 1, "HaldarrTrickster_OnCombat")
RegisterUnitEvent(6126, 2, "HaldarrTrickster_OnLeaveCombat")
RegisterUnitEvent(6126, 4, "HaldarrTrickster_OnDied")

--Highborne Lichling
function HighborneLichling_OnCombat(Unit, Event)
	Unit:RegisterEvent("HighborneLichling_FrostArmor", 1000, 2)
	Unit:RegisterEvent("HighborneLichling_Frostbolt", 8000, 0)
end

function HighborneLichling_FrostArmor(pUnit, Event) 
	pUnit:CastSpell(12544) 
end

function HighborneLichling_Frostbolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20822, 	pUnit:GetMainTank()) 
end

function HighborneLichling_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HighborneLichling_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6117, 1, "HighborneLichling_OnCombat")
RegisterUnitEvent(6117, 2, "HighborneLichling_OnLeaveCombat")
RegisterUnitEvent(6117, 4, "HighborneLichling_OnDied")

--Legashi Hellcaller
function LegashiHellcaller_OnCombat(Unit, Event)
	Unit:RegisterEvent("LegashiHellcaller_Fireball", 8000, 0)
end

function LegashiHellcaller_Fireball(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20823, 	pUnit:GetMainTank()) 
end

function LegashiHellcaller_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LegashiHellcaller_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6202, 1, "LegashiHellcaller_OnCombat")
RegisterUnitEvent(6202, 2, "LegashiHellcaller_OnLeaveCombat")
RegisterUnitEvent(6202, 4, "LegashiHellcaller_OnDied")

--Legashi Rogue
function LegashiRogue_OnCombat(Unit, Event)
	Unit:RegisterEvent("LegashiRogue_Gouge", 10000, 0)
end

function LegashiRogue_Gouge(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12540, 	pUnit:GetMainTank()) 
end

function LegashiRogue_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LegashiRogue_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6201, 1, "LegashiRogue_OnCombat")
RegisterUnitEvent(6201, 2, "LegashiRogue_OnLeaveCombat")
RegisterUnitEvent(6201, 4, "LegashiRogue_OnDied")

--Legashi Satyr
function LegashiSatyr_OnCombat(Unit, Event)
	Unit:RegisterEvent("LegashiSatyr_ManaBurn", 8000, 0)
end

function LegashiSatyr_ManaBurn(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11981, 	pUnit:GetRandomPlayer(4)) 
end

function LegashiSatyr_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LegashiSatyr_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6200, 1, "LegashiSatyr_OnCombat")
RegisterUnitEvent(6200, 2, "LegashiSatyr_OnLeaveCombat")
RegisterUnitEvent(6200, 4, "LegashiSatyr_OnDied")

--Lingering Highborne
function LingeringHighborne_OnCombat(Unit, Event)
	Unit:RegisterEvent("LingeringHighborne_Enfeeble", 8000, 0)
end

function LingeringHighborne_Enfeeble(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11963, 	pUnit:GetMainTank()) 
end

function LingeringHighborne_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LingeringHighborne_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7864, 1, "LingeringHighborne_OnCombat")
RegisterUnitEvent(7864, 2, "LingeringHighborne_OnLeaveCombat")
RegisterUnitEvent(7864, 4, "LingeringHighborne_OnDied")

--Makrinni Razorclaw
function MakrinniRazorclaw_OnCombat(Unit, Event)
	Unit:RegisterEvent("MakrinniRazorclaw_SunderArmor", 5000, 0)
end

function MakrinniRazorclaw_SunderArmor(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(13444, 	pUnit:GetMainTank()) 
end

function MakrinniRazorclaw_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MakrinniRazorclaw_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6350, 1, "MakrinniRazorclaw_OnCombat")
RegisterUnitEvent(6350, 2, "MakrinniRazorclaw_OnLeaveCombat")
RegisterUnitEvent(6350, 4, "MakrinniRazorclaw_OnDied")

--Makrinni Scrabbler
function MakrinniScrabbler_OnCombat(Unit, Event)
	Unit:RegisterEvent("MakrinniScrabbler_Frostbolt", 8000, 0)
	Unit:RegisterEvent("MakrinniScrabbler_Heal", 14000, 0)
end

function MakrinniScrabbler_Frostbolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20822, 	pUnit:GetMainTank()) 
end

function MakrinniScrabbler_Heal(pUnit, Event) 
	pUnit:CastSpell(11642) 
end

function MakrinniScrabbler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MakrinniScrabbler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6370, 1, "MakrinniScrabbler_OnCombat")
RegisterUnitEvent(6370, 2, "MakrinniScrabbler_OnLeaveCombat")
RegisterUnitEvent(6370, 4, "MakrinniScrabbler_OnDied")

--Makrinni Snapclaw
function MakrinniSnapclaw_OnCombat(Unit, Event)
	Unit:RegisterEvent("MakrinniSnapclaw_TendonRip", 10000, 0)
end

function MakrinniSnapclaw_TendonRip(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3604, 	pUnit:GetMainTank()) 
end

function MakrinniSnapclaw_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MakrinniSnapclaw_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6372, 1, "MakrinniSnapclaw_OnCombat")
RegisterUnitEvent(6372, 2, "MakrinniSnapclaw_OnLeaveCombat")
RegisterUnitEvent(6372, 4, "MakrinniSnapclaw_OnDied")

--Mammoth Shark
function MammothShark_OnCombat(Unit, Event)
	Unit:RegisterEvent("MammothShark_Thrash", 5000, 0)
end

function MammothShark_Thrash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3391, 	pUnit:GetMainTank()) 
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

--Mistwing Ravager
function MistwingRavager_OnCombat(Unit, Event)
	Unit:RegisterEvent("MistwingRavager_PoisonedShot", 10000, 0)
end

function MistwingRavager_PoisonedShot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(8806, 	pUnit:GetMainTank()) 
end

function MistwingRavager_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MistwingRavager_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(8764, 1, "MistwingRavager_OnCombat")
RegisterUnitEvent(8764, 2, "MistwingRavager_OnLeaveCombat")
RegisterUnitEvent(8764, 4, "MistwingRavager_OnDied")

--Mistwing Rogue
function MistwingRogue_OnCombat(Unit, Event)
	Unit:RegisterEvent("MistwingRogue_LightningBolt", 8000, 0)
end

function MistwingRogue_LightningBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9532, 	pUnit:GetMainTank()) 
end

function MistwingRogue_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MistwingRogue_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(8763, 1, "MistwingRogue_OnCombat")
RegisterUnitEvent(8763, 2, "MistwingRogue_OnLeaveCombat")
RegisterUnitEvent(8763, 4, "MistwingRogue_OnDied")

--Mossho of Courser
function MosshoofCourser_OnCombat(Unit, Event)
	Unit:RegisterEvent("MosshoofCourser_Enrage", 10000, 0)
end

function MosshoofCourser_Enrage(pUnit, Event) 
	pUnit:CastSpell(8599) 
end

function MosshoofCourser_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MosshoofCourser_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(8761, 1, "MosshoofCourser_OnCombat")
RegisterUnitEvent(8761, 2, "MosshoofCourser_OnLeaveCombat")
RegisterUnitEvent(8761, 4, "MosshoofCourser_OnDied")

--Spitelash Enchantress
function SpitelashEnchantress_OnCombat(Unit, Event)
	Unit:RegisterEvent("SpitelashEnchantress_EnchantedQuickness", 10000, 0)
	Unit:RegisterEvent("SpitelashEnchantress_FrostShock", 6000, 0)
end

function SpitelashEnchantress_EnchantedQuickness(pUnit, Event) 
	pUnit:CastSpell(3443) 
end

function SpitelashEnchantress_FrostShock(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12548, 	pUnit:GetMainTank()) 
end

function SpitelashEnchantress_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SpitelashEnchantress_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7186, 1, "SpitelashEnchantress_OnCombat")
RegisterUnitEvent(7186, 2, "SpitelashEnchantress_OnLeaveCombat")
RegisterUnitEvent(7186, 4, "SpitelashEnchantress_OnDied")

--Spitelash Myrmidon
function SpitelashMyrmidon_OnCombat(Unit, Event)
	Unit:RegisterEvent("SpitelashMyrmidon_Strike", 5000, 0)
end

function SpitelashMyrmidon_Strike(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11976, 	pUnit:GetMainTank()) 
end

function SpitelashMyrmidon_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SpitelashMyrmidon_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6196, 1, "SpitelashMyrmidon_OnCombat")
RegisterUnitEvent(6196, 2, "SpitelashMyrmidon_OnLeaveCombat")
RegisterUnitEvent(6196, 4, "SpitelashMyrmidon_OnDied")

--Spitelash Raider
function SpitelashRaider_OnCombat(Unit, Event)
	Unit:RegisterEvent("SpitelashRaider_FrostShock", 6000, 0)
end

function SpitelashRaider_FrostShock(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12548, 	pUnit:GetMainTank()) 
end

function SpitelashRaider_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SpitelashRaider_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12204, 1, "SpitelashRaider_OnCombat")
RegisterUnitEvent(12204, 2, "SpitelashRaider_OnLeaveCombat")
RegisterUnitEvent(12204, 4, "SpitelashRaider_OnDied")

--Spitelash Screamer
function SpitelashScreamer_OnCombat(Unit, Event)
	Unit:RegisterEvent("SpitelashScreamer_DeafeningScreech", 12000, 0)
end

function SpitelashScreamer_DeafeningScreech(pUnit, Event) 
	pUnit:CastSpell(3589) 
end

function SpitelashScreamer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SpitelashScreamer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6193, 1, "SpitelashScreamer_OnCombat")
RegisterUnitEvent(6193, 2, "SpitelashScreamer_OnLeaveCombat")
RegisterUnitEvent(6193, 4, "SpitelashScreamer_OnDied")

--Spitelash Serpent Guard
function SpitelashSerpentGuard_OnCombat(Unit, Event)
	Unit:RegisterEvent("SpitelashSerpentGuard_FrostShock", 6000, 0)
end

function SpitelashSerpentGuard_FrostShock(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12548, 	pUnit:GetMainTank()) 
end

function SpitelashSerpentGuard_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SpitelashSerpentGuard_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6194, 1, "SpitelashSerpentGuard_OnCombat")
RegisterUnitEvent(6194, 2, "SpitelashSerpentGuard_OnLeaveCombat")
RegisterUnitEvent(6194, 4, "SpitelashSerpentGuard_OnDied")

--Spitelash Siren
function SpitelashSiren_OnCombat(Unit, Event)
	Unit:RegisterEvent("SpitelashSiren_Shoot", 6000, 0)
	Unit:RegisterEvent("SpitelashSiren_Renew", 10000, 0)
	Unit:RegisterEvent("SpitelashSiren_FrostNova", 8000, 0)
	Unit:RegisterEvent("SpitelashSiren_FrostShot", 9000, 0)
end

function SpitelashSiren_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6660, 	pUnit:GetMainTank()) 
end

function SpitelashSiren_Renew(pUnit, Event) 
	pUnit:CastSpell(11640) 
end

function SpitelashSiren_FrostNova(pUnit, Event) 
	pUnit:CastSpell(11831) 
end

function SpitelashSiren_FrostShot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12551, 	pUnit:GetMainTank()) 
end

function SpitelashSiren_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SpitelashSiren_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6195, 1, "SpitelashSiren_OnCombat")
RegisterUnitEvent(6195, 2, "SpitelashSiren_OnLeaveCombat")
RegisterUnitEvent(6195, 4, "SpitelashSiren_OnDied")

--Spitelash Warrior
function SpitelashWarrior_OnCombat(Unit, Event)
	Unit:RegisterEvent("SpitelashWarrior_Disarm", 8000, 0)
end

function SpitelashWarrior_Disarm(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6713, 	pUnit:GetMainTank()) 
end

function SpitelashWarrior_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SpitelashWarrior_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6190, 1, "SpitelashWarrior_OnCombat")
RegisterUnitEvent(6190, 2, "SpitelashWarrior_OnLeaveCombat")
RegisterUnitEvent(6190, 4, "SpitelashWarrior_OnDied")

--Spitelash Witch
function SpitelashWitch_OnCombat(Unit, Event)
	Unit:RegisterEvent("SpitelashWitch_ForkedLightning", 5000, 0)
	Unit:RegisterEvent("SpitelashWitch_LightningShield", 9000, 0)
	Unit:RegisterEvent("SpitelashWitch_Frostbolt", 7000, 0)
end

function SpitelashWitch_ForkedLightning(pUnit, Event) 
	pUnit:CastSpell(20299) 
end

function SpitelashWitch_LightningShield(pUnit, Event) 
	pUnit:CastSpell(12550) 
end

function SpitelashWitch_Frostbolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20297, 	pUnit:GetMainTank()) 
end

function SpitelashWitch_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SpitelashWitch_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12205, 1, "SpitelashWitch_OnCombat")
RegisterUnitEvent(12205, 2, "SpitelashWitch_OnLeaveCombat")
RegisterUnitEvent(12205, 4, "SpitelashWitch_OnDied")

--Storm Bay Oracle
function StormBayOracle_OnCombat(Unit, Event)
	Unit:RegisterEvent("StormBayOracle_LightningBolt", 8000, 0)
end

function StormBayOracle_LightningBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9532, 	pUnit:GetMainTank()) 
end

function StormBayOracle_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function StormBayOracle_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6351, 1, "StormBayOracle_OnCombat")
RegisterUnitEvent(6351, 2, "StormBayOracle_OnLeaveCombat")
RegisterUnitEvent(6351, 4, "StormBayOracle_OnDied")

--Storm Bay Warrior
function StormBayWarrior_OnCombat(Unit, Event)
	Unit:RegisterEvent("StormBayWarrior_Pummel", 9000, 0)
	Unit:RegisterEvent("StormBayWarrior_Strike", 6000, 0)
end

function StormBayWarrior_Pummel(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12555, 	pUnit:GetMainTank()) 
end

function StormBayWarrior_Strike(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11976, 	pUnit:GetMainTank()) 
end

function StormBayWarrior_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function StormBayWarrior_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6371, 1, "StormBayWarrior_OnCombat")
RegisterUnitEvent(6371, 2, "StormBayWarrior_OnLeaveCombat")
RegisterUnitEvent(6371, 4, "StormBayWarrior_OnDied")

--Thunderhead Consort
function ThunderheadConsort_OnCombat(Unit, Event)
	Unit:RegisterEvent("ThunderheadConsort_LightningBreath", 8000, 0)
end

function ThunderheadConsort_LightningBreath(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(36594, 	pUnit:GetMainTank()) 
end

function ThunderheadConsort_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ThunderheadConsort_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6380, 1, "ThunderheadConsort_OnCombat")
RegisterUnitEvent(6380, 2, "ThunderheadConsort_OnLeaveCombat")
RegisterUnitEvent(6380, 4, "ThunderheadConsort_OnDied")

--Thunderhead Hippogryph
function ThunderheadHippogryph_OnCombat(Unit, Event)
	Unit:RegisterEvent("ThunderheadHippogryph_Shock", 6000, 0)
end

function ThunderheadHippogryph_Shock(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12553, 	pUnit:GetMainTank()) 
end

function ThunderheadHippogryph_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ThunderheadHippogryph_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6375, 1, "ThunderheadHippogryph_OnCombat")
RegisterUnitEvent(6375, 2, "ThunderheadHippogryph_OnLeaveCombat")
RegisterUnitEvent(6375, 4, "ThunderheadHippogryph_OnDied")

--Thunderhead Patriarch
function ThunderheadPatriarch_OnCombat(Unit, Event)
	Unit:RegisterEvent("ThunderheadPatriarch_Shock", 6000, 0)
	Unit:RegisterEvent("ThunderheadPatriarch_RushingCharge", 8000, 0)
end

function ThunderheadPatriarch_Shock(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12553, 	pUnit:GetMainTank()) 
end

function ThunderheadPatriarch_RushingCharge(pUnit, Event) 
	pUnit:CastSpell(6268) 
end

function ThunderheadPatriarch_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ThunderheadPatriarch_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6379, 1, "ThunderheadPatriarch_OnCombat")
RegisterUnitEvent(6379, 2, "ThunderheadPatriarch_OnLeaveCombat")
RegisterUnitEvent(6379, 4, "ThunderheadPatriarch_OnDied")

--Thunderhead Skystormer
function ThunderheadSkystormer_OnCombat(Unit, Event)
	Unit:RegisterEvent("ThunderheadSkystormer_Shock", 6000, 0)
	Unit:RegisterEvent("ThunderheadSkystormer_LightningCloud", 10000, 0)
end

function ThunderheadSkystormer_Shock(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12553, 	pUnit:GetMainTank()) 
end

function ThunderheadSkystormer_LightningCloud(pUnit, Event) 
	pUnit:CastSpell(6535) 
end

function ThunderheadSkystormer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ThunderheadSkystormer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6378, 1, "ThunderheadSkystormer_OnCombat")
RegisterUnitEvent(6378, 2, "ThunderheadSkystormer_OnLeaveCombat")
RegisterUnitEvent(6378, 4, "ThunderheadSkystormer_OnDied")

--Thunderhead Stagwing
function ThunderheadStagwing_OnCombat(Unit, Event)
	Unit:RegisterEvent("ThunderheadStagwing_Shock", 6000, 0)
	Unit:RegisterEvent("ThunderheadStagwing_WingFlap", 8000, 0)
end

function ThunderheadStagwing_Shock(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12553, 	pUnit:GetMainTank()) 
end

function ThunderheadStagwing_WingFlap(pUnit, Event) 
	pUnit:CastSpell(11019) 
end

function ThunderheadStagwing_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ThunderheadStagwing_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6377, 1, "ThunderheadStagwing_OnCombat")
RegisterUnitEvent(6377, 2, "ThunderheadStagwing_OnLeaveCombat")
RegisterUnitEvent(6377, 4, "ThunderheadStagwing_OnDied")

--Thundering Invader
function ThunderingInvader_OnCombat(Unit, Event)
	Unit:RegisterEvent("ThunderingInvader_EarthShock", 6000, 0)
	Unit:RegisterEvent("ThunderingInvader_Knockdown", 8000, 0)
end

function ThunderingInvader_EarthShock(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(23114, 	pUnit:GetMainTank()) 
end

function ThunderingInvader_Knockdown(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11428, 	pUnit:GetMainTank()) 
end

function ThunderingInvader_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ThunderingInvader_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14462, 1, "ThunderingInvader_OnCombat")
RegisterUnitEvent(14462, 2, "ThunderingInvader_OnLeaveCombat")
RegisterUnitEvent(14462, 4, "ThunderingInvader_OnDied")

--Timbermaw Den Watcher
function TimbermawDenWatcher_OnCombat(Unit, Event)
	Unit:RegisterEvent("TimbermawDenWatcher_BattleShout", 5000, 0)
end

function TimbermawDenWatcher_BattleShout(pUnit, Event) 
	pUnit:CastSpell(9128) 
end

function TimbermawDenWatcher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TimbermawDenWatcher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6187, 1, "TimbermawDenWatcher_OnCombat")
RegisterUnitEvent(6187, 2, "TimbermawDenWatcher_OnLeaveCombat")
RegisterUnitEvent(6187, 4, "TimbermawDenWatcher_OnDied")

--Timbermaw Pathfinder
function TimbermawPathfinder_OnCombat(Unit, Event)
	Unit:RegisterEvent("TimbermawPathfinder_FaerieFire", 10000, 0)
end

function TimbermawPathfinder_FaerieFire(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(16498, 	pUnit:GetMainTank()) 
end

function TimbermawPathfinder_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TimbermawPathfinder_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6184, 1, "TimbermawPathfinder_OnCombat")
RegisterUnitEvent(6184, 2, "TimbermawPathfinder_OnLeaveCombat")
RegisterUnitEvent(6184, 4, "TimbermawPathfinder_OnDied")

--Timbermaw Shaman
function TimbermawShaman_OnCombat(Unit, Event)
	Unit:RegisterEvent("TimbermawShaman_LightningBolt", 8000, 0)
end

function TimbermawShaman_LightningBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20295, 	pUnit:GetMainTank()) 
end

function TimbermawShaman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TimbermawShaman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6188, 1, "TimbermawShaman_OnCombat")
RegisterUnitEvent(6188, 2, "TimbermawShaman_OnLeaveCombat")
RegisterUnitEvent(6188, 4, "TimbermawShaman_OnDied")

--Timbermaw Totemic
function TimbermawTotemic_OnCombat(Unit, Event)
	Unit:RegisterEvent("TimbermawTotemic_HealingWard", 13000, 0)
end

function TimbermawTotemic_HealingWard(pUnit, Event) 
	pUnit:CastSpell(5605) 
end

function TimbermawTotemic_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TimbermawTotemic_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6186, 1, "TimbermawTotemic_OnCombat")
RegisterUnitEvent(6186, 2, "TimbermawTotemic_OnLeaveCombat")
RegisterUnitEvent(6186, 4, "TimbermawTotemic_OnDied")

--Timbermaw Ursa
function TimbermawUrsa_OnCombat(Unit, Event)
	Unit:RegisterEvent("TimbermawUrsa_Thunderclap", 8000, 0)
end

function TimbermawUrsa_Thunderclap(pUnit, Event) 
	pUnit:CastSpell(8078) 
end

function TimbermawUrsa_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TimbermawUrsa_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6189, 1, "TimbermawUrsa_OnCombat")
RegisterUnitEvent(6189, 2, "TimbermawUrsa_OnLeaveCombat")
RegisterUnitEvent(6189, 4, "TimbermawUrsa_OnDied")

--Timbermaw Warrior
function TimbermawWarrior_OnCombat(Unit, Event)
	Unit:RegisterEvent("TimbermawWarrior_Rend", 10000, 0)
	Unit:RegisterEvent("TimbermawWarrior_Strike", 6000, 0)
end

function TimbermawWarrior_Rend(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11977, 	pUnit:GetMainTank()) 
end

function TimbermawWarrior_Strike(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11976, 	pUnit:GetMainTank()) 
end

function TimbermawWarrior_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TimbermawWarrior_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6185, 1, "TimbermawWarrior_OnCombat")
RegisterUnitEvent(6185, 2, "TimbermawWarrior_OnLeaveCombat")
RegisterUnitEvent(6185, 4, "TimbermawWarrior_OnDied")

--Timberweb Recluse
function TimberwebRecluse_OnCombat(Unit, Event)
	Unit:RegisterEvent("TimberwebRecluse_Web", 10000, 0)
end

function TimberwebRecluse_Web(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(745, 	pUnit:GetMainTank()) 
end

function TimberwebRecluse_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TimberwebRecluse_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(8762, 1, "TimberwebRecluse_OnCombat")
RegisterUnitEvent(8762, 2, "TimberwebRecluse_OnLeaveCombat")
RegisterUnitEvent(8762, 4, "TimberwebRecluse_OnDied")

--Wavethrasher
function Wavethrasher_OnCombat(Unit, Event)
	Unit:RegisterEvent("Wavethrasher_Thrash", 5000, 0)
end

function Wavethrasher_Thrash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3391, 	pUnit:GetMainTank()) 
end

function Wavethrasher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Wavethrasher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6348, 1, "Wavethrasher_OnCombat")
RegisterUnitEvent(6348, 2, "Wavethrasher_OnLeaveCombat")
RegisterUnitEvent(6348, 4, "Wavethrasher_OnDied")

--Young Wavethrasher
function YoungWavethrasher_OnCombat(Unit, Event)
	Unit:RegisterEvent("YoungWavethrasher_Thrash", 5000, 0)
end

function YoungWavethrasher_Thrash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3391, 	pUnit:GetMainTank()) 
end

function YoungWavethrasher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function YoungWavethrasher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6347, 1, "YoungWavethrasher_OnCombat")
RegisterUnitEvent(6347, 2, "YoungWavethrasher_OnLeaveCombat")
RegisterUnitEvent(6347, 4, "YoungWavethrasher_OnDied")