-- By Domicroat of ac-web.org

--[[function Player_OnEnterWorld(pUnit, player, Event)
local players = pUnit:GetPlayersInWorld()
    for k, v in pairs(players) do
        if(player:HasAura(69127) == false) then
            if(player:GetMapId() == 631) then
                player:SetDBCSpellVar(69127, "c_is_flags", 0x01000)
                player:CastSpell(69127)
            end
        end
        if(player:GetMapId() ~= 631) then
            player:RemoveAura(69127)
        end    
    end
end
 
RegisterTimedEvent("Player_OnEnterWorld", 1000, 0)]]