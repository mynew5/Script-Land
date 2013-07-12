--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BerylSorcerer_OnCombat(Unit, Event)
	Unit:RegisterEvent("BerylSorcerer_Blink", 11000, 0)
	Unit:RegisterEvent("BerylSorcerer_Frostbolt", 8000, 0)
end

function BerylSorcerer_Blink(Unit, Event) 
	Unit:CastSpell(50648) 
end

function BerylSorcerer_Frostbolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9672, Unit:GetMainTank()) 
end

function BerylSorcerer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BerylSorcerer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25316, 1, "BerylSorcerer_OnCombat")
RegisterUnitEvent(25316, 2, "BerylSorcerer_OnLeaveCombat")
RegisterUnitEvent(25316, 4, "BerylSorcerer_OnDied")