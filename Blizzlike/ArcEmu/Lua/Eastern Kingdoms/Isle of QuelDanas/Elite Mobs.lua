--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Yerney; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--Eredar Sorcerer
function Eredar_OnCombat(Unit, Event)
	Unit:RegisterEvent("Eredar_Flames", 8900, 10)
end

function Eredar_Flames(Unit, Event)
	Unit:FullCastSpellOnTarget(45046, Unit:GetRandomPlayer(0))
end

function Eredar_leaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Eredar_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(25033, 1, "Eredar_OnCombat")
RegisterUnitEvent(25033, 2, "Eredar_leaveCombat")
RegisterUnitEvent(25033, 4, "Eredar_Dead")

--Pit Overlord
function Pit_OnCombat(Unit, Event)
	Unit:RegisterEvent("Pit_Cleave", 4000, 0)
	Unit:RegisterEvent("Pit_Cone", 17000, 1)
	Unit:RegisterEvent("Pit_Coil", 8000, 3)
end

function Pit_Cleave(Unit, Event)
	Unit:FullCastSpellOnTarget(15284, Unit:GetClosestPlayer())
end

function Pit_Cone(Unit, Event)
	Unit:FullCastSpell(19630)
end

function Pit_Coil(Unit, Event)
	Unit:FullCastSpellOnTarget(32709, Unit:GetRandomPlayer(0))
end

function Pit_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Pit_Dead(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(25031, 1, "Pit_OnCombat")
RegisterUnitEvent(25031, 2, "Pit_LeaveCombat")
RegisterUnitEvent(25031, 4, "Pit_Dead")