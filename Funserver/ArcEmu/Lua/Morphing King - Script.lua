-- 
-- BEGIN SCRIPT FOR King
--
function King_Stomp(Unit)
Unit:CastSpell(19129)
end

function King_volley(Unit)
Unit:CastSpell(37109)
end

function King_volley2(Unit)
Unit:CastSpell(21749)
end

function King_Swoop(Unit)
Unit:CastSpell(30035)
end

function King_Phase1(Unit, event)
if Unit:GetHealthPct() < 95 then
Unit:RemoveEvents()
Unit:SendChatMessage(12, 0, "Time to take another form!")
Unit:SetModel(21150)
Unit:SetScale(4)
Unit:CastSpell(38777)
Unit:RegisterEvent("King_Stomp",8000, 0)
Unit:RegisterEvent("King_Phase2",1000, 0)
end
end


function King_Phase2(Unit, event)
if Unit:GetHealthPct() < 80 then
Unit:RemoveEvents()
Unit:SetModel(11369)
Unit:SendChatMessage(12, 0, "Beware The Undead!")
Unit:SetScale(4)
Unit:CastSpell(38777)
Unit:RegisterEvent("King_volley2",8000, 0)
Unit:RegisterEvent("King_Phase3",1000, 0)
end
end


function King_Phase3(Unit, event)
if Unit:GetHealthPct() < 70 then
Unit:RemoveEvents()
Unit:SendChatMessage(12, 0, "Kel'Thuzad has returned!")
Unit:SetModel(15945)
Unit:SetScale(2)
Unit:CastSpell(41232)
Unit:RegisterEvent("King_Swoop",10000, 0)
Unit:RegisterEvent("King_Phase4",1000, 0)
end
end


function King_Phase4(Unit, event)
if Unit:GetHealthPct() <= 55 then
Unit:RemoveEvents()


Unit:CastSpell(41232)
Unit:SendChatMessage(12, 0, "You can't beat me!!")
Unit:RegisterEvent("King_Stomp",8000, 0)
Unit:RegisterEvent("King_Phase5",1000, 0)
end
end


function King_Phase5(Unit, event)
if Unit:GetHealthPct() <= 45 then
Unit:RemoveEvents()
Unit:SendChatMessage(12, 0, "My powers! Whats Happening?!")
Unit:SendChatMessage(12, 0, "Illidan the betrayer is taking control!")
Unit:PlaySoundToSet(11466);
Unit:SetModel(21135)
Unit:SetScale(3)

Unit:RegisterEvent("King_Phase6",7000, 0)
end
end

function King_Phase6(Unit, event)
if Unit:GetHealthPct() <= 25 then
Unit:RemoveEvents()


Unit:SetScale(3)
Unit:PlaySoundToSet(11475);
Unit:SetModel(21322)
Unit:CastSpell(41232)

Unit:RegisterEvent("King_Phase7",7000, 0)
end
end


function King_Phase7(Unit, event)
if Unit:GetHealthPct() <= 1 then
Unit:RemoveEvents()
Unit:SendChatMessage(12, 0, "NOOOOOOOOOOOOOO!!")

end
end

function King_OnCombat(Unit, event)
Unit:SendChatMessage(11, 0, "You've just challenged the morphing king!")
Unit:PlaySoundToSet(1290);
Unit:RegisterEvent("King_Phase1",1000, 0)
Unit:RegisterEvent("King_volley",9000, 0)
end




function King_OnKilledTarget(Unit)
Unit:SendChatMessage(11, 0, "Conjoin with the nature!")
Unit:CastSpell(36981)
end

function King_Death(Unit)
Unit:SendChatMessage(12, 0, "This, cannot be!")
Unit:RemoveEvents()
end

RegisterUnitEvent(300001, 1, "King_OnCombat")
RegisterUnitEvent(300001, 2, "King_OnKilledTarget")
RegisterUnitEvent(300001, 3, "King_Death")