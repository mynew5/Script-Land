--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function FizzleDarkstorm_OnCombat(Unit, Event)
	Unit:RegisterEvent("FizzleDarkstorm_SoulSiphon", 13000, 0)
	Unit:RegisterEvent("FizzleDarkstorm_ShadowBolt", 8000, 0)
	Unit:RegisterEvent("FizzleDarkstorm_SummonImp", 1000, 1)
end

function FizzleDarkstorm_SummonImp(Unit, Event) 
	Unit:CastSpell(11939) 
end

function FizzleDarkstorm_SoulSiphon(Unit, Event) 
	Unit:FullCastSpellOnTarget(7290, 	Unit:GetMainTank()) 
end

function FizzleDarkstorm_ShadowBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(20791, 	Unit:GetMainTank()) 
end

function FizzleDarkstorm_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FizzleDarkstorm_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

function FizzleDarkstorm_OnKilledTarget(Unit, Event) 
end

RegisterUnitEvent(3203, 1, "FizzleDarkstorm_OnCombat")
RegisterUnitEvent(3203, 2, "FizzleDarkstorm_OnLeaveCombat")
RegisterUnitEvent(3203, 3, "FizzleDarkstorm_OnKilledTarget")
RegisterUnitEvent(3203, 4, "FizzleDarkstorm_OnDied")