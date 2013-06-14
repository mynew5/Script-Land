--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SnowfallGladeShaman_OnCombat(Unit, Event)
	Unit:RegisterEvent("SnowfallGladeShaman_FrostShock", 6000, 0)
	Unit:RegisterEvent("SnowfallGladeShaman_HealingWave", 10000, 0)
	Unit:RegisterEvent("SnowfallGladeShaman_LightningShield", 5000, 0)
end

function SnowfallGladeShaman_FrostShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(12548, Unit:GetMainTank()) 
end

function SnowfallGladeShaman_HealingWave(Unit, Event) 
	Unit:CastSpell(11986) 
end

function SnowfallGladeShaman_LightningShield(Unit, Event) 
	Unit:CastSpell(12550) 
end

function SnowfallGladeShaman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SnowfallGladeShaman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26201, 1, "SnowfallGladeShaman_OnCombat")
RegisterUnitEvent(26201, 2, "SnowfallGladeShaman_OnLeaveCombat")
RegisterUnitEvent(26201, 4, "SnowfallGladeShaman_OnDied")