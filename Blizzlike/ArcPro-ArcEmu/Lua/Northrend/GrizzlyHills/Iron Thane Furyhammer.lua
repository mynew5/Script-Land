--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function IronThaneFuryhammer_OnCombat(Unit, Event)
	Unit:RegisterEvent("IronThaneFuryhammer_Furyhammer", 8000, 0)
	Unit:RegisterEvent("IronThaneFuryhammer_FuryhammersImmunity", 15000, 1)
end

function IronThaneFuryhammer_Furyhammer(Unit, Event) 
	Unit:CastSpell(61576) 
end

function IronThaneFuryhammer_FuryhammersImmunity(Unit, Event) 
	Unit:CastSpell(47922) 
end

function IronThaneFuryhammer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function IronThaneFuryhammer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26405, 1, "IronThaneFuryhammer_OnCombat")
RegisterUnitEvent(26405, 2, "IronThaneFuryhammer_OnLeaveCombat")
RegisterUnitEvent(26405, 4, "IronThaneFuryhammer_OnDied")