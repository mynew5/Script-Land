--[[    
      __                        __  __                  ______                 
     /\ \                      /\ \/\ \                /\  _  \                 
     \ \ \      __  __     __  \ \ \_\ \  __  __  _____\ \ \_\ \  _____  ___   
      \ \ \  __/\ \/\ \  /'__`\ \ \  _  \/\ \/\ \/\ '__`\ \  __ \/\`'__\/'___\  
       \ \ \_\ \ \ \_\ \/\ \_\.\_\ \ \ \ \ \ \_\ \ \ \_\ \ \ \/\ \ \ \//\ \__/  
        \ \____/\ \____/\ \__/ \_\\ \_\ \_\/`____ \ \  __/\ \_\ \_\ \_\\ \____\ 
         \/___/  \/___/  \/__/\/_/ \/_/\/_/`/___// \ \ \/  \/_/\/_/\/_/ \/____/ 
                                              /\___/\ \_\                       
                                              \/__/  \/_/   .zapto.org 
 
    Author: Dimie (Dimarxx)
                               ]]--
 
        --[ DEFINE_VARIABLES ]--
        local MSG_LANGUAGE_UNIVERSAL = 14
        local ON_COMBAT_MSG = "Who dares challenge the king!?"
        local SWKing = nil
        local ORGKing = nil
        local BUFFS = {48161, 48073, 48469, 53307, 20217, 48936, 48932, 15366}
 
        --[ ORG_KING_ID ]--
        local ORG_id = 4949
 
        --[ ORG_KING_ID ]--
        local SW_id = 29611
 
        --[ ITEM_ID && AMOUNT ]--
        local itm_id = 121214
        local amount = 1
 
--[[ 
 
    REGISTER_ON_DEFINE 
 
    ]]--
 
--[ DEFINE_SW_KING ]--
function SW_Define(Unit, Event)
         SWKing = Unit
end
 
--[ DEFINE_ORG_KING ]--
function ORG_Define(Unit, Event)
         ORGKing    = Unit
end
 
--[[ 
 
    REGISTER_UNIT_COMBAT 
 
    ]]--
 
--[ KING_STORMWIND ]--
function KingStormwind_OnCombat(Unit, Event)
      Unit:SendChatMessage(MSG_LANGUAGE_UNIVERSAL, 0, "Horde have Entered King Varian Wrynn's Castle. Alliance Come to Stormwind.")
end
 
function KingStormwind_OnDeath(Unit, Event)
        Unit:SendBroadCastMessage(MSG_LANGUAGE_UNIVERSAL, 0, "King Varian Wrynn has been Killed! ")
            logcol(12)
            print("[King of Stormwind]: King has been killed")
            logcol(5)
            Unit:RemoveEvents()
 
            --[ REGISTER_BROADCAST ]--
        if (player:GetPlayerRace() == 1) or (player:GetPlayerRace() == 3) or (player:GetPlayerRace() == 4) or (player:GetPlayerRace() == 7) and (player:GetPlayerRace() == 11) then
            --[ ON_KILL_BOSS ]--
            local rndmplyr = IFKing:GetRandomPlayer(0)
                             local x, y, z, o = rndmplyr:GetX(), rndmplyr:GetY(), rndmplyr:GetZ(), rndmplyr:GetO()
                  IFKing:SpawnCreature(5595, x, y, z, o, 21, 0)
         IFKing:SpawnCreature(5595, x+5, y, z+3, o, 21, 0)
            --[ RNGPLAYER_ITEM_ADD ]--
            local rngplyr = IFKing:GetInRangePlayers()
                            for i = 1, #rngplyr do
                  rngplyr[i]:AddItem(itm_id, amount)
            --[ PLRS_BUFF ]--
            local plyrsrng = IFKing:GetInRangePlayers()
                         for k, v in pairs(BUFFS)
            and
                         for k, v in pairs(plyrsrng) do
                  plyrsrng[i]:CastSpell(BUFFS[v])
            --[ PLRS_MSG ]--
            local rgplrs = GetPlayersInWorld()
                         for k, v in pairs(plrs) do
    plrs[i]:SendBroadCastMessage(MSG_LANGUAGE_UNIVERSAL, 0, "The horde have taken over Stormwind")
 
    else -- killed by a command or spell
 
        if (player:GetPlayerRace() == 2) or (player:GetPlayerRace() == 5) or (player:GetPlayerRace() == 6) or (player:GetPlayerRace() == 8) and (player:GetPlayerRace() == 10) then
    Unit:SendBroadCastMessage(MSG_LANGUAGE_UNIVERSAL, 0, "The alliance have betrayed their own king!") 
end
     end
   end
end
   end
    end
 
--[ KING_ORGRIMMAR ]--
function KingOrgrimmar_OnCombat(Unit, Event)
     Unit:SendChatMessage(MSG_LANGUAGE_UNIVERSAL, 0, "Alliance have Entered Thrall's Quarters. Horde Come to Orgrimmar")
end
 
function KingOrgrimmar_OnDeath(Unit, Event)
 Unit:SendBroadCastMessage(MSG_LANGUAGE_UNIVERSAL, 0, "Warchief Thrall has been Killed! ")
        logcol(13)
        print("[King of Orgrimmar]: King has been killed")
        logcol(7)
        Unit:RemoveEvents()
 
            --[ REGISTER_BROADCAST ]-- 
        if (player:GetPlayerRace() == 1) or (player:GetPlayerRace() == 3) or (player:GetPlayerRace() == 4) or (player:GetPlayerRace() == 7) and (player:GetPlayerRace() == 11) then
            --[ ON_KILL_BOSS ]--
            local rndmplyr = Unit:GetRandomPlayer(0)
                 local x, y, z, o = rndmplyr:GetX(), rndmplyr:GetY(), rndmplyr:GetZ(), rndmplyr:GetO()
                  TBKing:SpawnCreature(14720, x, y, z, o, 21, 0)
              TBKing:SpawnCreature(14720, x+5, y, z+3, o, 21, 0)
            --[ RNGPLAYER_ITEM_ADD ]--                  
            local rngplyr = TBKing:GetInRangePlayers()
                            for i = 1, #rngplyr do
                  rngplyr[i]:AddItem(itm_id, amount)
        --[ PLRS_BUFF ]--
            local plyrsrng = TBKing:GetInRangePlayers()
                         for k, v in pairs(BUFFS)
            and
                           for k, v in pairs(plyrsrng) do
                  plyrsrng[i]:CastSpell(BUFFS[v])
            --[ PLRS_MSG ]--
            local plrs = GetPlayersInWorld()
                         for k, v in pairs(plrs) do
    plrs[i]:SendBroadCastMessage(MSG_LANGUAGE_UNIVERSAL, 0, "The alliance have taken over Orgrimmar")
 
 
    else -- killed by a command or spell
 
        if (player:GetPlayerRace() == 2) or (player:GetPlayerRace() == 5) or (player:GetPlayerRace() == 6) or (player:GetPlayerRace() == 8) and (player:GetPlayerRace() == 10) then
    Unit:SendBroadCastMessage(MSG_LANGUAGE_UNIVERSAL, 0, "The horde have betrayed their own king!") 
end
     end
   end
end
   end
    end
 
--[ LOCALS ]--
local bosstimer = math.random (180000, 360000)
 
--[ BOSS_PVP_CHECK ]--
function BossCheck(event, pPlayer)
    --[ CHECK_ORGKing ]--
    if (ORGKing = nil) then
       ORGKing:Despawn(0, 3000)
    else
       local plrs = GetPlayersInWorld()
          for k, v in pairs(plrs) do
    plrs[i]:SendBroadCastMessage(MSG_LANGUAGE_UNIVERSAL, 0, "King of Orgrimmar is still waiting for a challenge")
 
    --[ CHECK_SWKing ]--
    if (SWKing = nil) then
       SWKing:Despawn(0, 3000)
    else
       local plrs = GetPlayersInWorld()
          for k, v in pairs(plrs) do
    plrs[i]:SendBroadCastMessage(MSG_LANGUAGE_UNIVERSAL, 0, "King of Stormwind is still waiting for a challenge")
end
  end
end end
   end
 
 
 
--[[
 
    REGISTER_UNIT_EVENT
 
    ]]--
 
if (GetLuaEngine() ~= "LuaHypArc") then
               print("[IF-TB]: Did not load script - LuaHypArc not installed.")
               print("[IF-TB]: Please visit http://luahyparc.zapto.org/ for more information.")
 
else      
          --[ REGISTER_TIMED_EVENT ]--
          RegisterTimedEvent("BossCheck", bosstimer, 0)
 
          --[ REGISTER_UNIT_EVENT ]--
          RegisterUnitEvent(org_id, 1, "KingOrgrimmar_OnCombat")
          RegisterUnitEvent(org_id, 4, "KingOrgrimmar_OnDeath")
          RegisterUnitEvent(sw_id, 1, "KingStormwind_OnCombat")
          RegisterUnitEvent(sw_id, 4, "KingStormwind_OnDeath")
end