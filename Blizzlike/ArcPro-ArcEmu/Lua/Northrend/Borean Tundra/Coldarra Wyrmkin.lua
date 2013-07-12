--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ColdarraWyrmkin_OnCombat(Unit, Event)
	Unit:RegisterEvent("ColdarraWyrmkin_FrostbiteWeapon", 8000, 0)
end

function ColdarraWyrmkin_FrostbiteWeapon(Unit, Event) 
	Unit:CastSpell(50416) 
end

function ColdarraWyrmkin_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ColdarraWyrmkin_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25728, 1, "ColdarraWyrmkin_OnCombat")
RegisterUnitEvent(25728, 2, "ColdarraWyrmkin_OnLeaveCombat")
RegisterUnitEvent(25728, 4, "ColdarraWyrmkin_OnDied")