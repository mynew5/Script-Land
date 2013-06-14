--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Performer/Performa; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--[[ Nagrand - Bach'lor.lua

This script was written and is protected
by the GPL v2. This script was released
by Performer/Performa of the Blua Scripting
Project. Please give proper accredidations
when re-releasing or sharing this script
with others in the emulation community.

~~End of License Agreement
-- Performa, August 25th, 2008. ]]

function Bachlor_Gore(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(32019, Unit:MainTank())
end

function Bachlor_TalbukStrike(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(32020, Unit:MainTank())
end

function Bachlor(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("Bachlor_Gore", 15000, 0)
	Unit:RegisterEvent("Bachlor_TalbukStrike", 25000, 0)
end

function Bachlor_Death(Unit)
    Unit:RemoveEvents()
end

function Bachlor_OnleaveCombat(Unit)
    Unit:RemoveEvents()
end

RegisterUnitEvent(18258, 1, "Bachlor")
RegisterUnitEvent(18258, 2, "Bachlor_OnleaveCombat")
RegisterUnitEvent(18258, 4, "Bachlor_Death")