--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: MikeBeck; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Murkdeep_OnCombat(Unit, Event)
	Unit:RegisterEvent("Murkdeep_Net", 10000, 0)
	Unit:RegisterEvent("Murkdeep_SunderArmor", 6000, 0)
end

function Murkdeep_Net(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6533, 	pUnit:GetMainTank()) 
end

function Murkdeep_SunderArmor(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11971, 	pUnit:GetMainTank()) 
end

function Murkdeep_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Murkdeep_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10323, 1, "Murkdeep_OnCombat")
RegisterUnitEvent(10323, 2, "Murkdeep_OnLeaveCombat")
RegisterUnitEvent(10323, 4, "Murkdeep_OnDied")