--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Sironas_OnCombat(Unit, Event)
	Unit:RegisterEvent("Sironas_CurseofBlood", 2000, 1)
	Unit:RegisterEvent("Sironas_CurseofTongues", 10000, 0)
	Unit:RegisterEvent("Sironas_Immolate", 6000, 1)
	Unit:RegisterEvent("Sironas_ShadowCleave", 9000, 0)
	Unit:RegisterEvent("Sironas_Uppercut", 7500, 0)
end

function Sironas_CurseofBlood(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(8282, pUnit:GetMainTank()) 
end

function Sironas_CurseofTongues(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(13338, pUnit:GetMainTank()) 
end

function Sironas_Immolate(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12742, pUnit:GetMainTank()) 
end

function Sironas_ShadowCleave(pUnit, Event) 
	pUnit:CastSpell(31629) 
end

function Sironas_Uppercut(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(10966, pUnit:GetMainTank()) 
end

function Sironas_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Sironas_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17678, 1, "Sironas_OnCombat")
RegisterUnitEvent(17678, 2, "Sironas_OnLeaveCombat")
RegisterUnitEvent(17678, 4, "Sironas_OnDied")