--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function NazzivusFelsworn_OnCombat(Unit, Event)
	Unit:RegisterEvent("NazzivusFelsworn_Immolate", 6000, 1)
	Unit:RegisterEvent("NazzivusFelsworn_ShadowBolt", 8000, 0)
end

function NazzivusFelsworn_Immolate(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11962, 	pUnit:GetMainTank()) 
end

function NazzivusFelsworn_ShadowBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9613, 	pUnit:GetMainTank()) 
end

function NazzivusFelsworn_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function NazzivusFelsworn_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17339, 1, "NazzivusFelsworn_OnCombat")
RegisterUnitEvent(17339, 2, "NazzivusFelsworn_OnLeaveCombat")
RegisterUnitEvent(17339, 4, "NazzivusFelsworn_OnDied")