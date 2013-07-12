--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--[[ Nagrand - Boulderfist Mystic.lua

This script was written and is protected
by the GPL v2. This script was released
by Performer/Performa of the Blua Scripting
Project. Please give proper accredidations
when re-releasing or sharing this script
with others in the emulation community.

~~End of License Agreement
-- Performa, August 25th, 2008. ]]

function Boulderfistmystic_LightningBolt(Unit, Event, MiscUnit, Misc)
    Unit:FullCastSpellOnTarget(9532, Unit:MainTank())
end

function Boulderfistmystic_EarthShock(Unit, Event, MiscUnit, Misc)
    Unit:FullCastSpellOnTarget(13281, Unit:MainTank())
end

function Boulderfistmystic_HealingTouch(Unit, Event, MiscUnit, Misc)
    if(Unit:GetHealthPct() < 30) then
		Unit:FullCastSpell(11431)
	end
end

function Boulderfistmystic(Unit, Event, MiscUnit, Misc)
    Unit:RegisterEvent("Boulderfistmystic_LightningBolt", 8500, 0)
	Unit:RegisterEvent("Boulderfistmystic_Earthshock", 6700, 0)
	Unit:RegisterEvent("Boulderfistmystic_HealingTouch", 3000, 0)
end

function Boulderfistmystic_Death(Unit)
    Unit:RemoveEvents()
end

function Boulderfistmystic_OnLeaveCombat(Unit)
    Unit:RemoveEvents()
end

RegisterUnitEvent(17135, 1, "Boulderfistmystic")
RegisterUnitEvent(17135, 2, "Boulderfistmystic_OnLeaveCombat")
RegisterUnitEvent(17135, 3, "Boulderfistmystic_Death")