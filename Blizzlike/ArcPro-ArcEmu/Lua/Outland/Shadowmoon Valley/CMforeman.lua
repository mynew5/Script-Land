--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CMForeman_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("CMForeman_Enrage", 5000, 0)
end

function CMForeman_Enrage(Unit,Event)
	Unit:CastSpell(40743)
end

function CMForeman_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function CMForeman_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(23305, 1, "CMForeman_OnEnterCombat")
RegisterUnitEvent(23305, 2, "CMForeman_OnLeaveCombat")
RegisterUnitEvent(23305, 4, "CMForeman_OnDied")