--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function LordMelenas_OnCombat(Unit, Event)
	Unit:RegisterEvent("LordMelenas_CatForm", 1000, 1)
	Unit:RegisterEvent("LordMelenas_Rake", 6000, 0)
	Unit:RegisterEvent("LordMelenas_Rejuvenation", 12000, 0)
end

function LordMelenas_CatForm(Unit, Event) 
	Unit:CastSpell(5759) 
end

function LordMelenas_Rake(Unit, Event) 
	Unit:FullCastSpellOnTarget(1822, Unit:GetMainTank()) 
end

function LordMelenas_Rejuvenation(Unit, Event) 
	Unit:CastSpell(774) 
end

function LordMelenas_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LordMelenas_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2038, 1, "LordMelenas_OnCombat")
RegisterUnitEvent(2038, 2, "LordMelenas_OnLeaveCombat")
RegisterUnitEvent(2038, 4, "LordMelenas_OnDied")