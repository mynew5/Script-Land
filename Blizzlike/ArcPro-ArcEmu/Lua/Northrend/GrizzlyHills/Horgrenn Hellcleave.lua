--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HorgrennHellcleave_OnCombat(Unit, Event)
	Unit:RegisterEvent("HorgrennHellcleave_IntimidatingRoar", 12000, 1)
	Unit:RegisterEvent("HorgrennHellcleave_MortalStrike", 7000, 0)
	Unit:RegisterEvent("HorgrennHellcleave_SunderArmor", 6000, 0)
	Unit:RegisterEvent("HorgrennHellcleave_Whirlwind", 8000, 0)
end

function HorgrennHellcleave_IntimidatingRoar(Unit, Event) 
	Unit:FullCastSpellOnTarget(16508, Unit:GetMainTank()) 
end

function HorgrennHellcleave_MortalStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(39171, Unit:GetMainTank()) 
end

function HorgrennHellcleave_SunderArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(15572, Unit:GetMainTank()) 
end

function HorgrennHellcleave_Whirlwind(Unit, Event) 
	Unit:CastSpell(38619) 
end

function HorgrennHellcleave_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HorgrennHellcleave_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27718, 1, "HorgrennHellcleave_OnCombat")
RegisterUnitEvent(27718, 2, "HorgrennHellcleave_OnLeaveCombat")
RegisterUnitEvent(27718, 4, "HorgrennHellcleave_OnDied")