--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AspathatheBroodmother_OnCombat(Unit, Event)
	Unit:RegisterEvent("AspathatheBroodmother_Pollen", 8000, 0)
	Unit:RegisterEvent("AspathatheBroodmother_WingBuffet", 9000, 0)
end

function AspathatheBroodmother_Pollen(Unit, Event) 
	Unit:CastSpell(45610) 
end

function AspathatheBroodmother_WingBuffet(Unit, Event) 
	Unit:CastSpell(32914) 
end

function AspathatheBroodmother_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AspathatheBroodmother_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25498, 1, "AspathatheBroodmother_OnCombat")
RegisterUnitEvent(25498, 2, "AspathatheBroodmother_OnLeaveCombat")
RegisterUnitEvent(25498, 4, "AspathatheBroodmother_OnDied")