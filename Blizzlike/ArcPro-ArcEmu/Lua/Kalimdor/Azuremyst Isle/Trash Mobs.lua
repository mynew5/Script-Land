--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Justin, Yerney; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--Abberant Owlbeast
function AbberantOwlBeast_OnCombat(Unit, Event)
	Unit:RegisterEvent("AbberantOwlBeast_Spellname", 12000, 0)
end

function AbberantOwlBeast_Spellname(pUnit, Event)
	pUnit:FullCastSpellOnTarget(31270, pUnit:GetClosestPlayer()) 
end

function AbberantOwlBeast_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function AbberantOwlBeast_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17187, 1, "AbberantOwlBeast_OnCombat")
RegisterUnitEvent(17187, 2, "AbberantOwlBeast_OnLeaveCombat")
RegisterUnitEvent(17187, 4, "AbberantOwlBeast_OnDied")

--Barbed Crawler
function BarbedCrawler_OnCombat(Unit, Event)
	Unit:RegisterEvent("BarbedCrawler_Thorns", 2000, 2)
end

function BarbedCrawler_Thorns(pUnit, Event) 
	pUnit:CastSpell(31271) 
end

function BarbedCrawler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BarbedCrawler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17217, 1, "BarbedCrawler_OnCombat")
RegisterUnitEvent(17217, 2, "BarbedCrawler_OnLeaveCombat")
RegisterUnitEvent(17217, 4, "BarbedCrawler_OnDied")

--Blood Elf Bandit
function BloodElfBandit_OnCombat(Unit, Event)
	Unit:RegisterEvent("BloodElfBandit_Spellname", 3000, 0)
	Unit:RegisterEvent("BloodElfBandit_Spellnamq", 6000, 0)
end

function BloodElfBandit_Spellname(pUnit, Event)
	pUnit:CastSpellOnTarget(14873, pUnit:GetClosestPlayer()) 
end

function BloodElfBandit_Spellnamq(pUnit, Event)
	pUnit:CastSpellOnTarget(15691, pUnit:GetClosestPlayer())
end

function BloodElfBandit_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function BloodElfBandit_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17591, 1, "BloodElfBandit_OnCombat")
RegisterUnitEvent(17591, 2, "BloodElfBandit_OnLeaveCombat")
RegisterUnitEvent(17591, 4, "BloodElfBandit_OnDied")

--Blood Elf Scout
function BloodElfScout_OnCombat(Unit, Event)
	Unit:RegisterEvent("BloodElfScout_Spellname", 12000, 0)
end

function BloodElfScout_Spellname(pUnit, Event)
	pUnit:CastSpellOnTarget(25602, pUnit:GetRandomPlayer(0))
end

function BloodElfScout_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function BloodElfScout_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(16521, 1, "BloodElfScout_OnCombat")
RegisterUnitEvent(16521, 2, "BloodElfScout_OnLeaveCombat")
RegisterUnitEvent(16521, 4, "BloodElfScout_OnDied")

--BristleLimb WindCaller
function BristleLimbWindCaller_OnCombat(Unit, Event)
	Unit:RegisterEvent("BristleLimbWindCaller_Reju", 1000, 0)
	Unit:RegisterEvent("BristleLimbWindCaller_WindShock", 7000, 1)
end

function BristleLimbWindCaller_Reju(Unit, Event)
	if(Unit:GetHealthPct() < 15) then
		Unit:CastSpell(32131)
	end
end

function BristleLimbWindCaller_WindShock(pUnit, Event)
	pUnit:FullCastSpellOnTarget(31272, pUnit:GetClosestPlayer())
end

function BristleLimbWindCaller_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function BristleLimbWindCaller_OnDead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17184, 1, "BristleLimbWindCaller_OnCombat")
RegisterUnitEvent(17184, 2, "BristleLimbWindCaller_OnLeaveCombat")
RegisterUnitEvent(17184, 4, "BristleLimbWindCaller_OnDead")

--Death Ravager
function DeathRavager_OnCombat(Unit, Event)
	Unit:RegisterEvent("DeathRavager_EnragingBite", 6000, 0)
	Unit:RegisterEvent("DeathRavager_Rend", 8000, 0)
end

