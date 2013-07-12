--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Hellgawd; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function UmbEel_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

function UmbEel_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("electricskin", 1000, 0)
end

function electricskin(pUnit, Event)
	pUnit:CastSpell(35319)
end

function UmbEel_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function UmbEel_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(18138, 1, "UmbEel_OnEnterCombat")
RegisterUnitEvent(18138, 2, "UmbEel_OnLeaveCombat")
RegisterUnitEvent(18138, 4, "UmbEel_OnDied")