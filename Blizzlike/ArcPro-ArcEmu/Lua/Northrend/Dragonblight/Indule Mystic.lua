--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function InduleMystic_OnCombat(Unit, Event)
	Unit:RegisterEvent("InduleMystic_MysticalBolt", 6000, 0)
end

function InduleMystic_MysticalBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(51787, Unit:GetMainTank()) 
end

function InduleMystic_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function InduleMystic_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26336, 1, "InduleMystic_OnCombat")
RegisterUnitEvent(26336, 2, "InduleMystic_OnLeaveCombat")
RegisterUnitEvent(26336, 4, "InduleMystic_OnDied")