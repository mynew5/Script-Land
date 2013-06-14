--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CampWinterhoofBrave_OnCombat(Unit, Event)
	Unit:RegisterEvent("CampWinterhoofBrave_Cleave", 9000, 0)
	Unit:RegisterEvent("CampWinterhoofBrave_Shoot", 6000, 0)
end

function CampWinterhoofBrave_Cleave(Unit, Event) 
	Unit:CastSpell(40505) 
end

function CampWinterhoofBrave_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(23337, Unit:GetMainTank()) 
end

function CampWinterhoofBrave_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CampWinterhoofBrave_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24031, 1, "CampWinterhoofBrave_OnCombat")
RegisterUnitEvent(24031, 2, "CampWinterhoofBrave_OnLeaveCombat")
RegisterUnitEvent(24031, 4, "CampWinterhoofBrave_OnDied")