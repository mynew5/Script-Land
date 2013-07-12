--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GrumbaldOneEye_OnCombat(Unit, Event)
	Unit:RegisterEvent("GrumbaldOneEye_ElementalEnlightenment", 3000, 1)
	Unit:RegisterEvent("GrumbaldOneEye_FireBlast", 6000, 0)
	Unit:RegisterEvent("GrumbaldOneEye_FrostNova", 9000, 0)
	Unit:RegisterEvent("GrumbaldOneEye_FrostfireBolt", 9500, 0)
end

function GrumbaldOneEye_ElementalEnlightenment(Unit, Event) 
	Unit:CastSpell(52495) 
end

function GrumbaldOneEye_FireBlast(Unit, Event) 
	Unit:FullCastSpellOnTarget(13339, Unit:GetMainTank()) 
end

function GrumbaldOneEye_FrostNova(Unit, Event) 
	Unit:CastSpell(11831) 
end

function GrumbaldOneEye_FrostfireBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(51779, Unit:GetMainTank()) 
end

function GrumbaldOneEye_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GrumbaldOneEye_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26681, 1, "GrumbaldOneEye_OnCombat")
RegisterUnitEvent(26681, 2, "GrumbaldOneEye_OnLeaveCombat")
RegisterUnitEvent(26681, 4, "GrumbaldOneEye_OnDied")