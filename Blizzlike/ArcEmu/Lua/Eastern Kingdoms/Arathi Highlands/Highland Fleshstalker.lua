--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Ascendscripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HighlandFleshstalker_OnEnterCombat(Unit,Event)
local plr =	Unit:GetMainTank()
	if(Unit:GetHealthPct() <= 29) then
		Unit:FullCastSpellOnTarget(3393, plr)
	end
end

RegisterUnitEvent(2561, 1, "HighlandFleshstalker_OnEnterCombat")