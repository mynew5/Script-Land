--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BjornHalgurdsson_OnCombat(Unit, Event)
	Unit:RegisterEvent("BjornHalgurdsson_CrushArmor", 5000, 0)
	Unit:RegisterEvent("BjornHalgurdsson_MortalStrike", 7000, 0)
end

function BjornHalgurdsson_CrushArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(33661, Unit:GetMainTank()) 
end

function BjornHalgurdsson_MortalStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(32736, Unit:GetMainTank()) 
end

function BjornHalgurdsson_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BjornHalgurdsson_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24238, 1, "BjornHalgurdsson_OnCombat")
RegisterUnitEvent(24238, 2, "BjornHalgurdsson_OnLeaveCombat")
RegisterUnitEvent(24238, 4, "BjornHalgurdsson_OnDied")