--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Holystone Productions; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BlisteringSteamrager_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("BlisteringSteamrager_SteamBlast", 20000, 0)
end

function BlisteringSteamrager_SteamBlast(pUnit, Event)
	pUnit:CastSpell(52531)
end

RegisterUnitEvent(28583, 1, "BlisteringSteamrager_OnCombat")