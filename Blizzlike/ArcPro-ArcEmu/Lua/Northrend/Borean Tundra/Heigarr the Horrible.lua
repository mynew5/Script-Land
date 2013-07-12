--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HeigarrtheHorrible_OnCombat(Unit, Event)
	Unit:RegisterEvent("HeigarrtheHorrible_Cleave", 7000, 0)
	Unit:RegisterEvent("HeigarrtheHorrible_ConcussionBlow", 9000, 0)
end

function HeigarrtheHorrible_Cleave(Unit, Event) 
	Unit:CastSpell(40504) 
end

function HeigarrtheHorrible_ConcussionBlow(Unit, Event) 
	Unit:FullCastSpellOnTarget(32588, Unit:GetMainTank()) 
end

function HeigarrtheHorrible_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HeigarrtheHorrible_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26266, 1, "HeigarrtheHorrible_OnCombat")
RegisterUnitEvent(26266, 2, "HeigarrtheHorrible_OnLeaveCombat")
RegisterUnitEvent(26266, 4, "HeigarrtheHorrible_OnDied")