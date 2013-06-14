function Phase_110(pUnit, Event)
 if pUnit:GetHealthPct() < 95 then
  pUnit:RemoveEvents();
  pUnit:FullCastSpell(25212)
  pUnit:RegisterEvent("Phase_220",1000, 0)
 end
end
 
function Phase_220(pUnit, Event)
 if pUnit:GetHealthPct() < 85 then
  pUnit:RemoveEvents();
  pUnit:FullCastSpell(25212)
  pUnit:RegisterEvent("Phase_330",1000, 0)
 end
end
 
function Phase_330(pUnit, Event)
 if pUnit:GetHealthPct() < 75 then
  pUnit:RemoveEvents();
  pUnit:SendChatMessage (11, 0, "Feel my wrath!")
  pUnit:FullCastSpell(30330)
  pUnit:RegisterEvent("Phase_440",1000, 0)
 end
end
 
function Phase_440(pUnit, Event)
 if pUnit:GetHealthPct() < 63 then
  pUnit:RemoveEvents();
  pUnit:SendChatMessage (11, 0, "Blood!, it shell Rage!")
  pUnit:FullCastSpell(2687)
  pUnit:RegisterEvent("Phase_550",1000, 0)
 end
end
 
function Phase_550(pUnit, Event)
 if pUnit:GetHealthPct() < 44 then
  pUnit:RemoveEvents();
  pUnit:FullCastSpell(11581)
  pUnit:RegisterEvent("Phase_660",1000, 0)
 end
end

function Phase_660(pUnit, Event)
 if pUnit:GetHealthPct() < 20 then
  pUnit:RemoveEvents();
  pUnit:SendChatMessage (11, 0, "Raor!")
  pUnit:FullCastSpell(2687)
 end
end
 
function Warrior_start(pUnit, Event)
 pUnit:RegisterEvent("Phase_110",1000, 0)
 pUnit:SendChatMessage (11, 0, "$N, you will not live to see the light of day!")
end
RegisterUnitEvent(80001, 1, "Warrior_start")