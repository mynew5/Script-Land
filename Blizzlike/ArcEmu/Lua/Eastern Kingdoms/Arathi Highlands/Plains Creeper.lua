--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function PlainsCreeper_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("EncasingWebs", 18000, 0)
	Unit:RegisterEvent("Poison", 5000, 1)
end

function EncasingWebs(Unit, Event)
	Unit:FullCastSpellOnTarget(4962, Unit:GetMainTank())
end

function Poison(Unit, Event)
	Unit:FullCastSpellOnTarget(744, Unit:GetMainTank())
end

function PlainsCreeper_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function PlainsCreeper_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2563, 1, "PlainsCreeper_OnEnterCombat")
RegisterUnitEvent(2563, 2, "PlainsCreeper_OnLeaveCombat")
RegisterUnitEvent(2563, 4, "PlainsCreeper_OnDied")