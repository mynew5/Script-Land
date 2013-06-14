--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DragonblightMageHunter_OnCombat(Unit, Event)
	Unit:RegisterEvent("DragonblightMageHunter_ArcaneReflection", 9000, 1)
	Unit:RegisterEvent("DragonblightMageHunter_FireReflection", 8000, 1)
	Unit:RegisterEvent("DragonblightMageHunter_FrostReflection", 7000, 1)
	Unit:RegisterEvent("DragonblightMageHunter_ShadowReflection", 6000, 1)
end

function DragonblightMageHunter_ArcaneReflection(Unit, Event) 
	Unit:CastSpell(51766) 
end

function DragonblightMageHunter_FireReflection(Unit, Event) 
	Unit:CastSpell(51758) 
end

function DragonblightMageHunter_FrostReflection(Unit, Event) 
	Unit:CastSpell(51763) 
end

function DragonblightMageHunter_ShadowReflection(Unit, Event) 
	Unit:CastSpell(51764) 
end

function DragonblightMageHunter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DragonblightMageHunter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26280, 1, "DragonblightMageHunter_OnCombat")
RegisterUnitEvent(26280, 2, "DragonblightMageHunter_OnLeaveCombat")
RegisterUnitEvent(26280, 4, "DragonblightMageHunter_OnDied")