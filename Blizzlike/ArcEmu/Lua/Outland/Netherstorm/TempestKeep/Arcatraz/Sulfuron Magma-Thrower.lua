--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Sulfuron(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("Sulfuron_FireBolt", 9000, 0)
	Unit:RegisterEvent("Sulfuron_FireShield", 13000, 0)
	Unit:RegisterEvent("Sulfuron_Charge", 21000, 0)
	Unit:SendChatMessage(14, 0, "You shall be consumed by flame!")
end

function Sulfuron_FireBolt(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(23331, Unit:GetClosestPlayer())
end

function Sulfuron_FireShield(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(24573, Unit:GetClosestPlayer())
end

function Sulfuron_Charge(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(36058, Unit:GetClosestPlayer())
end

function Sulfuron_OnDied(Unit, Event)
	Unit:SendChatMessage(14, 0, "S-s-o-o... cold.")
end

RegisterUnitEvent(20909, 1, "Sulfuron")
RegisterUnitEvent(20909, 4, "Sulfuron_OnDied")