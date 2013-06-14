--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WailingSoul_OnCombat(Unit, Event)
	Unit:RegisterEvent("WailingSoul_TugSoul", 10000, 0)
end

function WailingSoul_TugSoul(Unit, Event) 
	Unit:FullCastSpellOnTarget(50027, Unit:GetMainTank()) 
end

function WailingSoul_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WailingSoul_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27836, 1, "WailingSoul_OnCombat")
RegisterUnitEvent(27836, 2, "WailingSoul_OnLeaveCombat")
RegisterUnitEvent(27836, 4, "WailingSoul_OnDied")