--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AmberpineScout_OnCombat(Unit, Event)
	Unit:RegisterEvent("AmberpineScout_Deterrence", 10000, 0)
	Unit:RegisterEvent("AmberpineScout_PunctureArmor", 2000, 1)
	Unit:RegisterEvent("AmberpineScout_Shoot", 6000, 0)
end

function AmberpineScout_Deterrence(Unit, Event) 
	Unit:CastSpell(31567) 
end

function AmberpineScout_PunctureArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(35918, Unit:GetMainTank()) 
end

function AmberpineScout_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(15547, Unit:GetMainTank()) 
end

function AmberpineScout_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AmberpineScout_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27117, 1, "AmberpineScout_OnCombat")
RegisterUnitEvent(27117, 2, "AmberpineScout_OnLeaveCombat")
RegisterUnitEvent(27117, 4, "AmberpineScout_OnDied")