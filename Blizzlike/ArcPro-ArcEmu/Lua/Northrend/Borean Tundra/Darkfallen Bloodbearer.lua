--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: AscendScripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DarkfallenBloodbearer_OnCombat(Unit, Event)
	Unit:RegisterEvent("DarkfallenBloodbearer_DeathCoil", 8000, 0)
	Unit:RegisterEvent("DarkfallenBloodbearer_IcyTouch", 10000, 0)
end

function DarkfallenBloodbearer_DeathCoil(Unit, Event) 
	Unit:FullCastSpellOnTarget(50668, Unit:GetMainTank()) 
end

function DarkfallenBloodbearer_IcyTouch(Unit, Event) 
	Unit:FullCastSpellOnTarget(50349, Unit:GetMainTank()) 
end

function DarkfallenBloodbearer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DarkfallenBloodbearer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26115, 1, "DarkfallenBloodbearer_OnCombat")
RegisterUnitEvent(26115, 2, "DarkfallenBloodbearer_OnLeaveCombat")
RegisterUnitEvent(26115, 4, "DarkfallenBloodbearer_OnDied")