function DeathRavager_EnragingBite(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(30736, 	pUnit:GetMainTank()) 
end

function DeathRavager_Rend(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(13443, 	pUnit:GetMainTank()) 
end

function DeathRavager_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DeathRavager_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17556, 1, "DeathRavager_OnCombat")
RegisterUnitEvent(17556, 2, "DeathRavager_OnLeaveCombat")
RegisterUnitEvent(17556, 4, "DeathRavager_OnDied")

--Moongraze Buck
function MoongrazeBuck_OnCombat(Unit, Event)
	Unit:RegisterEvent("MoongrazeBuck_Knockdown", 7000, 0)
end

function MoongrazeBuck_Knockdown(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(31274, 	pUnit:GetMainTank()) 
end

function MoongrazeBuck_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MoongrazeBuck_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17201, 1, "MoongrazeBuck_OnCombat")
RegisterUnitEvent(17201, 2, "MoongrazeBuck_OnLeaveCombat")
RegisterUnitEvent(17201, 4, "MoongrazeBuck_OnDied")

--Queldorei Magewraith
function QueldoreiMagewraith_OnCombat(Unit, Event)
	Unit:RegisterEvent("QueldoreiMagewraith_ArcaneBolt", 6000, 0)
	Unit:RegisterEvent("QueldoreiMagewraith_Counterspell", 11000, 0)
	Unit:RegisterEvent("QueldoreiMagewraith_Fireball", 8000, 0)
	Unit:RegisterEvent("QueldoreiMagewraith_Slow", 4000, 1)
end

function QueldoreiMagewraith_ArcaneBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(31595, 	pUnit:GetMainTank()) 
end

function QueldoreiMagewraith_Counterspell(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(31596, 	pUnit:GetMainTank()) 
end

function QueldoreiMagewraith_Fireball(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11921, 	pUnit:GetMainTank()) 
end

function QueldoreiMagewraith_Slow(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11436, 	pUnit:GetMainTank()) 
end

function QueldoreiMagewraith_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function QueldoreiMagewraith_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17612, 1, "QueldoreiMagewraith_OnCombat")
RegisterUnitEvent(17612, 2, "QueldoreiMagewraith_OnLeaveCombat")
RegisterUnitEvent(17612, 4, "QueldoreiMagewraith_OnDied")

--Raving Owlbeast
function RavingOwlbeast_OnCombat(Unit, Event)
	Unit:RegisterEvent("RavingOwlbeast_Enrage", 10000, 0)
end

function RavingOwlbeast_Enrage(pUnit, Event) 
	pUnit:CastSpell(8599) 
end

function RavingOwlbeast_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RavingOwlbeast_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17188, 1, "RavingOwlbeast_OnCombat")
RegisterUnitEvent(17188, 2, "RavingOwlbeast_OnLeaveCombat")
RegisterUnitEvent(17188, 4, "RavingOwlbeast_OnDied")

--Ravager Specimen
function RavagerSpecimen_OnCombat(Unit, Event)
	Unit:RegisterEvent("RavagerSpecimen_Spellname", 4000, 0)
end

function RavagerSpecimen_Spellname(pUnit, Event)
	pUnit:CastSpellOnTarget(13443, pUnit:GetClosestPlayer())
end

function RavagerSpecimen_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function RavagerSpecimen_OnLeaveCombat(Unit, Event)
Unit:RemoveEvents()
end

RegisterUnitEvent(17199, 1, "RavagerSpecimen_OnCombat")
RegisterUnitEvent(17199, 2, "RavagerSpecimen_OnLeaveCombat")
RegisterUnitEvent(17199, 4, "RavagerSpecimen_OnDied")

--Siltfin Hunter
function SiltfinHunter_OnCombat(Unit, Event)
	Unit:RegisterEvent("SiltfinHunter_Throw", 4000, 0)
end

function SiltfinHunter_Throw(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(10277, 	pUnit:GetMainTank()) 
end

function SiltfinHunter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SiltfinHunter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17192, 1, "SiltfinHunter_OnCombat")
RegisterUnitEvent(17192, 2, "SiltfinHunter_OnLeaveCombat")
RegisterUnitEvent(17192, 4, "SiltfinHunter_OnDied")

--Siltfin Oracle
function SiltfinOracle_OnCombat(Unit, Event)
	Unit:RegisterEvent("SiltfinOracle_LightningShield", 5000, 0)
	Unit:RegisterEvent("SiltfinOracle_Wrath", 8000, 0)
end

function SiltfinOracle_LightningShield(pUnit, Event) 
	pUnit:CastSpell(12550) 
end

function SiltfinOracle_Wrath(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9739, 	pUnit:GetMainTank()) 
end

function SiltfinOracle_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SiltfinOracle_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17191, 1, "SiltfinOracle_OnCombat")
RegisterUnitEvent(17191, 2, "SiltfinOracle_OnLeaveCombat")
RegisterUnitEvent(17191, 4, "SiltfinOracle_OnDied")

--Wrath Scale Myrmidon
function WrathScaleMyrmidon_OnCombat(Unit, Event)
	Unit:RegisterEvent("WrathScaleMyrmidon_Strike", 5000, 0)
end

function WrathScaleMyrmidon_Strike(pUnit, Event)
	pUnit:FullCastSpellOnTarget(31272, pUnit:GetClosestPlayer())
end

function WrathScaleMyrmidon_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function WrathScaleMyrmidon_OnDead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17194, 1, "WrathScaleMyrmidon_OnCombat")
RegisterUnitEvent(17194, 2, "WrathScaleMyrmidon_OnLeaveCombat")
RegisterUnitEvent(17194, 4, "WrathScaleMyrmidon_OnDead")

--Wrath Scale Nage
function WrathScaleNage_OnCombat(Unit, Event)
	Unit:RegisterEvent("WrathScaleNage_Strike", 12000, 1)
end

function WrathScaleNage_Strike(pUnit, Event)
	pUnit:FullCastSpellOnTarget(9080, pUnit:GetClosestPlayer())
end

function WrathScaleNage_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function WrathScaleNage_OnDead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17193, 1, "WrathScaleNage_OnCombat")
RegisterUnitEvent(17193, 2, "WrathScaleNage_OnLeaveCombat")
RegisterUnitEvent(17193, 4, "WrathScaleNage_OnDead")

--WrathScaleSiren
function WrathScaleSiren_OnCombat(Unit, Event)
	Unit:RegisterEvent("WrathScaleSiren_Scream", 12000, 1)
end

function WrathScaleSiren_Scream(pUnit, Event)
	pUnit:CastSpell(31273)
end

function WrathScaleSiren_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function WrathScaleSiren_OnDead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17195, 1, "WrathScaleSiren_OnCombat")
RegisterUnitEvent(17195, 2, "WrathScaleSiren_OnLeaveCombat")
RegisterUnitEvent(17195, 4, "WrathScaleSiren_OnDead")