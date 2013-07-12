--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Loguhn_OnCombat(Unit, Event)
	Unit:RegisterEvent("Loguhn_Enrage", 10000, 1)
	Unit:RegisterEvent("Loguhn_SunderArmor", 5000, 0)
end

function Loguhn_Enrage(Unit, Event) 
	Unit:CastSpell(8599)
end

function Loguhn_SunderArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(50370, Unit:GetMainTank()) 
end

function Loguhn_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Loguhn_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26196, 1, "Loguhn_OnCombat")
RegisterUnitEvent(26196, 2, "Loguhn_OnLeaveCombat")
RegisterUnitEvent(26196, 4, "Loguhn_OnDied")