--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GeneralCerulean_OnCombat(Unit, Event)
	Unit:RegisterEvent("GeneralCerulean_FrostShock", 7000, 0)
end

function GeneralCerulean_FrostShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(15499, Unit:GetMainTank()) 
end

function GeneralCerulean_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GeneralCerulean_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25716, 1, "GeneralCerulean_OnCombat")
RegisterUnitEvent(25716, 2, "GeneralCerulean_OnLeaveCombat")
RegisterUnitEvent(25716, 4, "GeneralCerulean_OnDied")