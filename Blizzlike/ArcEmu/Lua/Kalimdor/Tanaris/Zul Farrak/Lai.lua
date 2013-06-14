--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: DARKI; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local check = 0

function Lai_OnEnterCombat(pUnit, Event)
    pUnit:RegisterEvent("Lai_ShadowBolt", 18000, 0)
    pUnit:RegisterEvent("Lai_Nethervapor", 13000, 0)
    pUnit:RegisterEvent("Lai_Fear", 9000, 0)
    pUnit:RegisterEvent("Lai_Nova", 23000, 0)
    pUnit:RegisterEvent("Lai_EventSummon", 1500, 1)
    if(check == 0) then
		pUnit:RegisterEvent("Lai_EventPhase2Check", 1500,0)
    else
    end
end

function Lai_ShadowBolt(pUnit, Event)
    if(pUnit:GetRandomPlayer(0)) then
		pUnit:FullCastSpellOnTarget(29317, pUnit:GetRandomPlayer(0))
    else
    end
end

function Lai_Nethervapor(pUnit, Event)
    if(pUnit:GetMainTank()) then
		pUnit:SendChatMessage(12, 0, "You may not pass!")
		pUnit:FullCastSpellOnTarget(35859, pUnit:GetMainTank())
    else
    end
end

function Lai_Fear(pUnit, event, miscunit)
    pUnit:SendChatMessage(12, 0, "Cower in fear!")
    pUnit:FullCastSpell(33547)
end

function Lai_Nova(pUnit, Event)
    pUnit:SendChatMessage(12, 0, "The Masters fire rages inside of me!")
    pUnit:FullCastSpell(40737)
end

function Lai_EventSummon(pUnit, Event)
    pUnit:SpawnCreature(22990, pUnit:GetRandomPlayer(0):GetX()+15, pUnit:GetRandomPlayer(0):GetY(), pUnit:GetRandomPlayer(0):GetZ(), 90, 1836, 0)
end

function Lai_EventPhase2(pUnit, Event)
    pUnit:SendChatMessage(12, 0, "Im really angry now...")
    pUnit:SpawnCreature(21961, pUnit:GetX()+15, pUnit:GetY(), pUnit:GetZ(), 90, 14, 0)
end

function Lai_EventPhase2Check(pUnit, Event)
    if(pUnit:GetHealthPct() < 50) then
        if(check == 0) then
            check=1
            pUnit:RegisterEvent("Lai_EventPhase2",1500, 1)
        else
        end
    else
    end
end

function LaiHlp_OnEnterCombat(pUnit, Event)
    pUnit:SendChatMessage(12, 0, "Master!! I'll assist you!")
    pUnit:RegisterEvent("LaiHlp_Infuse", 30000, 0)
    pUnit:RegisterEvent("LaiHlp_Heal", 10000, 0)
end

function LaiHlp_Infuse(pUnit, Event)
    pUnit:FullCastSpellOnTarget(40594, pUnit:GetRandomFriend())
end

function LaiHlp_Heal(pUnit, Event)
    pUnit:FullCastSpellOnTarget(23954, pUnit:GetRandomFriend())
end

function Lai_OnWipe(pUnit, Event)
    pUnit:SendChatMessage(12, 0, "You lost...!")
    pUnit:RemoveEvents()
end

function Lai_Dies(pUnit, Event)
    pUnit:SendChatMessage(12, 0, "You weren't prepared! I thought...")
    pUnit:FullCastSpell(29949)
    pUnit:RemoveEvents()
end

function Spawns_OnLeaveCombat(pUnit, Event)
    pUnit:Despawn(1000,0)
end

RegisterUnitEvent(22990, 2, "Spawns_OnLeaveCombat")
RegisterUnitEvent(23174, 2, "Spawns_OnLeaveCombat")
RegisterUnitEvent(230040, 1, "Lai_OnEnterCombat")
RegisterUnitEvent(230040, 2, "Lai_OnWipe")
RegisterUnitEvent(230040, 4, "Lai_Dies")