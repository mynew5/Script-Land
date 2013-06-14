--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ISatyr_OnEnterCombat(Unit,Event)
	if(Unit:GetHealthPct() == 97) then
		Unit:FullCastSpellOnTarget(38048, Unit:GetClosestPlayer())
	end
end

RegisterUnitEvent(21656, 1, "ISatyr_OnEnterCombat")