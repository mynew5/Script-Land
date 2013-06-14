--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Drakkari_Earthshaker_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Drakkari_Earthshaker_Head_Crack", math.random(27000,29000), 0)
	pUnit:RegisterEvent("Drakkari_Earthshaker_Powerful_Blow", math.random(17000,18000), 0)
	pUnit:RegisterEvent("Drakkari_Earthshaker_Slam_Ground", 33000, 0)
end

function Drakkari_Earthshaker_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Drakkari_Earthshaker_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Drakkari_Earthshaker_Head_Crack(pUnit, Event)
	pUnit:FullCastSpellOnTarget(16172, pUnit:GetMainTank())
end

function Drakkari_Earthshaker_Powerful_Blow(pUnit, Event)
	pUnit:FullCastSpellOnTarget(55567, pUnit:GetMainTank())
end

function Drakkari_Earthshaker_Slam_Ground(pUnit, Event)
	pUnit:FullCastSpell(55563)
end

RegisterUnitEvent(29829, 1, "Drakkari_Earthshaker_OnCombat")
RegisterUnitEvent(29829, 2, "Drakkari_Earthshaker_OnLeaveCombat")
RegisterUnitEvent(29829, 4, "Drakkari_Earthshaker_OnDeath")