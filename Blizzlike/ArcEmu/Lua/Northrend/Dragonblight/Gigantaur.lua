--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Gigantaur_OnCombat(Unit, Event)
	Unit:RegisterEvent("Gigantaur_GiganticBlow", 6000, 0)
	Unit:RegisterEvent("Gigantaur_Hamstring", 8000, 0)
end

function Gigantaur_GiganticBlow(Unit, Event) 
	Unit:FullCastSpellOnTarget(52139, Unit:GetMainTank()) 
end

function Gigantaur_Hamstring(Unit, Event) 
	Unit:FullCastSpellOnTarget(9080, Unit:GetMainTank()) 
end

function Gigantaur_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Gigantaur_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26836, 1, "Gigantaur_OnCombat")
RegisterUnitEvent(26836, 2, "Gigantaur_OnLeaveCombat")
RegisterUnitEvent(26836, 4, "Gigantaur_OnDied")