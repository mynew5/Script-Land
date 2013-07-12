--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Seylanna_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Seylanna_Crystal", 2000, 0)
    Unit:RegisterEvent("Seylanna_Beam", 4000, 0)
end

function Seylanna_Crystal(Unit, Event)
    Unit:CastSpell(36179)
end   
   
function Seylanna_Beam(Unit, Event)
    Unit:FullCastSpellOnTarget(35919, Unit:ClosestPlayer())
end
    
function Seylanna_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Seylanna_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20397, 1, "Seylanna_OnEnterCombat")
RegisterUnitEvent(20397, 2, "Seylanna_OnLeaveCombat")
RegisterUnitEvent(20397, 4, "Seylanna_OnDied")