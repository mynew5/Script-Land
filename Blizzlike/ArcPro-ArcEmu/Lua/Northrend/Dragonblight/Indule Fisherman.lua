--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function InduleFisherman_OnCombat(Unit, Event)
	Unit:RegisterEvent("InduleFisherman_ElectrifiedNet", 10000, 0)
end

function InduleFisherman_ElectrifiedNet(Unit, Event) 
	Unit:FullCastSpellOnTarget(11820, Unit:GetMainTank()) 
end

function InduleFisherman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function InduleFisherman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26343, 1, "InduleFisherman_OnCombat")
RegisterUnitEvent(26343, 2, "InduleFisherman_OnLeaveCombat")
RegisterUnitEvent(26343, 4, "InduleFisherman_OnDied")