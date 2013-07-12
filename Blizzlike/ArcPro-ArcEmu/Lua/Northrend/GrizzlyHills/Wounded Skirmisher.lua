--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]


function WoundedSkirmisher_OnCombat(Unit, Event)
	Unit:RegisterEvent("WoundedSkirmisher_Cleave", 9000, 0)
	Unit:RegisterEvent("WoundedSkirmisher_Hamstring", 10000, 0)
	Unit:RegisterEvent("WoundedSkirmisher_MortalStrike", 7000, 0)
end

function WoundedSkirmisher_Cleave(Unit, Event) 
	Unit:CastSpell(15496) 
end

function WoundedSkirmisher_Hamstring(Unit, Event) 
	Unit:FullCastSpellOnTarget(9080, Unit:GetMainTank()) 
end

function WoundedSkirmisher_MortalStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(32736, Unit:GetMainTank()) 
end

function WoundedSkirmisher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WoundedSkirmisher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27463, 1, "WoundedSkirmisher_OnCombat")
RegisterUnitEvent(27463, 2, "WoundedSkirmisher_OnLeaveCombat")
RegisterUnitEvent(27463, 4, "WoundedSkirmisher_OnDied")