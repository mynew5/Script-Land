--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function InfiniteChronoMagus_OnCombat(Unit, Event)
	Unit:RegisterEvent("InfiniteChronoMagus_ShadowBlast", 9000, 0)
	Unit:RegisterEvent("InfiniteChronoMagus_ShadowBolt", 6000, 0)
end

function InfiniteChronoMagus_ShadowBlast(Unit, Event) 
	Unit:FullCastSpellOnTarget(38085, Unit:GetMainTank()) 
end

function InfiniteChronoMagus_ShadowBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9613, Unit:GetMainTank()) 
end

function InfiniteChronoMagus_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function InfiniteChronoMagus_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27898, 1, "InfiniteChronoMagus_OnCombat")
RegisterUnitEvent(27898, 2, "InfiniteChronoMagus_OnLeaveCombat")
RegisterUnitEvent(27898, 4, "InfiniteChronoMagus_OnDied")