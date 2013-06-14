--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Performer/Performa; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--[[ Nagrand - Boulderfist Crusher.lua

This script was written and is protected
by the GPL v2. This script was released
by Performer/Performa of the Blua Scripting
Project. Please give proper accredidations
when re-releasing or sharing this script
with others in the emulation community.

~~End of License Agreement
-- Performa, August 25th, 2008. ]]

function Boulderfistcrusher_Pulverize(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(2676, Unit:MainTank())
end

function Boulderfistcrusher(Unit, Event, MiscUnit, Misc)
    Unit:RegisterEvent("Boulderfistcrusher_Pulverize", 12000, 0)
end

function Boulderfistcrusher_Death(Unit)
    Unit:RemoveEvents()
end

function Boulderfistcrusher_OnLeaveCombat(Unit)
    Unit:RemoveEvents()
end

RegisterUnitEvent(17134, 1, "Boulderfistcrusher")
RegisterUnitEvent(17134, 2, "Boulderfistcrusher_OnLeaveCombat")
RegisterUnitEvent(17134, 3, "Boulderfistcrusher_Death")