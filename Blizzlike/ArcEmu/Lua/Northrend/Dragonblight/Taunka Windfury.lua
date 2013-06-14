--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TaunkaWindfury_OnCombat(Unit, Event)
	Unit:RegisterEvent("TaunkaWindfury_HealingTouch", 10000, 0)
	Unit:RegisterEvent("TaunkaWindfury_Moonfire", 5500, 0)
end

function TaunkaWindfury_HealingTouch(Unit, Event) 
	Unit:CastSpell(23381) 
end

function TaunkaWindfury_Moonfire(Unit, Event) 
	Unit:FullCastSpellOnTarget(23380, Unit:GetMainTank()) 
end

function TaunkaWindfury_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TaunkaWindfury_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27571, 1, "TaunkaWindfury_OnCombat")
RegisterUnitEvent(27571, 2, "TaunkaWindfury_OnLeaveCombat")
RegisterUnitEvent(27571, 4, "TaunkaWindfury_OnDied")