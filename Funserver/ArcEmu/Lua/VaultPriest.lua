function Phase_111(pUnit, Event)
 if pUnit:GetHealthPct() < 70 then
  pUnit:RemoveEvents();
  pUnit:FullCastSpell(34119)
  pUnit:RegisterEvent("Phase_222",1000, 0)
 end
end
 
function Phase_222(pUnit, Event)
 if pUnit:GetHealthPct() < 50 then
  pUnit:RemoveEvents();
  pUnit:SendChatMessage (11, 0, "My heals are stronger than your blows!")
  pUnit:FullCastSpell(34119)
  pUnit:RegisterEvent("Phase_333",1000, 0)
 end
end
 
function Phase_333(pUnit, Event)
 if pUnit:GetHealthPct() < 30 then
  pUnit:RemoveEvents();
  pUnit:FullCastSpell(34119)
  pUnit:RegisterEvent("Phase_444",1000, 0)
 end
end

function Phase_444(pUnit, Event)
 if pUnit:GetHealthPct() < 10 then
  pUnit:RemoveEvents();
  pUnit:SendChatMessage (11, 0, "You will Never Get to the Vault!")
  pUnit:FullCastSpell(34119)
 end
end
 
function Priest_start(pUnit, Event)
 pUnit:RegisterEvent("Phase_111",1000, 0)
 pUnit:SendChatMessage (11, 0, "We will never let you have the Vault!")
end
RegisterUnitEvent(80000, 1, "Priest_start")