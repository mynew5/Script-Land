--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Arvoar_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("Arvoar_BellowingRoar", 30000, 0)
	Unit:RegisterEvent("Arvoar_Rend", 20000, 0)
	Unit:RegisterEvent("Arvoar_RockShell", 33000, 0)
end

function Arvoar_BellowingRoar(Unit,Event)
	Unit:FullCastSpellOnTarget(40636, Unit:GetClosestPlayer())
end

function Arvoar_Rend(Unit,Event)
	Unit:FullCastSpellOnTarget(13443, Unit:GetClosestPlayer())
end

function Arvoar_RockShell(Unit,Event)
	Unit:CastSpell(33810)
end

function Arvoar_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function Arvoar_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(23267, 1, "Arvoar_OnEnterCombat")
RegisterUnitEvent(23267, 2, "Arvoar_OnLeaveCombat")
RegisterUnitEvent(23267, 4, "Arvoar_OnDied")