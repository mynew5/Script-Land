--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function FordragonMarksman_OnCombat(Unit, Event)
	Unit:RegisterEvent("FordragonMarksman_Shoot", 5000, 0)
	Unit:RegisterEvent("FordragonMarksman_ExplodingShot", 7000, 0)
	Unit:RegisterEvent("FordragonMarksman_RapidShot", 9000, 0)
end

function FordragonMarksman_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(32103, Unit:GetMainTank()) 
end

function FordragonMarksman_ExplodingShot(Unit, Event) 
	Unit:FullCastSpellOnTarget(7896, Unit:GetMainTank()) 
end

function FordragonMarksman_RapidShot(Unit, Event) 
	Unit:FullCastSpellOnTarget(49474, Unit:GetMainTank()) 
end

function FordragonMarksman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FordragonMarksman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27540, 1, "FordragonMarksman_OnCombat")
RegisterUnitEvent(27540, 2, "FordragonMarksman_OnLeaveCombat")
RegisterUnitEvent(27540, 4, "FordragonMarksman_OnDied")