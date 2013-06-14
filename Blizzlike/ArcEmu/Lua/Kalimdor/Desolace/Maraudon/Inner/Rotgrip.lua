--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Rotgrip_OnCombat(Unit, Event)
	Unit:RegisterEvent("Bite", 7000, 0)
	Unit:RegisterEvent("Puncture", 14000, 0)
end

function Bite(pUnit, Event) 
	pUnit:CastSpellOnTarget(16495, Unit:GetRandomPlayer()) 
end

function Puncture(pUnit, Event) 
	pUnit:CastSpellOnTarget(15976, pUnit:GetMainTank()) 
end

function Rotgrip_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Rotgrip_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(13596, 1, "Rotgrip_OnCombat")
RegisterUnitEvent(13596, 2, "Rotgrip_OnLeaveCombat")
RegisterUnitEvent(13596, 4, "Rotgrip_OnDied")