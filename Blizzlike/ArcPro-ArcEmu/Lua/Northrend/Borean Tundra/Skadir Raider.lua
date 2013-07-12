--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SkadirRaider_OnCombat(Unit, Event)
	Unit:RegisterEvent("SkadirRaider_FreezingTrap", 1000, 1)
	Unit:RegisterEvent("SkadirRaider_ThrowSpear", 6000, 0)
end

function SkadirRaider_FreezingTrap(Unit, Event) 
	Unit:CastSpell(43414) 
end

function SkadirRaider_ThrowSpear(Unit, Event) 
	Unit:FullCastSpellOnTarget(43413, Unit:GetMainTank()) 
end

function SkadirRaider_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SkadirRaider_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25522, 1, "SkadirRaider_OnCombat")
RegisterUnitEvent(25522, 2, "SkadirRaider_OnLeaveCombat")
RegisterUnitEvent(25522, 4, "SkadirRaider_OnDied")