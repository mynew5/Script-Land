--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Hauteur_OnCombat(Unit, Event)
	Unit:RegisterEvent("Hauteur_Spellname", 12000, 1)
	Unit:RegisterEvent("Hauteur_enrage", 6000, 1)
end

function Hauteur_Spellname(pUnit, Event)
	pUnit:CastSpellOnTarget(8050, pUnit:GetClosestPlayer())
end

function Hauteur_enrage(pUnit, Event)
	pUnit:CastSpell(134) 
end

function Hauteur_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function Hauteur_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17206, 1, "Hauteur_OnCombat")
RegisterUnitEvent(17206, 2, "Hauteur_OnLeaveCombat")
RegisterUnitEvent(17206, 4, "Hauteur_OnDied")