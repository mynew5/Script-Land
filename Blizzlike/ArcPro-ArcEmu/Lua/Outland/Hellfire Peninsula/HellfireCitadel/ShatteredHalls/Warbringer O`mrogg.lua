--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Omrogg(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("Omrogg_Fear", 10000, 0)
	Unit:RegisterEvent("Omrogg_Thunderclap", 15000, 0)
	Unit:RegisterEvent("Omrogg_Blast_Wave", 21000, 0)
	Unit:RegisterEvent("Omrogg_Aggro_Switch", 25000, 0)
end

function Omrogg_Fear(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(33547, Unit:GetClosestPlayer())
end

function Omrogg_Thunderclap(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(30633, Unit:GetClosestPlayer())
end

function Omrogg_Blast_Wave(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(36278, Unit:GetClosestPlayer())
end

function Omrogg_Aggro_Switch(Unit)
	Unit:GetAddTank()
end

RegisterUnitEvent(16809, 1, "Omrogg")