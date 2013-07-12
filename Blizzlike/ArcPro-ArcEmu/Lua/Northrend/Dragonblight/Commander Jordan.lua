--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CommanderJordan_OnCombat(Unit, Event)
	Unit:RegisterEvent("CommanderJordan_AvengingWrath", 6000, 1)
	Unit:RegisterEvent("CommanderJordan_Consecration", 7000, 0)
end

function CommanderJordan_AvengingWrath(Unit, Event) 
	Unit:CastSpell(50837) 
end

function CommanderJordan_Consecration(Unit, Event) 
	Unit:CastSpell(32773) 
end

function CommanderJordan_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CommanderJordan_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27237, 1, "CommanderJordan_OnCombat")
RegisterUnitEvent(27237, 2, "CommanderJordan_OnLeaveCombat")
RegisterUnitEvent(27237, 4, "CommanderJordan_OnDied")