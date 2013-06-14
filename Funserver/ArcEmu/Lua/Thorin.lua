-- 
-- BEGIN SCRIPT FOR Thorin
--
function Thorin_Stomp(Unit)
Unit:CastSpell(19129)
end

function Thorin_volley(Unit)
Unit:CastSpell(37109)
end

function Thorin_volley2(Unit)
Unit:CastSpell(21749)
end

function Thorin_Swoop(Unit)
Unit:CastSpell(30035)
end

function Thorin_Phase1(Unit, event)
if Unit:GetHealthPct() < 80 then
Unit:RemoveEvents()
Unit:SendChatMessage(12, 0, "Das hat schon lange genug gedauert!")
Unit:SetModel(762)
Unit:SetScale(4)
Unit:CastSpell(41232)
Unit:RegisterEvent("Thorin_Stomp",8000, 0)
Unit:RegisterEvent("Thorin_Phase2",1000, 0)
end
end

function Thorin_Phase2(Unit, event)
if Unit:GetHealthPct() < 70 then
Unit:RemoveEvents()
Unit:SetModel(11362)
Unit:SetScale(4)
Unit:CastSpell(41232)
Unit:RegisterEvent("Thorin_volley2",8000, 0)
Unit:RegisterEvent("Thorin_Phase3",1000, 0)
end
end

function Thorin_Phase3(Unit, event)
if Unit:GetHealthPct() < 60 then
Unit:RemoveEvents()
Unit:SendChatMessage(12, 0, "Ihr seid eine Pest!")
Unit:SetModel(17094)
Unit:SetScale(4)
Unit:CastSpell(41232)
Unit:RegisterEvent("Thorin_Swoop",10000, 0)
Unit:RegisterEvent("Thorin_Phase4",1000, 0)
end
end

function Thorin_Phase4(Unit, event)
if Unit:GetHealthPct() <= 50 then
Unit:RemoveEvents()
Unit:SetScale(4)
Unit:SetModel(11362)
Unit:CastSpell(41232)
Unit:SendChatMessage(12, 0, "Ihr werdet früh sterben!")
Unit:RegisterEvent("Thorin_Stomp",8000, 0)
Unit:RegisterEvent("Thorin_Phase5",1000, 0)
end
end

function Thorin_Phase5(Unit, event)
if Unit:GetHealthPct() <= 40 then
Unit:RemoveEvents()
Unit:SendChatMessage(12, 0, "Meine Kräfte! Ich kann sie nicht mehr Kontrollieren")
Unit:SetScale(3)
Unit:CastSpell(40095)
Unit:RegisterEvent("Thorin_Phase6",7000, 0)
end
end

function Thorin_OnCombat(Unit, event)
Unit:SendChatMessage(11, 0, "Ihr habt es zu mir geschafft?")
Unit:RegisterEvent("Thorin_Phase1",1000, 0)
Unit:RegisterEvent("Thorin_volley",9000, 0)
end

function Torkin_OnLeaveCombat(Unit)
Unit:SendChatMessage(12, 0, "Schwächliche Menschen! Verschwindet und kommt nicht mehr wieder!")
Unit:RemoveEvents()
end

function Torkin_OnKilledTarget(Unit)
Unit:SendChatMessage(11, 0, "Noch einer mehr für die Lava")
Unit:CastSpell(36981)
end

function Torkin_Death(Unit)
Unit:SendChatMessage(12, 0, "Ihr habt mich... besiegt..")
Unit:RemoveEvents()
end

RegisterUnitEvent(5900012, 1, "Thorin_OnCombat")
RegisterUnitEvent(5900012, 2, "Thorin_OnLeaveCombat")
RegisterUnitEvent(5900012, 3, "Thorin_OnKilledTarget")
RegisterUnitEvent(5900012, 4, "Thorin_Death")