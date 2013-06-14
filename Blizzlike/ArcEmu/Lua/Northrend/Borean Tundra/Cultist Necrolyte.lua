--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CultistNecrolyte_OnCombat(Unit, Event)
	Unit:RegisterEvent("CultistNecrolyte_CurseofAgony", 10000, 0)
	Unit:RegisterEvent("CultistNecrolyte_ShadowBolt", 7000, 0)
end

function CultistNecrolyte_CurseofAgony(Unit, Event) 
	Unit:FullCastSpellOnTarget(18266, Unit:GetMainTank()) 
end

function CultistNecrolyte_ShadowBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9613, Unit:GetMainTank()) 
end

function CultistNecrolyte_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CultistNecrolyte_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25651, 1, "CultistNecrolyte_OnCombat")
RegisterUnitEvent(25651, 2, "CultistNecrolyte_OnLeaveCombat")
RegisterUnitEvent(25651, 4, "CultistNecrolyte_OnDied")