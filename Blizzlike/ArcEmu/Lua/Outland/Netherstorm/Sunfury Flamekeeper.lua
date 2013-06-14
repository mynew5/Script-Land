--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Flamekeeper_OnCombat(Unit, Event)
	Unit:RegisterEvent("Flamekeeper_Enrage", 25000, 0)
	Unit:RegisterEvent("Flamekeeper_Flame", 10000, 0)
	Unit:RegisterEvent("Flamekeeper_Torch", 5000, 0)
end

function Flamekeeper_Enrage(Unit, Event) 
	Unit:CastSpell(8599) 
end

function Flamekeeper_Flame(Unit, Event) 
	Unit:FullCastSpellOnTarget(33731, Unit:GetMainTank()) 
end

function Flamekeeper_Torch(Unit, Event) 
	Unit:FullCastSpellOnTarget(35857, Unit:GetMainTank()) 
end

function Flamekeeper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Flamekeeper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(20221, 1, "Flamekeeper_OnCombat")
RegisterUnitEvent(20221, 2, "Flamekeeper_OnLeaveCombat")
RegisterUnitEvent(20221, 4, "Flamekeeper_OnDied")