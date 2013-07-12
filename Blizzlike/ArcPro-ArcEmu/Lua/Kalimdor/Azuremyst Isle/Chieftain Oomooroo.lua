--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Chieftain_OnCombat(Unit, Event)
	Unit:RegisterEvent("Chieftain_Spellname", 9000, 0)
	Unit:RegisterEvent("Chieftain_enrage", 16000, 1)
end

function Chieftain_Spellname(pUnit, Event)
	pUnit:CastSpellOnTarget(13446, pUnit:GetClosestPlayer())
end

function Chieftain_enrage(pUnit, Event)
	pUnit:CastSpell(18501) 
end

function Chieftain_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function Chieftain_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17448, 1, "Chieftain_OnCombat")
RegisterUnitEvent(17448, 2, "Chieftain_OnLeaveCombat")
RegisterUnitEvent(17448, 4, "Chieftain_OnDied")