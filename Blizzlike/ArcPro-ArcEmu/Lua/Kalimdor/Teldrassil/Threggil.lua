--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Threggil_OnCombat(Unit, Event)
	Unit:RegisterEvent("Threggil_Strike", 6000, 0)
end

function Threggil_Strike(Unit, Event) 
	Unit:FullCastSpellOnTarget(11976, Unit:GetMainTank()) 
end

function Threggil_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Threggil_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14432, 1, "Threggil_OnCombat")
RegisterUnitEvent(14432, 2, "Threggil_OnLeaveCombat")
RegisterUnitEvent(14432, 4, "Threggil_OnDied")