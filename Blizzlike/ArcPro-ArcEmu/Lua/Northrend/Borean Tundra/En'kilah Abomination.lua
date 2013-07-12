--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function EnkilahAbomination_OnCombat(Unit, Event)
	Unit:RegisterEvent("EnkilahAbomination_Cleave", 8000, 0)
	Unit:RegisterEvent("EnkilahAbomination_ScourgeHook", 6000, 0)
end

function EnkilahAbomination_Cleave(Unit, Event) 
	Unit:CastSpell(40504) 
end

function EnkilahAbomination_ScourgeHook(Unit, Event) 
	Unit:FullCastSpellOnTarget(50335, Unit:GetMainTank()) 
end

function EnkilahAbomination_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function EnkilahAbomination_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25383, 1, "EnkilahAbomination_OnCombat")
RegisterUnitEvent(25383, 2, "EnkilahAbomination_OnLeaveCombat")
RegisterUnitEvent(25383, 4, "EnkilahAbomination_OnDied")