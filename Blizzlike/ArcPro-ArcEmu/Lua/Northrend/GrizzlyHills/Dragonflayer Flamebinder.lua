--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DragonflayerFlamebinder_OnCombat(Unit, Event)
	Unit:RegisterEvent("DragonflayerFlamebinder_FlamePatch", 10000, 0)
	Unit:RegisterEvent("DragonflayerFlamebinder_InciteFlames", 7000, 0)
end

function DragonflayerFlamebinder_FlamePatch(Unit, Event) 
	Unit:CastSpell(52208) 
end

function DragonflayerFlamebinder_InciteFlames(Unit, Event) 
	Unit:FullCastSpellOnTarget(52209, Unit:GetMainTank()) 
end

function DragonflayerFlamebinder_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DragonflayerFlamebinder_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27259, 1, "DragonflayerFlamebinder_OnCombat")
RegisterUnitEvent(27259, 2, "DragonflayerFlamebinder_OnLeaveCombat")
RegisterUnitEvent(27259, 4, "DragonflayerFlamebinder_OnDied")