--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GammothratheTormentor_OnCombat(Unit, Event)
	Unit:RegisterEvent("GammothratheTormentor_MagnataurCharge", 10000, 0)
	Unit:RegisterEvent("GammothratheTormentor_TuskStrike", 8000, 0)
end

function GammothratheTormentor_MagnataurCharge(Unit, Event) 
	Unit:CastSpell(50413) 
end

function GammothratheTormentor_TuskStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(50410, Unit:GetMainTank()) 
end

function GammothratheTormentor_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GammothratheTormentor_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25789, 1, "GammothratheTormentor_OnCombat")
RegisterUnitEvent(25789, 2, "GammothratheTormentor_OnLeaveCombat")
RegisterUnitEvent(25789, 4, "GammothratheTormentor_OnDied")