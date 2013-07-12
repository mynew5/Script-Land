--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Flayer_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Flayer_Skin", 5000, 0)
end

function Flayer_Skin(Unit, Event)
    Unit:CastSpell(36576)
end   

function Flayer_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Flayer_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20210, 1, "Flayer_OnEnterCombat")
RegisterUnitEvent(20210, 2, "Flayer_OnLeaveCombat")
RegisterUnitEvent(20210, 4, "Flayer_OnDied")