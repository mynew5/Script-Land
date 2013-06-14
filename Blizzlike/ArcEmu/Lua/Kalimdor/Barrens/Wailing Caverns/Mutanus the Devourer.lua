--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Mutanus_OnCombat(Unit, Event)
	Unit:RegisterEvent("Crack", 7000, 0)
	Unit:RegisterEvent("Nightmare", 14000, 0)
	Unit:RegisterEvent("Terrify", 21000, 0)
end

function Crack(Unit, Event) 
	Unit:CastSpell(8150) 
end

function Nightmare(Unit, Event) 
	Unit:FullCastSpellOnTarget(7967, Unit:GetMainTank()) 
end

function Terrify(Unit, Event) 
	Unit:CastSpellOnTarget(7399, Unit:GetRandomPlayer()) 
end

function Mutanus_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Mutanus_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3654, 1, "Mutanus_OnCombat")
RegisterUnitEvent(3654, 2, "Mutanus_OnLeaveCombat")
RegisterUnitEvent(3654, 4, "Mutanus_OnDied")