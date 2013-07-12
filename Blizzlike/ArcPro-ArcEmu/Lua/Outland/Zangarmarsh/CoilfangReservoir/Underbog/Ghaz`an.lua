--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Ghazan(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Ghazan_Acid_Split", 5000, 0)
	Unit:RegisterEvent("Ghazan_Acid_Breath", 11000, 0)
	Unit:RegisterEvent("Ghazan_Sweep", 15000, 0)
end

function Ghazan_Acid_Split(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(34290, Unit:GetClosestPlayer())
end

function Ghazan_Acid_Breath(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(24839, Unit:GetClosestPlayer())
end

function Ghazan_Sweep(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(25653, Unit:GetClosestPlayer())
end

RegisterUnitEvent(18105,1,"Ghazan")