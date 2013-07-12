--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AncientDrakkariSoothsayer_OnCombat(Unit, Event)
	Unit:RegisterEvent("AncientDrakkariSoothsayer_HolySmite", 5000, 0)
	Unit:RegisterEvent("AncientDrakkariSoothsayer_ProphecyofBlood", 9000, 0)
end

function AncientDrakkariSoothsayer_HolySmite(Unit, Event) 
	Unit:FullCastSpellOnTarget(9734, Unit:GetMainTank()) 
end

function AncientDrakkariSoothsayer_ProphecyofBlood(Unit, Event) 
	Unit:FullCastSpellOnTarget(52468, Unit:GetMainTank()) 
end

function AncientDrakkariSoothsayer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AncientDrakkariSoothsayer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26812, 1, "AncientDrakkariSoothsayer_OnCombat")
RegisterUnitEvent(26812, 2, "AncientDrakkariSoothsayer_OnLeaveCombat")
RegisterUnitEvent(26812, 4, "AncientDrakkariSoothsayer_OnDied")