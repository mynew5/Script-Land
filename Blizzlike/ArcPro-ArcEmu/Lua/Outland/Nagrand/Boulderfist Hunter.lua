--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--[[ Nagrand - Boulderfist Hunter.lua

This script was written and is protected
by the GPL v2. This script was released
by Performer/Performa of the Blua Scripting
Project. Please give proper accredidations
when re-releasing or sharing this script
with others in the emulation community.

~~End of License Agreement
-- Performa, August 25th, 2008. ]]

function Boulderfisthunter_Spell(Unit, Event, MiscUnit, Misc)
    Unit:FullCastSpellOnTarget(32248, Unit:MainTank())
end

function Boulderfisthunter(Unit, Event, MiscUnit, Misc)
    Unit:RegisterEvent("Boulderfisthunter_Spell", 5000, 0)
end

function Boulderfisthunter_Death(Unit)
    Unit:RemoveEvents()
end

function Boulderfisthunter_OnLeaveCombat(Unit)
    Unit:RemoveEvents()
end

RegisterUnitEvent(18352, 1, "Boulderfisthunter")
RegisterUnitEvent(18352, 2, "Boulderfisthunter_OnLeaveCombat")
RegisterUnitEvent(18352, 3, "Boulderfisthunter_Death")