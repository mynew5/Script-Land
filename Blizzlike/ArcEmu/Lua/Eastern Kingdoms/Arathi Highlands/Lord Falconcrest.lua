--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Ascendscripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function LordFalconcrest_OnEnterCombat(Unit,Event)
	Unit:SendChatMessage(21, 0, "I presume you come with good news?")
	Unit:CastSpell()
	Unit:RegisterEvent("Disarm", 23000, 0)
end

function Disarm(Unit,Event)
	Unit:FullCastSpellOnTarget(6713, Unit:GetMainTank())
end

function LordFalconcrest_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function LordFalconcrest_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2597, 1, "LordFalconcrest_OnEnterCombat")
RegisterUnitEvent(2597, 2, "LordFalconcrest_OnLeaveCombat")
RegisterUnitEvent(2597, 4, "LordFalconcrest_OnDied")