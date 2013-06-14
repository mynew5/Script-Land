--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Dishu_OnCombat(Unit, Event)
	Unit:RegisterEvent("Dishu_SavannahCubs", 4000, 1)
end

function Dishu_SavannahCubs(Unit, Event) 
	Unit:CastSpell(8210) 
end

function Dishu_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Dishu_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5865, 1, "Dishu_OnCombat")
RegisterUnitEvent(5865, 2, "Dishu_OnLeaveCombat")
RegisterUnitEvent(5865, 4, "Dishu_OnDied")