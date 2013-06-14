--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function IceHeartJormungarFeeder_OnCombat(Unit, Event)
	Unit:RegisterEvent("IceHeartJormungarFeeder_CorrosiveSpit", 6000, 1)
end

function IceHeartJormungarFeeder_CorrosiveSpit(Unit, Event) 
	Unit:FullCastSpellOnTarget(47447, Unit:GetMainTank()) 
end

function IceHeartJormungarFeeder_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function IceHeartJormungarFeeder_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26358, 1, "IceHeartJormungarFeeder_OnCombat")
RegisterUnitEvent(26358, 2, "IceHeartJormungarFeeder_OnLeaveCombat")
RegisterUnitEvent(26358, 4, "IceHeartJormungarFeeder_OnDied")