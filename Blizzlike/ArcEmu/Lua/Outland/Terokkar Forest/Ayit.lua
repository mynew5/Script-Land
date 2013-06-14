--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Mager; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Ayit_ShieldBash(Unit)
	Unit:CastSpellOnTarget(11972)
end

function Ayit_OnCombat(Unit, Event)
	Unit:RegisterEvent("Ayit_ShieldBash", math.random(7500,10000), 0)
end

RegisterUnitEvent(18540, 1, "Ayit_OnCombat")