--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SanctumDefender_OnEnterCombat(Unit,Event)
	Unit:FullCastSpellOnTarget(41440, Unit:GetClosestPlayer())
end

RegisterUnitEvent(23435, 1, "SanctumDefender_OnEnterCombat")