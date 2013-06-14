--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: AscendScripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DarkfallenDeathblade_OnCombat(Unit, Event)
	Unit:RegisterEvent("DarkfallenDeathblade_DeathCoil", 8000, 0)
	Unit:RegisterEvent("DarkfallenDeathblade_IcyTouch", 10000, 0)
end

function DarkfallenDeathblade_DeathCoil(Unit, Event) 
	Unit:FullCastSpellOnTarget(50668, Unit:GetMainTank()) 
end

function DarkfallenDeathblade_IcyTouch(Unit, Event) 
	Unit:FullCastSpellOnTarget(50349, Unit:GetMainTank()) 
end

function DarkfallenDeathblade_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DarkfallenDeathblade_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26103, 1, "DarkfallenDeathblade_OnCombat")
RegisterUnitEvent(26103, 2, "DarkfallenDeathblade_OnLeaveCombat")
RegisterUnitEvent(26103, 4, "DarkfallenDeathblade_OnDied")