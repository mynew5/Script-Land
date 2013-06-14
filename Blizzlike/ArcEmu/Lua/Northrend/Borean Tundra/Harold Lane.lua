--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HaroldLane_OnCombat(Unit, Event)
	Unit:RegisterEvent("HaroldLane_BearTrap", 2000, 1)
	Unit:RegisterEvent("HaroldLane_ThrowBearPelt", 8000, 0)
end

function HaroldLane_BearTrap(Unit, Event) 
	Unit:CastSpell(53432) 
end

function HaroldLane_ThrowBearPelt(Unit, Event) 
	Unit:FullCastSpellOnTarget(53425, Unit:GetMainTank()) 
end

function HaroldLane_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HaroldLane_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25804, 1, "HaroldLane_OnCombat")
RegisterUnitEvent(25804, 2, "HaroldLane_OnLeaveCombat")
RegisterUnitEvent(25804, 4, "HaroldLane_OnDied")