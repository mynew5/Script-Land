--[[ PHAS E ONE]] --
function Rokkor_Phase1(Unit, event)
if Unit:GetHealthPct() < 72 then
Unit:RemoveEvents()
Unit:SendChatMessage(12, 0, "Spürt die Macht der Natur!")
Unit:CastSpell(20594)
Unit:RegisterEvent("Rokkor_Strike",6000, 0)
Unit:RegisterEvent("Rokkor_Phase2",1000, 0)
end
end

function Rokkor_Strike(Unit)
Unit:CastSpell(3130)
end

--[[ PHASE TWO]]--
function Rokkor_Phase2(Unit, event)
if Unit:GetHealthPct() < 62 then
Unit:RemoveEvents()
Unit:SendChatMessage(12, 0, "Nehmt das!")
Unit:CastSpell(31715)
Unit:RegisterEvent("Rokkor_charge",8000, 0)
Unit:RegisterEvent("Rokkor_Phase3",1000, 0)
end
end

function Rokkor_charge(Unit)
Unit:CastSpell(31715)
end

--[[ PHASE THREE ]]--
function Rokkor_Phase3(Unit, event)
if Unit:GetHealthPct() < 52 then
Unit:RemoveEvents()
Unit:SendChatMessage(12, 0, "Die Natur gibt mir ungeheure Kräfte!")
Unit:CastSpell(36981)
Unit:RegisterEvent("Venomclaw_spin",10000, 0)
Unit:RegisterEvent("Venomclaw_Phase4",1000, 0)
end
end

function Venomclaw_spin(Unit)
Unit:CastSpell(36981)
end

--[[ PHASE FOUR ]]--
function Rokkor_Phase4(Unit, event)
if Unit:GetHealthPct() <= 26 then
Unit:RemoveEvents()
Unit:SetCombatCapable(1)
Unit:SetScale(4)
Unit:CastSpell(18501)
Unit:SendChatMessage(12, 0, "Rokkor wird euch zermalmen")
Unit:RegisterEvent("Rokkor_shoop",7000, 0)
end
end

function Rokkor_shoop(Unit, event)
Unit:RemoveEvents()
Unit:SetScale(3)
Unit:CastSpell(37433)
Unit:SetCombatCapable(0)
Unit:SendChatMessage(12, 0, "Die Kraft des Wassers ist bei mir!")
end

function Rokkor_OnCombat(Unit, event)
Unit:SendChatMessage(12, 0, "Verschwindet, Gesindel!")
Unit:RegisterEvent("Rokkor_Phase1",1000, 0)
Unit:RegisterEvent("Rokkor_Strike",6000, 0)
end

function Rokkor_OnLeaveCombat(Unit)
Unit:SendChatMessage(12, 0, "Die Kräfte der Natur sind unnermäßlich!")
Unit:RemoveEvents()
end

function Rokkor_OnKilledTarget(Unit)
Unit:SendChatMessage(11, 0, "Ihr könnt mich nicht besiegen!")
Unit:CastSpell(36981)
end

function Rokkor_OnDeath(Unit)
Unit:SendChatMessage(12, 0, "Meine.. Macht.. ist...")
Unit:RemoveEvents()
end

RegisterUnitEvent(5900001, 1, "Rokkor_OnCombat")
RegisterUnitEvent(5900001, 2, "Rokkor_OnLeaveCombat")
RegisterUnitEvent(5900001, 3, "Rokkor_OnKilledTarget")
RegisterUnitEvent(5900001, 4, "Rokkor_Death")