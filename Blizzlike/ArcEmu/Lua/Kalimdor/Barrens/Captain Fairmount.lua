--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CaptainFairmount_OnCombat(Unit, Event)
	Unit:RegisterEvent("CaptainFairmount_BattleShout", 1000, 1)
	Unit:RegisterEvent("CaptainFairmount_FrighteningShout", 12000, 0)
	Unit:RegisterEvent("CaptainFairmount_Pummel", 8000, 0)
end

function CaptainFairmount_BattleShout(Unit, Event) 
	Unit:CastSpell(9128) 
end

function CaptainFairmount_FrighteningShout(Unit, Event) 
	Unit:FullCastSpellOnTarget(19134, Unit:GetMainTank()) 
end

function CaptainFairmount_Pummel(Unit, Event) 
	Unit:FullCastSpellOnTarget(12555, Unit:GetMainTank()) 
end

function CaptainFairmount_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CaptainFairmount_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3393, 1, "CaptainFairmount_OnCombat")
RegisterUnitEvent(3393, 2, "CaptainFairmount_OnLeaveCombat")
RegisterUnitEvent(3393, 4, "CaptainFairmount_OnDied")