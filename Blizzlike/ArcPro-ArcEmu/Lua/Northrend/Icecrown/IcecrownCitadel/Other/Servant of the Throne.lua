--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local ServantoftheThrone = 36724

function ServantoftheThrone_OnCombat(pUnit, event)
	pUnit:RegisterEvent("Glacial_Blast", 10000, 0)
end

function Glacial_Blast(pUnit, event)
	pUnit:FullCastSpell(71029)
end


function ServantoftheThrone_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(ServantoftheThrone, 1, "ServantoftheThrone_OnCombat")
RegisterUnitEvent(ServantoftheThrone, 2, "ServantoftheThrone_OnLeaveCombat")