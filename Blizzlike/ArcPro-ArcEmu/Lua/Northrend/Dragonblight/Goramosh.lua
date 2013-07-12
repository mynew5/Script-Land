--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Goramosh_OnCombat(Unit, Event)
	Unit:RegisterEvent("Goramosh_ConeofCold", 6000, 0)
	Unit:RegisterEvent("Goramosh_Frostbolt", 8000, 0)
end

function Goramosh_ConeofCold(Unit, Event) 
	Unit:CastSpell(20828) 
end

function Goramosh_Frostbolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9672, Unit:GetMainTank()) 
end

function Goramosh_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Goramosh_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26349, 1, "Goramosh_OnCombat")
RegisterUnitEvent(26349, 2, "Goramosh_OnLeaveCombat")
RegisterUnitEvent(26349, 4, "Goramosh_OnDied")