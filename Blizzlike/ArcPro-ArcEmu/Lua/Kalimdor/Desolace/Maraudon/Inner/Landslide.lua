--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Landslide_OnCombat(Unit, Event)
	Unit:RegisterEvent("Trample", 7000, 0)
	Unit:RegisterEvent("Knock", 14000, 0)
	Unit:RegisterEvent("Landslide", 14000, 0)
end

function Trample(pUnit, Event) 
	pUnit:CastSpellOnTarget(5568, pUnit:GetMainTank()) 
end

function Knock(pUnit, Event) 
	pUnit:CastSpellOnTarget(18670, pUnit:GetMainTank()) 
end

function Landslide(pUnit, Event) 
	pUnit:FullCastSpell(21808) 
end

function Landslide_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Landslide_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12203, 1, "Landslide_OnCombat")
RegisterUnitEvent(12203, 2, "Landslide_OnLeaveCombat")
RegisterUnitEvent(12203, 4, "Landslide_OnDied")