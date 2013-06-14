--[[ PHASE ONE]] --
function Raufklotz_Phase1(Unit, event)
    if Unit:GetHealthPct() < 72 then
        Unit:RemoveEvents()
        Unit:SendChatMessage(12, 0, "Nehmt diesen frisch geschmiedeten Blitz Hammer!")
        Unit:CastSpell(36841)
        Unit:RegisterEvent("Raufklotz_lightning",4000, 0)
        Unit:RegisterEvent("Raufklotz_Phase2",1000, 0)
    end
end

--[[ PHASE TWO]]--
function Raufklotz_Phase2(Unit, event)
    if Unit:GetHealthPct() < 42 then
        Unit:RemoveEvents()
        Unit:SendChatMessage(12, 0, "Lauft weg ihr schwachen Menschen!")
        Unit:CastSpell(41276)
        Unit:RegisterEvent("Raufklotz_Meteor",8000, 0)
        Unit:RegisterEvent("Raufklotz_Phase3",1000, 0)
    end
end

--[[ PHASE THREE ]]--
function Raufklotz_Phase3(Unit, event)
    if Unit:GetHealthPct() <= 26 then
        Unit:RemoveEvents()
        Unit:SetScale(3)
        Unit:CastSpell(31984)
        Unit:SendChatMessage(12, 0, "Ihr könnt mich nicht besiegen!")
        Unit:RegisterEvent("Raufklotz_Beam",7000, 0)
    end
end

function Dorikazor_Deathfinger(Unit, event)
    Unit:RemoveEvents()
    Unit:SetScale(5)
    Unit:CastSpell(31984)
    Unit:SendChatMessage(12, 0, "Fürchtet meine neuste Waffe!")
end

function Raufklotz_OnCombat(Unit, event)
    Unit:SendChatMessage(11, 0, "Neue Besucher hm? Los tötet sie!")
    Unit:RegisterEvent("Raufklotz_Phase1",1000, 0)
    Unit:RegisterEvent("Raufklotz_lightning",6000, 0)
end

function Raufklotz_OnLeaveCombat(Unit)
    Unit:SendChatMessage(12, 0, "Haha, ich wusste ihr seid zu schwach")
    Unit:RemoveEvents()
end

function Raufklotz_OnKilledTarget(Unit)
    Unit:SendChatMessage(11, 0, "Wer kommt danach?")
    Unit:CastSpell(5)
end

function Raufklotz_Death(Unit)
    Unit:SendChatMessage(12, 0, "Das kann nicht wahr sein...")
    Unit:RemoveEvents()
end

RegisterUnitEvent(5900008, 1, "Raufklotz_OnCombat")
RegisterUnitEvent(5900008, 2, "Raufklotz_OnLeaveCombat")
RegisterUnitEvent(5900008, 3, "Raufklotz_OnKilledTarget")
RegisterUnitEvent(5900008, 4, "Raufklotz_Death")