--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Polly_OnCombat(Unit, Event)
	Unit:RegisterEvent("Polly_Stealth", 1000, 1)
	Unit:RegisterEvent("Polly_SummonPollyJr", 4000, 1)
end

function Polly_Stealth(Unit, Event) 
	Unit:CastSpell(8822) 
end

function Polly_SummonPollyJr(Unit, Event) 
	Unit:CastSpell(9998) 
end

function Polly_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Polly_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7167, 1, "Polly_OnCombat")
RegisterUnitEvent(7167, 2, "Polly_OnLeaveCombat")
RegisterUnitEvent(7167, 4, "Polly_OnDied")