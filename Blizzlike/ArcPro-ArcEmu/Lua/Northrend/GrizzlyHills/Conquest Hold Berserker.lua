--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ConquestHoldBerserker_OnCombat(Unit, Event)
	Unit:RegisterEvent("ConquestHoldBerserker_BattleShout", 4000, 1)
end

function ConquestHoldBerserker_BattleShout(Unit, Event) 
	Unit:CastSpell(31403) 
end

function ConquestHoldBerserker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ConquestHoldBerserker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27500, 1, "ConquestHoldBerserker_OnCombat")
RegisterUnitEvent(27500, 2, "ConquestHoldBerserker_OnLeaveCombat")
RegisterUnitEvent(27500, 4, "ConquestHoldBerserker_OnDied")