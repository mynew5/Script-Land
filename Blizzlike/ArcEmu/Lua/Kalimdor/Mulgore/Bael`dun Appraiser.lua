--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BaelApp_OnCombat(Unit, Event)
	--Unit:SendChatMessage(12, 0, "Gor eft mitta ta gor-skalf")
	if(Unit:GetHealthPct() < 15) then
		Unit:FullCastSpell(2052)
	end
end

function BaelApp_OnDead(Unit, Event)
	Unit:RemoveEvents()
end

function BaelApp_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2990, 1, "BaelApp_OnCombat")
RegisterUnitEvent(2990, 2, "BaelApp_OnLeaveCombat")
RegisterUnitEvent(2990, 4, "BaelApp_OnDead")