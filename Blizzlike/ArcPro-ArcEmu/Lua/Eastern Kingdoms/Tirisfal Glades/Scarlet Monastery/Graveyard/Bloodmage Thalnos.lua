--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Thalnos_Shadowbolt(pUnit, Event)
local target = pUnit:GetMainTank()
	if (target ~= nil) then
		pUnit:StopMovement(1000)
		pUnit:FullCastSpellOnTarget(9613, target)
	end
end

function Thalnos_Firespike(pUnit, Event)
local maintank=pUnit:GetMainTank();
local x = maintank:GetX()
local y = maintank:GetY()
local z = maintank:GetZ()
	pUnit:RemoveEvents()
	pUnit:StopMovement(1000)
	pUnit:CastSpellAoF(x, y, z, 8814)
	pUnit:RegisterEvent("Thalnos_OnCombat2", 3500, 0)
end

function Thalnos_Firespike2(pUnit, Event)
local maintank=pUnit:GetMainTank()
local x = maintank:GetX()
local y = maintank:GetY()
local z = maintank:GetZ()
	pUnit:RemoveEvents()
	pUnit:StopMovement(1000)
	pUnit:CastSpellAoF(x, y, z, 8814)
	pUnit:RegisterEvent("Thalnos_OnCombat3", 3500, 0)
end

function Thalnos_Aggro(pUnit, Event)
    pUnit:SendChatMessage(14, 0, "We hunger for vengeance.")
	pUnit:PlaySoundToSet(5844)
end

function Thalnos_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "More... More souls!")
    pUnit:RegisterEvent("Thalnos_Aggro", 500, 1)
    pUnit:RegisterEvent("Thalnos_OnCombat2", 1000, 0)
end

function Thalnos_OnCombat2(pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:RegisterEvent("Thalnos_Shadowbolt", math.random(5000, 7000), 0)
	pUnit:RegisterEvent("Thalnos_Firespike", math.random(20000, 30000), 0)
	pUnit:RegisterEvent("Thalnos_Health", 1000, 0)
end

function Thalnos_Health(pUnit, event, Event)
    if (pUnit:GetHealthPct() < 50) then
	    pUnit:RemoveEvents()
		pUnit:SendChatMessage(14, 0, "No rest, for the angry dead.")
		pUnit:PlaySoundToSet(5846)
		pUnit:RegisterEvent("Thalnos_OnCombat3", 1000, 0)
	end
end

function Thalnos_OnCombat3(pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:RegisterEvent("Thalnos_Shadowbolt", math.random(5000, 7000), 0)
	pUnit:RegisterEvent("Thalnos_Firespike", math.random(20000, 30000), 0)
end

function Thalnos_OnKillPlayer(pUnit, Event)
    pUnit:SendChatMessage(14, 0, "More... More souls.")
	pUnit:PlaySoundToSet(5845)
end

function Thalnos_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(4543, 1, "Thalnos_OnCombat")
RegisterUnitEvent(4543, 2, "Thalnos_OnLeaveCombat")
RegisterUnitEvent(4543, 3, "Thalnos_OnKillPlayer")