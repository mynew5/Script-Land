--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Rageclaw_OnCombat(Unit, Event)
	Unit:RegisterEvent("Rageclaw_BearForm", 1000, 1)
	Unit:RegisterEvent("Rageclaw_Maul", 4000, 0)
end

function Rageclaw_BearForm(Unit, Event) 
	Unit:CastSpell(7090) 
end

function Rageclaw_Maul(Unit, Event) 
	Unit:FullCastSpellOnTarget(12161, Unit:GetMainTank()) 
end

function Rageclaw_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Rageclaw_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7318, 1, "Rageclaw_OnCombat")
RegisterUnitEvent(7318, 2, "Rageclaw_OnLeaveCombat")
RegisterUnitEvent(7318, 4, "Rageclaw_OnDied")