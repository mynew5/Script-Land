--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WarsongShaman_OnCombat(Unit, Event)
	Unit:RegisterEvent("WarsongShaman_ChainHeal", 16000, 0)
	Unit:RegisterEvent("WarsongShaman_ChainLightning", 9000, 0)
	Unit:RegisterEvent("WarsongShaman_EarthShock", 12000, 0)
	Unit:RegisterEvent("WarsongShaman_LesserHealingWave", 20000, 0)
	Unit:RegisterEvent("WarsongShaman_WaterShield", 4000, 1)
end

function WarsongShaman_ChainHeal(Unit, Event) 
	Unit:CastSpell(16367) 
end

function WarsongShaman_ChainLightning(Unit, Event) 
	Unit:FullCastSpellOnTarget(39945, Unit:GetMainTank()) 
end

function WarsongShaman_EarthShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(25025, Unit:GetMainTank()) 
end

function WarsongShaman_LesserHealingWave(Unit, Event) 
	Unit:CastSpell(49309) 
end

function WarsongShaman_WaterShield(Unit, Event) 
	Unit:CastSpell(34827) 
end

function WarsongShaman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WarsongShaman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27678, 1, "WarsongShaman_OnCombat")
RegisterUnitEvent(27678, 2, "WarsongShaman_OnLeaveCombat")
RegisterUnitEvent(27678, 4, "WarsongShaman_OnDied")