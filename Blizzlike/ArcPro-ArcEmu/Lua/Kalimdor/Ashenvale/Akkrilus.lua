--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Akkrilus_OnCombat(Unit, Event)
	Unit:RegisterEvent("Akkrilus_FireShieldII", 7000, 0)
	Unit:RegisterEvent("Akkrilus_Immolate", 14000, 0)
end

function Akkrilus_FireShieldII(pUnit, Event) 
	pUnit:CastSpell(184) 
end

function Akkrilus_Immolate(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(1094, pUnit:GetMainTank()) 
end

function Akkrilus_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Akkrilus_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3773, 1, "Akkrilus_OnCombat")
RegisterUnitEvent(3773, 2, "Akkrilus_OnLeaveCombat")
RegisterUnitEvent(3773, 4, "Akkrilus_OnDied")