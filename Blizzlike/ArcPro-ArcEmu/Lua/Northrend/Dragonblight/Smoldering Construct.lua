--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SmolderingConstruct_OnCombat(Unit, Event)
	Unit:RegisterEvent("SmolderingConstruct_Backlash", 6000, 0)
end

function SmolderingConstruct_Backlash(Unit, Event) 
	Unit:FullCastSpellOnTarget(51439, Unit:GetMainTank()) 
end

function SmolderingConstruct_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SmolderingConstruct_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27362, 1, "SmolderingConstruct_OnCombat")
RegisterUnitEvent(27362, 2, "SmolderingConstruct_OnLeaveCombat")
RegisterUnitEvent(27362, 4, "SmolderingConstruct_OnDied")