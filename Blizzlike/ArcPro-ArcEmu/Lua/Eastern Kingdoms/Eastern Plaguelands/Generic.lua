--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Darrowshire_Spirit_Spawn(pUnit, Event)
local x,y,z,o = pUnit:GetX(),pUnit:GetY(),pUnit:GetZ(),pUnit:GetO()
local DoSpawn = math.random (1,2)
	if(DoSpawn == 1) then
		pUnit:SpawnCreature(11064, x,y,z,o, 35, 300000)
	else
	end
end

RegisterUnitEvent(8530, 4, "Darrowshire_Spirit_Spawn")
RegisterUnitEvent(8531, 4, "Darrowshire_Spirit_Spawn")
RegisterUnitEvent(8532, 4, "Darrowshire_Spirit_Spawn")