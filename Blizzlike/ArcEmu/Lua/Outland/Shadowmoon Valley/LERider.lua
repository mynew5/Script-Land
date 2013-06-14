--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function LERider_OnEnterCombat(Unit,Event)
	Unit:CastSpell(39782)
	Unit:CastSpellOnTarget(31888, Unit:GetClosestPlayer())
end

RegisterUnitEvent(22966, 1, "LERider_OnEnterCombat")