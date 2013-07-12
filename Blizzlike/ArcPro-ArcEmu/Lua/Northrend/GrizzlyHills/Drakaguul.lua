--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Drakaguul_OnCombat(Unit, Event)
	Unit:RegisterEvent("Drakaguul_BerserkerCharge", 10000, 0)
	Unit:RegisterEvent("Drakaguul_DrakaguulsSoldiers", 12000, 0)
end

function Drakaguul_BerserkerCharge(Unit, Event) 
	Unit:FullCastSpellOnTarget(52460, Unit:GetMainTank()) 
end

function Drakaguul_DrakaguulsSoldiers(Unit, Event) 
	Unit:CastSpell(52457) 
end

function Drakaguul_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Drakaguul_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26919, 1, "Drakaguul_OnCombat")
RegisterUnitEvent(26919, 2, "Drakaguul_OnLeaveCombat")
RegisterUnitEvent(26919, 4, "Drakaguul_OnDied")