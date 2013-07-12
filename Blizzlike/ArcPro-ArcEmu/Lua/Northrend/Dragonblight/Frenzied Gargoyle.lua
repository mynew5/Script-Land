--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function FrenziedGargoyle_OnCombat(Unit, Event)
	Unit:RegisterEvent("FrenziedGargoyle_GargoyleStrike", 6500, 0)
end

function FrenziedGargoyle_GargoyleStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(31664, Unit:GetMainTank()) 
end

function FrenziedGargoyle_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FrenziedGargoyle_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27691, 1, "FrenziedGargoyle_OnCombat")
RegisterUnitEvent(27691, 2, "FrenziedGargoyle_OnLeaveCombat")
RegisterUnitEvent(27691, 4, "FrenziedGargoyle_OnDied")