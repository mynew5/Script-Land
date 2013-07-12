function Return_To_Angrathar_Quest_On_Finish_A(pPlayer, QuestId)
if (pPlayer:GetTeam() == 0) then
local Packet = LuaPacket:CreatePacket(0x464, 4)
Packet:WriteULong(14)
pPlayer:SendPacketToPlayer(Packet)
end
end

RegisterServerHook(12499, 2, Return_To_Angrathar_Quest_On_Finish_A)

function Return_ToAngrathar_Quest_On_Finish_H(pPlayer, QuestId)
if (pPlayer:GetTeam() == 1) then
local Packet = LuaPacket:CreatePacket(0x464, 4)
Packet:WriteULong(14)
pPlayer:SendPacketToPlayer(Packet)
end
end

RegisterServerHook(12500, 2, Return_ToAngrathar_Quest_On_Finish_H)