--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Tinhead_Rust(Unit, event, miscUnit, misc)
	if((Unit:GetHealthPct() < 50) and (Didthat == 0)) then
	    Unit:FullCastSpellOnTarget(31086, Unit:GetClosestPlayer())
	    Didthat = 1 
	end
end

function Tinhead_OnDied(Unit, event, miscUnit, misc)
	Unit:SendChatMessage(12, 0, "Back to being an old rust bucket.")
	Unit:RemoveEvents()
end

function Tinhead_Cleave(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(39174, Unit:GetClosestPlayer())
end

function Tinhead_OnCombat(Unit, event, miscUnit, misc)
	Unit:SendChatMessage(12, 0, "I could really use a heart. Say, can I have yours?")
	Unit:RegisterEvent("Tinhead_Rust", 5000, 0)
	Unit:RegisterEvent("Tinhead_Cleave", 10000, 0)
end

function Tinhead_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Tinhead_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(17547, 1, "Tinhead_OnCombat")
RegisterUnitEvent(17547, 2, "Tinhead_OnLeaveCombat")
RegisterUnitEvent(17547, 4, "Tinhead_OnDeath")