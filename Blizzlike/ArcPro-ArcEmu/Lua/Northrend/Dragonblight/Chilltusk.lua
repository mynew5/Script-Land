--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Chilltusk_OnCombat(Unit, Event)
	Unit:RegisterEvent("Chilltusk_IceSlash", 6000, 0)
	Unit:RegisterEvent("Chilltusk_TuskStrike", 5000, 0)
end

function Chilltusk_IceSlash(Unit, Event) 
	Unit:FullCastSpellOnTarget(51878, Unit:GetMainTank()) 
end

function Chilltusk_TuskStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(50410, Unit:GetMainTank()) 
end

function Chilltusk_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Chilltusk_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27005, 1, "Chilltusk_OnCombat")
RegisterUnitEvent(27005, 2, "Chilltusk_OnLeaveCombat")
RegisterUnitEvent(27005, 4, "Chilltusk_OnDied")