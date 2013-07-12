--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--HORDE--
--Undercity
function TaxiUC_OnCombat(Unit, Event)
local x,y,z,o = Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO()
	Unit:SpawnCreature(9521, x,y,z,o, 68, 60000)
	Unit:SpawnCreature(9521, x,y,z,o, 68, 60000)
	Unit:SpawnCreature(9521, x,y,z,o, 68, 60000)
	Unit:SpawnCreature(9521, x,y,z,o, 68, 60000)
	Unit:SpawnCreature(9521, x,y,z,o, 68, 60000)
	Unit:SpawnCreature(9521, x,y,z,o, 68, 60000)
end

function TaxiUC_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function TaxiUC_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(4551, 1, "TaxiUC_OnCombat")
RegisterUnitEvent(4551, 2, "TaxiUC_OnLeaveCombat")
RegisterUnitEvent(4551, 4, "TaxiUC_OnDied")

--Thunderbluff
function TaxiTB_OnCombat(Unit, Event)
local x,y,z,o = Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO()
	Unit:SpawnCreature(9297, x,y,z,o, 83, 60000)
	Unit:SpawnCreature(9297, x,y,z,o, 83, 60000)
	Unit:SpawnCreature(9297, x,y,z,o, 83, 60000)
	Unit:SpawnCreature(9297, x,y,z,o, 83, 60000)
	Unit:SpawnCreature(9297, x,y,z,o, 83, 60000)
	Unit:SpawnCreature(9297, x,y,z,o, 83, 60000)
end

function TaxiTB_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function TaxiTB_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2995, 1, "TaxiTB_OnCombat")
RegisterUnitEvent(2995, 2, "TaxiTB_OnLeaveCombat")
RegisterUnitEvent(2995, 4, "TaxiTB_OnDied")

--Silvermoon
function TaxiSM_OnCombat(Unit, Event)
local x,y,z,o = Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO()
	Unit:SpawnCreature(9521, x,y,z,o, 1602, 60000)
	Unit:SpawnCreature(9521, x,y,z,o, 1602, 60000)
	Unit:SpawnCreature(9521, x,y,z,o, 1602, 60000)
	Unit:SpawnCreature(9521, x,y,z,o, 1602, 60000)
	Unit:SpawnCreature(9521, x,y,z,o, 1602, 60000)
	Unit:SpawnCreature(9521, x,y,z,o, 1602, 60000)
end

function TaxiSM_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function TaxiSM_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(16192, 1, "TaxiSM_OnCombat")
RegisterUnitEvent(16192, 2, "TaxiSM_OnLeaveCombat")
RegisterUnitEvent(16192, 4, "TaxiSM_OnDied")

--Orgimmar
function TaxiOG_OnCombat(Unit, Event)
local x,y,z,o = Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO()
	Unit:SpawnCreature(9297, x,y,z,o, 83, 60000)
	Unit:SpawnCreature(9297, x,y,z,o, 83, 60000)
	Unit:SpawnCreature(9297, x,y,z,o, 83, 60000)
	Unit:SpawnCreature(9297, x,y,z,o, 83, 60000)
	Unit:SpawnCreature(9297, x,y,z,o, 83, 60000)
	Unit:SpawnCreature(9297, x,y,z,o, 83, 60000)
end

function TaxiOG_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function TaxiOG_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(3310, 1, "TaxiOG_OnCombat")
RegisterUnitEvent(3310, 2, "TaxiOG_OnLeaveCombat")
RegisterUnitEvent(3310, 4, "TaxiOG_OnDied")

--Alliance
--Stormwind
function TaxiSW_OnCombat(Unit, Event)
local x,y,z,o = Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO()
	Unit:SpawnCreature(9526, x,y,z,o, 12, 60000)
	Unit:SpawnCreature(9526, x,y,z,o, 12, 60000)
	Unit:SpawnCreature(9526, x,y,z,o, 12, 60000)
	Unit:SpawnCreature(9526, x,y,z,o, 12, 60000)
	Unit:SpawnCreature(9526, x,y,z,o, 12, 60000)
	Unit:SpawnCreature(9526, x,y,z,o, 12, 60000)
end

function TaxiSW_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function TaxiSW_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(352, 1, "TaxiSW_OnCombat")
RegisterUnitEvent(352, 2, "TaxiSW_OnLeaveCombat")
RegisterUnitEvent(352, 4, "TaxiSW_OnDied")

--Darnassus
function TaxiRT_OnCombat(Unit, Event)
local x,y,z,o = Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO()
	Unit:SpawnCreature(9527, x,y,z,o, 80, 60000)
	Unit:SpawnCreature(9527, x,y,z,o, 80, 60000)
	Unit:SpawnCreature(9527, x,y,z,o, 80, 60000)
	Unit:SpawnCreature(9527, x,y,z,o, 80, 60000)
	Unit:SpawnCreature(9527, x,y,z,o, 80, 60000)
	Unit:SpawnCreature(9527, x,y,z,o, 80, 60000)
end

function TaxiRT_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function TaxiRT_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(3838, 1, "TaxiRT_OnCombat")
RegisterUnitEvent(3838, 2, "TaxiRT_OnLeaveCombat")
RegisterUnitEvent(3838, 4, "TaxiRT_OnDied")

--Ironforge
function TaxiIF_OnCombat(Unit, Event)
local x,y,z,o = Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO()
	Unit:SpawnCreature(9526, x,y,z,o, 55, 60000)
	Unit:SpawnCreature(9526, x,y,z,o, 55, 60000)
	Unit:SpawnCreature(9526, x,y,z,o, 55, 60000)
	Unit:SpawnCreature(9526, x,y,z,o, 55, 60000)
	Unit:SpawnCreature(9526, x,y,z,o, 55, 60000)
	Unit:SpawnCreature(9526, x,y,z,o, 55, 60000)
end

function TaxiIF_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function TaxiIF_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(1573, 1, "TaxiIF_OnCombat")
RegisterUnitEvent(1573, 2, "TaxiIF_OnLeaveCombat")
RegisterUnitEvent(1573, 4, "TaxiIF_OnDied")

--Exodar
function TaxiEX_OnCombat(Unit, Event)
local x,y,z,o = Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO()
	Unit:SpawnCreature(9527, x,y,z,o, 1638, 60000)
	Unit:SpawnCreature(9527, x,y,z,o, 1638, 60000)
	Unit:SpawnCreature(9527, x,y,z,o, 1638, 60000)
	Unit:SpawnCreature(9527, x,y,z,o, 1638, 60000)
	Unit:SpawnCreature(9527, x,y,z,o, 1638, 60000)
	Unit:SpawnCreature(9527, x,y,z,o, 1638, 60000)
end

function TaxiEX_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function TaxiEX_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17555, 1, "TaxiEX_OnCombat")
RegisterUnitEvent(17555, 2, "TaxiEX_OnLeaveCombat")
RegisterUnitEvent(17555, 4, "TaxiEX_OnDied")