--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function RisenWintergardeMage_OnCombat(Unit, Event)
	Unit:RegisterEvent("RisenWintergardeMage_FireBlast", 6000, 0)
	Unit:RegisterEvent("RisenWintergardeMage_Frostbolt", 7000, 0)
end

function RisenWintergardeMage_FireBlast(Unit, Event) 
	Unit:FullCastSpellOnTarget(13339, Unit:GetMainTank()) 
end

function RisenWintergardeMage_Frostbolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9672, Unit:GetMainTank()) 
end

function RisenWintergardeMage_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RisenWintergardeMage_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27283, 1, "RisenWintergardeMage_OnCombat")
RegisterUnitEvent(27283, 2, "RisenWintergardeMage_OnLeaveCombat")
RegisterUnitEvent(27283, 4, "RisenWintergardeMage_OnDied")