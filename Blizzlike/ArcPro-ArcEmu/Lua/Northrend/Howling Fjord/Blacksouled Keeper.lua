--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BlacksouledKeeper_OnCombat(Unit, Event)
	Unit:RegisterEvent("BlacksouledKeeper_Wrath", 5000, 0)
end

function BlacksouledKeeper_Wrath(Unit, Event) 
	Unit:FullCastSpellOnTarget(43619, Unit:GetMainTank()) 
end

function BlacksouledKeeper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BlacksouledKeeper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(23875, 1, "BlacksouledKeeper_OnCombat")
RegisterUnitEvent(23875, 2, "BlacksouledKeeper_OnLeaveCombat")
RegisterUnitEvent(23875, 4, "BlacksouledKeeper_OnDied")