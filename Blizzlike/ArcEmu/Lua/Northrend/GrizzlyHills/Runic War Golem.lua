--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function RunicWarGolem_OnCombat(Unit, Event)
	Unit:RegisterEvent("RunicWarGolem_RunePunch", 10000, 0)
end

function RunicWarGolem_RunePunch(Unit, Event) 
	Unit:FullCastSpellOnTarget(52702, Unit:GetMainTank()) 
end

function RunicWarGolem_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RunicWarGolem_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26347, 1, "RunicWarGolem_OnCombat")
RegisterUnitEvent(26347, 2, "RunicWarGolem_OnLeaveCombat")
RegisterUnitEvent(26347, 4, "RunicWarGolem_OnDied")