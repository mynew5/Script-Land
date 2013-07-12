--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function UthilMooncall_OnCombat(Unit, Event)
	Unit:RegisterEvent("UthilMooncall_BearForm", 1000, 1)
	Unit:RegisterEvent("UthilMooncall_Maul", 5000, 0)
end

function UthilMooncall_BearForm(pUnit, Event) 
	pUnit:CastSpell(7090) 
end

function UthilMooncall_Maul(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12161, pUnit:GetMainTank()) 
end

function UthilMooncall_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function UthilMooncall_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3941, 1, "UthilMooncall_OnCombat")
RegisterUnitEvent(3941, 2, "UthilMooncall_OnLeaveCombat")
RegisterUnitEvent(3941, 4, "UthilMooncall_OnDied")