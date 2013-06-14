--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function MalginBarleybrew_OnCombat(Unit, Event)
	Unit:RegisterEvent("MalginBarleybrew_BladeFlurry", 4000, 1)
	Unit:RegisterEvent("MalginBarleybrew_BattleShout", 6000, 1)
end

function MalginBarleybrew_BladeFlurry(Unit, Event) 
	Unit:CastSpell(3631) 
end

function MalginBarleybrew_BattleShout(Unit, Event) 
	Unit:CastSpell(5242) 
end

function MalginBarleybrew_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MalginBarleybrew_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5848, 1, "MalginBarleybrew_OnCombat")
RegisterUnitEvent(5848, 2, "MalginBarleybrew_OnLeaveCombat")
RegisterUnitEvent(5848, 4, "MalginBarleybrew_OnDied")