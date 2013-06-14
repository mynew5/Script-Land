--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: DARKI; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--[[Spells ]]
local SUMMON = 23261

function Deathknight_OnCombat(Unit, Event)
end

function Deathknight_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Deathknight_OnKilledTarget(Unit, Event)
	Unit:CastSpell(SUMMON)
end

function Deathknight_OnDied(Unit, Event)
	Unit:RemoveEvents()
end 

RegisterUnitEvent(14516, 1, "Deathknight_OnCombat")
RegisterUnitEvent(14516, 2, "Deathknight_OnLeaveCombat")
RegisterUnitEvent(14516, 3, "Deathknight_OnKilledTarget")
RegisterUnitEvent(14516, 4, "Deathknight_OnDied")