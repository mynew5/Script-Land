--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Quagmirran(Unit, Event, miscUnit, misc)
	Unit:RegisterEvent("Quagmirran_Acid_Gayser", 8000, 0)
	Unit:RegisterEvent("Quagmirran_Poison_Bolt", 11000, 0)
end

function Quagmirran_Acid_Gayser(Unit, Event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(38739, Unit:GetClosestPlayer())
	Unit:SendChatMessage(12, 0, "BAM...")
end

function Quagmirran_Poison_Bolt(Unit, Event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(38655, Unit:GetClosestPlayer())
	Unit:SendChatMessage(12, 0, "Some Poison...")
end

RegisterUnitEvent(17942, 1, "Quagmirran")