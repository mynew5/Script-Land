--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function MagisterKeldonus_OnCombat(Unit, Event)
	Unit:RegisterEvent("MagisterKeldonus_ArcaneBlast", 10000, 0)
	Unit:RegisterEvent("MagisterKeldonus_FuryoftheBlue", 15000, 0)
	Unit:RegisterEvent("MagisterKeldonus_MightofMalygos", 6000, 1)
	Unit:RegisterEvent("MagisterKeldonus_PowerFlux", 13000, 0)
	Unit:RegisterEvent("MagisterKeldonus_PowerSiphon", 18000, 0)
end

function MagisterKeldonus_ArcaneBlast(Unit, Event) 
	Unit:FullCastSpellOnTarget(51830, Unit:GetMainTank()) 
end

function MagisterKeldonus_FuryoftheBlue(Unit, Event) 
	Unit:FullCastSpellOnTarget(51808, Unit:GetMainTank()) 
end

function MagisterKeldonus_MightofMalygos(Unit, Event) 
	Unit:FullCastSpellOnTarget(51800, Unit:GetMainTank()) 
end

function MagisterKeldonus_PowerFlux(Unit, Event) 
	Unit:CastSpell(51806) 
end

function MagisterKeldonus_PowerSiphon(Unit, Event) 
	Unit:FullCastSpellOnTarget(51804, Unit:GetMainTank()) 
end

function MagisterKeldonus_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MagisterKeldonus_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26828, 1, "MagisterKeldonus_OnCombat")
RegisterUnitEvent(26828, 2, "MagisterKeldonus_OnLeaveCombat")
RegisterUnitEvent(26828, 4, "MagisterKeldonus_OnDied")