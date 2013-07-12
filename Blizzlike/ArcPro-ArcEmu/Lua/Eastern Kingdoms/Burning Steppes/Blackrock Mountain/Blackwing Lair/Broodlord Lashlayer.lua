--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--[[
Broodlord Lashlayer yells: Clever, mortals - but I am not so easily lured away from my sanctum!
Broodlord Lashlayer yells: None of your kind should be here! You've doomed only yourselves!
]]--

local bl = pUnit

function Broodlord_Lashlayer_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "None of your kind should be here! You've doomed only yourselves!")
	pUnit:RegisterEvent("Cleave", 15000, 0)
	pUnit:RegisterEvent("Whelps", 190000, 0)
	pUnit:RegisterEvent("Taskmaster", 640000, 0)
	pUnit:RegisterEvent("Hatcher", 640000, 0)
	pUnit:RegisterEvent("Back", 30000, 0)
end

function Whelps(pUnit, Event)
local x,y,z,o = bl:GetX(), bl:GetY(), bl:GetZ(), bl:GetO()
	pUnit:SpawnCreature(14024, x,y,z,o, 14, 190000)
	pUnit:SpawnCreature(14025, x,y,z,o, 14, 190000)
	pUnit:SpawnCreature(14023, x,y,z,o, 14, 190000)
	pUnit:SpawnCreature(14022, x,y,z,o, 14, 190000)
end

function Taskmaster(pUnit, Event)
local x,y,z,o = bl:GetX(), bl:GetY(), bl:GetZ(), bl:GetO()
	pUnit:SpawnCreature(12458, x,y,z,o, 14, 650000)
	pUnit:SpawnCreature(12458, x,y,z,o, 14, 650000)
	pUnit:SpawnCreature(12458, x,y,z,o, 14, 650000)
end

function Hatcher(pUnit, Event)
local x,y,z,o = bl:GetX(), bl:GetY(), bl:GetZ(), bl:GetO()
	pUnit:SpawnCreature(12468, x,y,z,o, 14, 650000)
end

function Cleave(pUnit, Event)
	if(pUnit:GetMainTank() ~= nil) then
		pUnit:FullCastSpellOnTarget(15284, pUnit:GetMainTank())
	end
end

function Back(pUnit, Event)
	if(pUnit:GetMainTank() ~= nil) then
		pUnit:CastSpellOnTarget(18670, pUnit:GetMainTank())
		pUnit:RemoveThreatByPtr(pUnit:GetMainTank())
	end
end

function Broodlord_Lashlayer_OnLeaveCombat(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "Clever, mortals - but I am not so easily lured away from my sanctum!")
	pUnit:RemoveEvents()
end

function Broodlord_Lashlayer_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(12017, 1, "Broodlord_Lashlayer_OnCombat")
RegisterUnitEvent(12017, 2, "Broodlord_Lashlayer_OnLeaveCombat")
RegisterUnitEvent(12017, 4, "Broodlord_Lashlayer_OnDeath")