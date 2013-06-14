--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Rattlebore_OnCombat(Unit, Event)
	Unit:RegisterEvent("Rattlebore_CorrodedMind", 10000, 0)
	Unit:RegisterEvent("Rattlebore_CorrosiveSpit", 9000, 0)
	Unit:RegisterEvent("Rattlebore_PowerfulBite", 7000, 0)
end

function Rattlebore_CorrodedMind(Unit, Event) 
	Unit:FullCastSpellOnTarget(51203, Unit:GetMainTank()) 
end

function Rattlebore_CorrosiveSpit(Unit, Event) 
	Unit:FullCastSpellOnTarget(47447, Unit:GetMainTank()) 
end

function Rattlebore_PowerfulBite(Unit, Event) 
	Unit:FullCastSpellOnTarget(48287, Unit:GetMainTank()) 
end

function Rattlebore_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Rattlebore_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26360, 1, "Rattlebore_OnCombat")
RegisterUnitEvent(26360, 2, "Rattlebore_OnLeaveCombat")
RegisterUnitEvent(26360, 4, "Rattlebore_OnDied")