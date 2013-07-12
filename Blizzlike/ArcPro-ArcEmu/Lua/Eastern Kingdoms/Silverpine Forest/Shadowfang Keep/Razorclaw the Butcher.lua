--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function KokkenTor_OnCombat (Unit, Event)
    Unit:RegisterEvent("KokkenTor_Fallout", 1000, 1)
    Unit:RegisterEvent("KokkenTor_Doomthrust", 24000, 0) 
    Unit:RegisterEvent("KokkenTor_Armorslice", 20000, 0) 
    Unit:RegisterEvent("KokkenTor_Phase2", 1000, 0)
end

function KokkenTor_Fallout (Unit, Event)
    Unit:FullCastSpellOnTarget(31472, Unit:GetClosestPlayer())
end

function KokkenTor_Doomthrust (Unit, Event)
    Unit:FullCastSpellOnTarget(30744, Unit:GetMainTank())
end

function KokkenTor_Armorslice (Unit, Event)
    Unit:FullCastSpellOnTarget(15656, Unit:GetMainTank())
end

function KokkenTor_Phase2 (Unit, Event)
    if(Unit:GetHealthPct() < 72) then
        Unit:RemoveEvents()
        Unit:RegisterEvent("KokkenTor_Demoncall", 10000, 0)
        Unit:RegisterEvent("KokkenTor_Lethal", 15000, 0)
        Unit:RegisterEvent("KokkenTor_Valiant", 17000, 0)
        Unit:RegisterEvent("KokkenTor_Phase3", 1000, 0)
	end
end

function KokkenTor_Demoncall (Unit, Event)
    Unit:FullCastSpellOnTarget(28383, Unit:GetMainTank())
end

function KokkenTor_Lethal (Unit, Event)
    Unit:FullCastSpellOnTarget(28308, Unit:GetMainTank())
end

function KokkenTor_Valiant (Unit, Event)
    Unit:CastSpell(46287)
end

function KokkenTor_Phase3 (Unit, Event)
    if(Unit:GetHealthPct() < 49) then
        Unit:RemoveEvents()        
        Unit:RegisterEvent("KokkenTor_Demoralize", 20000, 0)
        Unit:RegisterEvent("KokkenTor_Impale", 50000, 0) 
        Unit:RegisterEvent("KokkenTor_Terror", 35000, 0)
        Unit:RegisterEvent("KokkenTor_Phase4", 1000, 0)
	end
end

function KokkenTor_Demoralize (Unit, Event)
    Unit:CastSpell(27780)
end

function KokkenTor_Impale (Unit, Event)
    Unit:CastSpell(19781)
end

function KokkenTor_Terror (Unit, Event)
    Unit:FullCastSpellOnTarget(36950, Unit:GetRandomPlayer(0))
end

function KokkenTor_Phase4 (Unit, Event)
    if(Unit:GetHealthPct() < 20) then
        Unit:RemoveEvents()
        Unit:CastSpell(39046)
    end
end

function KokkenTor_OnLeaveCombat (Unit, Event)
    Unit:RemoveEvents()
end

function KokkenTor_OnDie (Unit, Event)
    Unit:RemoveEvents()   
end

RegisterUnitEvent(3886, 1, "KokkenTor_OnCombat")
RegisterUnitEvent(3886, 2, "KokkenTor_OnLeaveCombat")
RegisterUnitEvent(3886, 4, "KokkenTor_OnDie")