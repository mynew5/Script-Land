--[[
       Coded by: Syke
	   
	   PvP Honorable Kill script and announcer.
	   Coded for LuaHypArc! Untested with any other Lua Engines
]]--
local reward = "29434" --Badge of Justice, change to whatever

function PvP_OnHK(player, pvictim, event)
    local vic_Name = pvictim:GetName()
    local vic_Level = pvictim:GetLevel()
    player:AddItem(reward, 1)
    for k,v in pairs(GetPlayersInWorld()) do
        v:SendBroadcastMessage(vic_Name .. "[" .. vic_Level .. "] was killed by " .. player:GetName() .. "[" .. player:GetLevel() .. "]")
        --The above will broadcast "So&So[76] was killed by Someone[80]"
    end
end

RegisterServerHook(23, "PvP_OnHK")