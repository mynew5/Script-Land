--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function IronRuneWeaver_OnCombat(Unit, Event)
	Unit:RegisterEvent("IronRuneWeaver_RuneWeaving", 9000, 0)
end

function IronRuneWeaver_RuneWeaving(Unit, Event) 
	Unit:FullCastSpellOnTarget(52713, Unit:GetMainTank()) 
end

function IronRuneWeaver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function IronRuneWeaver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26820, 1, "IronRuneWeaver_OnCombat")
RegisterUnitEvent(26820, 2, "IronRuneWeaver_OnLeaveCombat")
RegisterUnitEvent(26820, 4, "IronRuneWeaver_OnDied")