-- 2D's LUA

function DragonWitchDeafeningRoarThree(pUnit, event)
     if pUnit:GetHealthPct() < 25 then
     print "DragonWitch_DeafeningRoar initiated..."
     pUnit:RemoveEvents()
     pUnit:CastSpell(38850)
     pUnit:RegisterEvent("DragonWitchCleave", 17000, 0)
     pUnit:RegisterEvent("DragonWitchFear", 21000, 0)
     end
end

function DragonWitchDeafeningRoarTwo(pUnit, event)
     if pUnit:GetHealthPct() < 50 then
     print "DragonWitch_DeafeningRoar initiated..."
     pUnit:RemoveEvents()
     pUnit:CastSpell(38850)
     pUnit:RegisterEvent("DragonWitchCleave", 17000, 0)
     pUnit:RegisterEvent("DragonWitchFear", 21000, 0)
     pUnit:RegisterEvent("DragonWitchDeafeningRoarThree", 1000, 0)
     end
end

function DragonWitchDeafeningRoar(pUnit, event)
     if pUnit:GetHealthPct() < 75 then
     print "DragonWitch_DeafeningRoar initiated..."
     pUnit:RemoveEvents()
     pUnit:CastSpell(38850)
     pUnit:RegisterEvent("DragonWitchCleave", 17000, 0)
     pUnit:RegisterEvent("DragonWitchFear", 21000, 0)
     pUnit:RegisterEvent("DragonWitchDeafeningRoarTwo", 1000, 0)
     end
end

function DragonWitchCleave(pUnit, event)    
     print "DragonWitch_Cleave initiating..."
     pUnit:FullCastSpellOnTarget(31043, pUnit:GetMainTank())
end

function DragonWitchFear(pUnit, event)
     print "DragonWitch_fear initiated..."
     pUnit:FullCastSpellOnTarget(30530, pUnit:GetRandomPlayer(0))
end

function DragonWitchTheFierce_RemoveRezSickness(pUnit, event)
     player=pUnit:GetRandomPlayer(0);
     player:RemoveAura(15007)
end

RegisterUnitEvent(8000000, 1, "DragonWitchTheFierce_OnEnterCombat")

function DragonWitchTheFierce_Wipe(pUnit, event)
     print "DragonWitch_Wipe initiating..."
     pUnit:RemoveEvents()
end

RegisterUnitEvent(8000000, 2, "DragonWitchTheFierce_Wipe")

function DragonWitchTheFierce_Dies(pUnit, event)
     print "DragonWitch_Dies initiating..."
     pUnit:SendChatMessage(12, 0, "You may have defeated me... but you are no match for My Brother!!")
     pUnit:RemoveEvents()
end

RegisterUnitEvent(8000000, 4, "DragonWitchTheFierce_Dies")

