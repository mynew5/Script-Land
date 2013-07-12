--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function OverseerGorthak_OnCombat(Unit, Event)
	Unit:RegisterEvent("OverseerGorthak_Cleave", 8000, 0)
	Unit:RegisterEvent("OverseerGorthak_ShieldBash", 6000, 0)
end

function OverseerGorthak_Cleave(pUnit, Event) 
	pUnit:CastSpell(15496) 
end

function OverseerGorthak_ShieldBash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11972, pUnit:GetMainTank()) 
end

function OverseerGorthak_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function OverseerGorthak_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17304, 1, "OverseerGorthak_OnCombat")
RegisterUnitEvent(17304, 2, "OverseerGorthak_OnLeaveCombat")
RegisterUnitEvent(17304, 4, "OverseerGorthak_OnDied")