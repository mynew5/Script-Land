--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Rocknar_OnCombat(Unit, Event)
	Unit:RegisterEvent("Rocknar_HardenSkin", 2000, 1)
	Unit:RegisterEvent("Rocknar_IceSpike", 8000, 0)
end

function Rocknar_HardenSkin(Unit, Event) 
	Unit:CastSpell(22693) 
end

function Rocknar_IceSpike(Unit, Event) 
	Unit:FullCastSpellOnTarget(50094, Unit:GetMainTank()) 
end

function Rocknar_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Rocknar_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25514, 1, "Rocknar_OnCombat")
RegisterUnitEvent(25514, 2, "Rocknar_OnLeaveCombat")
RegisterUnitEvent(25514, 4, "Rocknar_OnDied")