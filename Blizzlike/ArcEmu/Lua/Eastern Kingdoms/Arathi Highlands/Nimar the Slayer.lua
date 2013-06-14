--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function NimarTheSlayer_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("Cleave", 5000, 0)
	Unit:RegisterEvent("Whirlwind", 14000, 0)
end

function Cleave(Unit, Event)
	Unit:FullCastSpellOnTarget(845, Unit:GetMainTank())
end

function Whirlwind(Unit, Event)
	Unit:FullCastSpellOnTarget(15576, Unit:GetMainTank())
	Unit:CastSpellOnTarget(17207, Unit:GetMainTank())
end

function NimarTheSlayer_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function NimarTheSlayer_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2606, 1, "NimarTheSlayer_OnEnterCombat")
RegisterUnitEvent(2606, 2, "NimarTheSlayer_OnLeaveCombat")
RegisterUnitEvent(2606, 4, "NimarTheSlayer_OnDied")