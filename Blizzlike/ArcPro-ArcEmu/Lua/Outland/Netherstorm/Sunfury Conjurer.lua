--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Conjurer_OnCombat(Unit, Event)
	Unit:RegisterEvent("Conjurer_Surge", 10000, 0)
	Unit:RegisterEvent("Conjurer_Flamestrike", 8000, 0)
	Unit:RegisterEvent("Conjurer_Frostbolt", 6000, 0)
end

function Conjurer_Surge(Unit, Event) 
	Unit:CastSpell(35778) 
end

function Conjurer_Flamestrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(11829, Unit:GetMainTank()) 
end

function Conjurer_Frostbolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9672, Unit:GetMainTank()) 
end

function Conjurer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Conjurer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(20139, 1, "Conjurer_OnCombat")
RegisterUnitEvent(20139, 2, "Conjurer_OnLeaveCombat")
RegisterUnitEvent(20139, 4, "Conjurer_OnDied")