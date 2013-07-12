--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function IronRuneSmith_OnCombat(Unit, Event)
	Unit:RegisterEvent("IronRuneSmith_LightningCharged", 4000, 1)
	Unit:RegisterEvent("IronRuneSmith_SmeltRune", 10000, 0)
end

function IronRuneSmith_LightningCharged(Unit, Event) 
	Unit:CastSpell(52701) 
end

function IronRuneSmith_SmeltRune(Unit, Event) 
	Unit:FullCastSpellOnTarget(52699, Unit:GetMainTank()) 
end

function IronRuneSmith_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function IronRuneSmith_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26408, 1, "IronRuneSmith_OnCombat")
RegisterUnitEvent(26408, 2, "IronRuneSmith_OnLeaveCombat")
RegisterUnitEvent(26408, 4, "IronRuneSmith_OnDied")