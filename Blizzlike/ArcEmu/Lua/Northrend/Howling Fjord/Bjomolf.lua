--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Bjomolf_OnCombat(Unit, Event)
	Unit:RegisterEvent("Bjomolf_GnawBone", 8000, 0)
end

function Bjomolf_GnawBone(Unit, Event) 
	Unit:FullCastSpellOnTarget(50046, Unit:GetMainTank()) 
end

function Bjomolf_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Bjomolf_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24516, 1, "Bjomolf_OnCombat")
RegisterUnitEvent(24516, 2, "Bjomolf_OnLeaveCombat")
RegisterUnitEvent(24516, 4, "Bjomolf_OnDied")