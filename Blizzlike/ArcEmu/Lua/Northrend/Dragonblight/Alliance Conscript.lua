--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AllianceConscript_OnCombat(Unit, Event)
	Unit:RegisterEvent("AllianceConscript_HeroicStrike", 8000, 0)
	Unit:RegisterEvent("AllianceConscript_ShieldBlock", 5000, 0)
	Unit:RegisterEvent("AllianceConscript_Shoot", 6000, 0)
end

function AllianceConscript_HeroicStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(29426, Unit:GetMainTank()) 
end

function AllianceConscript_ShieldBlock(Unit, Event) 
	Unit:CastSpell(32587) 
end

function AllianceConscript_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(15620, Unit:GetMainTank()) 
end

function AllianceConscript_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AllianceConscript_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27564, 1, "AllianceConscript_OnCombat")
RegisterUnitEvent(27564, 2, "AllianceConscript_OnLeaveCombat")
RegisterUnitEvent(27564, 4, "AllianceConscript_OnDied")