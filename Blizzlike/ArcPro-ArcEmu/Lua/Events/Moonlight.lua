NPC_MOONLIGHT = 15897
GO_GREATER_MOONLIGHT = 300058

function OnLoad(pUnit, event)
local moonlight = pUnit:GetGameObjectNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), GO_GREATER_MOONLIGHT)
if(moonlight == nil)then
	PerformIngameSpawn(2, GO_GREATER_MOONLIGHT, pUnit:GetMapId(), pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), pUnit:GetO(), 1, 0)
end
end

RegisterUnitEvent(NPC_MOONLIGHT,18,OnLoad)
