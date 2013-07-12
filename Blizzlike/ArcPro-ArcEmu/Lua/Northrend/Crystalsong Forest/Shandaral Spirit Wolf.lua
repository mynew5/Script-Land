--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ShandaralSpiritWolf_OnCombat(Unit, Event)
	Unit:RegisterEvent("ShandaralSpiritWolf_TendonRip", 8000, 0)
end

function ShandaralSpiritWolf_TendonRip(Unit, Event) 
	Unit:FullCastSpellOnTarget(3604, Unit:GetMainTank()) 
end

function ShandaralSpiritWolf_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ShandaralSpiritWolf_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(31123, 1, "ShandaralSpiritWolf_OnCombat")
RegisterUnitEvent(31123, 2, "ShandaralSpiritWolf_OnLeaveCombat")
RegisterUnitEvent(31123, 4, "ShandaralSpiritWolf_OnDied")