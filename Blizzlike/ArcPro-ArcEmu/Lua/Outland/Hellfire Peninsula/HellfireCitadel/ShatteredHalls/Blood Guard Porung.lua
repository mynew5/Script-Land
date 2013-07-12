--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[Blood Guard Porung yells: Aim!
Blood Guard Porung yells: Archers, form ranks! On my mark!
Blood Guard Porung yells: Fire!
Blood Guard Porung yells: Ready!
Blood Guard Porung says: For Kargath! For Victory!
Blood Guard Porung says: Gakarah ma!
Blood Guard Porung says: Lok narash!
Blood Guard Porung says: Lok'tar Illadari!
Blood Guard Porung says: The blood is our power!
Blood Guard Porung says: This world is OURS!
Blood Guard Porung says: We are the true Horde!]]

function Porung(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("Porung_Fear", 10000, 0)
	Unit:RegisterEvent("Porung_Cleave", 15000, 0)
end

function Porung_Fear(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(30530, Unit:GetClosestPlayer())
end

function Porung_Cleave(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(38474, Unit:GetClosestPlayer())
end

RegisterUnitEvent(20923,1,"Porung")