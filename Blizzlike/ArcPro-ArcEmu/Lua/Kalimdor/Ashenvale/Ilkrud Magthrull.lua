--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function IlkrudMagthrull_OnCombat(Unit, Event)
	Unit:RegisterEvent("IlkrudMagthrull_IlkrudsGuardians", 1000, 1)
	Unit:RegisterEvent("IlkrudMagthrull_ShadowBolt", 8000, 0)
end

function IlkrudMagthrull_IlkrudsGuardians(pUnit, Event) 
	pUnit:CastSpell(6487) 
end

function IlkrudMagthrull_ShadowBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20791, pUnit:GetMainTank()) 
end

function IlkrudMagthrull_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function IlkrudMagthrull_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3664, 1, "IlkrudMagthrull_OnCombat")
RegisterUnitEvent(3664, 2, "IlkrudMagthrull_OnLeaveCombat")
RegisterUnitEvent(3664, 4, "IlkrudMagthrull_OnDied")