--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Zevrax_OnCombat(Unit, Event)
	Unit:RegisterEvent("Zevrax_Corruption", 2000, 1)
	Unit:RegisterEvent("Zevrax_CurseofWeakness", 3000, 1)
	Unit:RegisterEvent("Zevrax_ShadowBolt", 8000, 0)
	Unit:RegisterEvent("Zevrax_Immolate", 6000, 1)
end

function Zevrax_Corruption(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(21068, 	pUnit:GetMainTank()) 
end

function Zevrax_CurseofWeakness(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(17227, 	pUnit:GetMainTank()) 
end

function Zevrax_Immolate(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11962, 	pUnit:GetMainTank()) 
end

function Zevrax_ShadowBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20791, 	pUnit:GetMainTank()) 
end

function Zevrax_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Zevrax_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17494, 1, "Zevrax_OnCombat")
RegisterUnitEvent(17494, 2, "Zevrax_OnLeaveCombat")
RegisterUnitEvent(17494, 4, "Zevrax_OnDied")