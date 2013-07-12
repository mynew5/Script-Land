--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: LUA++, Ikillonyxia; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
math.randomseed(os.time())

function DoomlordKazzak_ShadowboltVolleyRepeat(Unit, Event)
    Unit:CastSpell(29924)
    Unit:RegisterEvent("DoomlordKazzak_ShadowboltVolley", math.random(18000,20000), 1)
end

function DoomlordKazzak_ShadowboltVolley(Unit, Event)
    Unit:CastSpell(29924)
    Unit:RegisterEvent("DoomlordKazzak_ShadowboltVolleyRepeat", math.random(18000,20000), 1)
end

function DoomlordKazzak_TwistedReflectionCheck(Unit, Event)
     if((twistedreflectplayer:GetHealthPct() < playercurrenthp) and (twistedreflectplayer:HasAura(21063) == true) and (twistedreflectplayer:IsAlive())) then
     	Unit:CastSpell(21064)
     	twistedreflectplayer:RemoveAura(21063)
     end
end

function DoomlordKazzak_TwistedReflection(Unit, Event)
    twistedreflectplayer=Unit:GetRandomPlayer(0)
    playercurrenthp=twistedreflectplayer:GetHealthPct()
    Unit:FullCastSpellOnTarget(21063, twistedreflectplayer)
    Unit:RegisterEvent("DoomlordKazzak_TwistedReflectionCheck", 1000, 45)
end    

function DoomlordKazzak_Thunderclap(Unit, Event)
    Unit:FullCastSpell(36706)
end

function DoomlordKazzak_Cleave(Unit, Event)
    Unit:FullCastSpellOnTarget(31043, Unit:GetMainTank())
end

function DoomlordKazzak_Enrage(Unit, Event)
    Unit:FullCastSpell(32964)
end

function DoomlordKazzak_MarkOfKazzakVarCheck(Unit, Event)
    if(explode == 1) then
    	explode = nil
    end
end

function DoomlordKazzak_MarkOfKazzakExplodeCheck(Unit, Event)
    if((markofkazzaktarget:GetManaPct() < 1) and (explode == nil)) then
		explode=1
		Unit:SpawnCreature(70099, markofkazzaktarget:GetX(), markofkazzaktarget:GetY(), markofkazzaktarget:GetZ(), 90, 14, 0)
    end
end     

function DoomlordKazzak_MarkOfKazzakDrain(Unit, Event)
    if(markofkazzaktarget:GetManaPct() < 6) then
     	markofkazzaktarget:SetMana(markofkazzaktarget:GetMana() - markofkazzaktarget:GetMana())
    else
		markofkazzaktarget:SetMana(markofkazzaktarget:GetMana() - markofkazzaktarget:GetMaxMana() / (20))
    end
end

function DoomlordKazzak_MarkOfKazzak(Unit, Event)
    Unit:FullCastSpellOnTarget(32960, Unit:GetRandomPlayer(4))
	Unit:RegisterEvent("DoomlordKazzak_MarkOfKazzakDrain", 1000, 10)
	Unit:RegisterEvent("DoomlordKazzak_MarkOfKazzakExplodeCheck", 1001, 10)
	Unit:RegisterEvent("DoomlordKazzak_MarkOfKazzakVarCheck", 10200, 1)
end

function DoomlordKazzak_Voidbolt(Unit, Event)
    if(Unit:GetDistance(Unit:GetClosestPlayer()) > 10) then
     	Unit:FullCastSpellOnTarget(21066, Unit:GetRandomPlayer(0))
    end
end

function DoomlordKazzak_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("DoomlordKazzak_ShadowboltVolley", math.random(18000,20000), 1)
    Unit:RegisterEvent("DoomlordKazzak_TwistedReflection", 25000, 0)
    Unit:RegisterEvent("DoomlordKazzak_Thunderclap", 14800, 0)
    Unit:RegisterEvent("DoomlordKazzak_Cleave", 9000, 0)
    Unit:RegisterEvent("DoomlordKazzak_Enrage", 54000, 0)
    Unit:RegisterEvent("DoomlordKazzak_MarkOfKazzak", 29000, 0)
    Unit:RegisterEvent("DoomlordKazzak_Voidbolt", 2000, 0)
    if(math.random(1,2) == 1) then
		Unit:SendChatMessage(14, 0, "All mortals will perish!")
		Unit:PlaySoundToSet(11334)
    else
		Unit:SendChatMessage(14, 0, "The Legion will conquer all!")
		Unit:PlaySoundToSet(11333)
    end
end

function DoomlordKazzak_Wipe(Unit, Event)
    Unit:RemoveEvents()
end

function DoomlordKazzak_KillsPlayer(Unit, event, pMisc)
    Unit:SendChatMessage(14,0,"Your own strength feeds me, "..pMisc:GetName().."!")
    Unit:FullCastSpell(32966)
end

function DoomlordKazzak_Dies(Unit, Event)
    Unit:RemoveEvents()
    Unit:SendChatMessage(14, 0, "The Legion... will never... fall.")
    Unit:PlaySoundToSet(11340)
end

function DoomlordKazzak_Spawn(Unit, Event)
    Unit:SendChatMessage(14, 0, "I remember well the sting of defeat at the conclusion of the Third War. I have waited far too long for my revenge. Now the shadow of the Legion falls over this world. It is only a matter of time until all of your failed creation... is undone.")
    Unit:PlaySoundToSet(11332)
end

RegisterUnitEvent(18728, 18, "DoomlordKazzak_Spawn")
RegisterUnitEvent(18728, 1, "DoomlordKazzak_OnEnterCombat")
RegisterUnitEvent(18728, 2, "DoomlordKazzak_Wipe")
RegisterUnitEvent(18728, 3, "DoomlordKazzak_KillsPlayer")
RegisterUnitEvent(18728, 4, "DoomlordKazzak_Dies")

function MarkOfKazzakExplosion_OnSpawn(Unit, Event)
    Unit:SetCombatMeleeCapable(1)
    Unit:SetCombatTargetingCapable(1)
	Unit:DisableRespawn(1)
    Unit:FullCastSpell(32961)
    Unit:Despawn(100, 0)
end

RegisterUnitEvent(70099, 18, "MarkOfKazzakExplosion_OnSpawn")