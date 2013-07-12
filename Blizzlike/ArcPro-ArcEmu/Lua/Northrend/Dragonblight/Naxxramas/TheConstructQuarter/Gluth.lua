--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Gluth_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Rawr!")
	pUnit:RegisterEvent("Gluth_MortalWound", 30000, 0)
	pUnit:RegisterEvent("Gluth_Decimate", 105000, 0)
	pUnit:RegisterEvent("Gluth_TerrifyingRoar", 20000, 0)
end
	
function Gluth_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Gluth_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end
	
function Gluth_MortalWound(pUnit, Event)
	pUnit:FullCastSpellOnTarget(28467, pUnit:GetMainTank())
end
	
function Gluth_Decimate(pUnit, Event)
	pUnit:FullCastSpellOnTarget(28374, pUnit:GetMainTank())
end
	
function Gluth_TerrifyingRoar(pUnit, Event)
	pUnit:CastSpell(29685)
end

RegisterUnitEvent(15932, 1, "Gluth_OnCombat")
RegisterUnitEvent(15932, 2, "Gluth_OnLeaveCombat")
RegisterUnitEvent(15932, 4, "Gluth_OnDeath")