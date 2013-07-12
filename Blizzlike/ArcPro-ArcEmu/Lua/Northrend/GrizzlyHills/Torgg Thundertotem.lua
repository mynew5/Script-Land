--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TorggThundertotem_OnCombat(Unit, Event)
	Unit:RegisterEvent("TorggThundertotem_ChainLightning", 9000, 0)
	Unit:RegisterEvent("TorggThundertotem_CorruptedNovaTotem", 2000, 1)
	Unit:RegisterEvent("TorggThundertotem_EarthShock", 6000, 0)
	Unit:RegisterEvent("TorggThundertotem_HealingWave", 13000, 0)
end

function TorggThundertotem_ChainLightning(Unit, Event) 
	Unit:FullCastSpellOnTarget(16033, Unit:GetMainTank()) 
end

function TorggThundertotem_CorruptedNovaTotem(Unit, Event) 
	Unit:CastSpell(31991) 
end

function TorggThundertotem_EarthShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(15501, Unit:GetMainTank()) 
end

function TorggThundertotem_HealingWave(Unit, Event) 
	Unit:CastSpell(15982) 
end

function TorggThundertotem_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TorggThundertotem_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27716, 1, "TorggThundertotem_OnCombat")
RegisterUnitEvent(27716, 2, "TorggThundertotem_OnLeaveCombat")
RegisterUnitEvent(27716, 4, "TorggThundertotem_OnDied")