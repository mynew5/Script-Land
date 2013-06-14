--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Astromancer_OnCombat(Unit, Event)
	Unit:RegisterEvent("Astromancer_Focus", 6000, 0)
	Unit:RegisterEvent("Astromancer_Intellect", 1000, 1)
	Unit:RegisterEvent("Astromancer_Scorch", 4000, 0)
end

function Astromancer_Focus(Unit, Event) 
	Unit:CastSpell(35914) 
end

function Astromancer_Intellect(Unit, Event) 
	Unit:CastSpell(35917) 
end

function Astromancer_Scorch(Unit, Event) 
	Unit:FullCastSpellOnTarget(38391, Unit:GetMainTank()) 
end

function Astromancer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Astromancer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(19643, 1, "Astromancer_OnCombat")
RegisterUnitEvent(19643, 2, "Astromancer_OnLeaveCombat")
RegisterUnitEvent(19643, 4, "Astromancer_OnDied")