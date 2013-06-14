--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Gesharahan_OnCombat(Unit, Event)
	Unit:RegisterEvent("Gesharahan_DeadlyPoison", 6000, 1)
end

function Gesharahan_DeadlyPoison(Unit, Event) 
	Unit:FullCastSpellOnTarget(3583, Unit:GetMainTank()) 
end

function Gesharahan_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Gesharahan_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3398, 1, "Gesharahan_OnCombat")
RegisterUnitEvent(3398, 2, "Gesharahan_OnLeaveCombat")
RegisterUnitEvent(3398, 4, "Gesharahan_OnDied")