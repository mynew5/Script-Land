--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DappledStag_OnCombat(Unit, Event)
	Unit:RegisterEvent("DappledStag_Butt", 8000, 0)
end

function DappledStag_Butt(Unit, Event) 
	Unit:FullCastSpellOnTarget(59110, Unit:GetMainTank()) 
end

function DappledStag_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DappledStag_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(31236, 1, "DappledStag_OnCombat")
RegisterUnitEvent(31236, 2, "DappledStag_OnLeaveCombat")
RegisterUnitEvent(31236, 4, "DappledStag_OnDied")