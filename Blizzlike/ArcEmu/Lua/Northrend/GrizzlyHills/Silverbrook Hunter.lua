--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SilverbrookHunter_OnCombat(Unit, Event)
	Unit:RegisterEvent("SilverbrookHunter_ImprovedWingClip", 14000, 0)
	Unit:RegisterEvent("SilverbrookHunter_Shoot", 6000, 0)
end

function SilverbrookHunter_ImprovedWingClip(Unit, Event) 
	Unit:FullCastSpellOnTarget(47168, Unit:GetMainTank()) 
end

function SilverbrookHunter_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function SilverbrookHunter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SilverbrookHunter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27546, 1, "SilverbrookHunter_OnCombat")
RegisterUnitEvent(27546, 2, "SilverbrookHunter_OnLeaveCombat")
RegisterUnitEvent(27546, 4, "SilverbrookHunter_OnDied")