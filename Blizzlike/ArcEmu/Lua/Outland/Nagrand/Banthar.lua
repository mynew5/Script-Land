--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Performer/Performa; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--[[ Nagrand - Banthar.lua

This script was written and is protected
by the GPL v2. This script was released
by Performer/Performa of the Blua Scripting
Project. Please give proper accredidations
when re-releasing or sharing this script
with others in the emulation community.

~~End of License Agreement
-- Performa, August 25th, 2008. ]]

function Banthar_Spell(Unit, Event, MiscUnit, Misc)
    Unit:FullCastSpellOnTarget(32023, Unit:MainTank())
end

function Banthar(Unit, Event, MiscUnit, Misc)
    Unit:RegisterEvent("Banthar_Spell", 20000, 0)
end

function Banthar_Death(Unit)
    Unit:RemoveEvents()
end

function Banthar_OnLeaveCombat(Unit)
    Unit:RemoveEvents()
end

RegisterUnitEvent(18259, 1, "Banthar")
RegisterUnitEvent(18259, 2, "Banthar_OnLeaveCombat")
RegisterUnitEvent(18259, 3, "Banthar_Death")