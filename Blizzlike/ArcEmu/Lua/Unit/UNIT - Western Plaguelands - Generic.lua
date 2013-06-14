--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Arajs_Phylactery (pUnit, Event)
	pUnit:SpawnGameObject(177241, pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), pUnit:GetO(), 600000)
end

RegisterUnitEvent(1852, 4, "Arajs_Phylactery")