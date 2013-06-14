--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Spitting_Cobra_OnCombat(Unit, Event)
	Unit:RegisterEvent("Spitting_Cobra_Cobra_Strike", math.random(25000,28000), 0)
	Unit:RegisterEvent("Spitting_Cobra_Venom_Spit", math.random(14000,18000), 0)
end

function Spitting_Cobra_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Spitting_Cobra_OnDeath(Unit, Event)
	Unit:RemoveEvents()
end

function Spitting_Cobra_Cobra_Strike(Unit, Event)
	Unit:FullCastSpellOnTarget(55703, Unit:GetMainTank())
end

function Spitting_Cobra_Venom_Spit(Unit, Event)
	Unit:FullCastSpellOnTarget(55700, Unit:GetRandomPlayer(0))
end

RegisterUnitEvent(29774, 1, "Spitting_Cobra_OnCombat")
RegisterUnitEvent(29774, 2, "Spitting_Cobra_OnLeaveCombat")
RegisterUnitEvent(29774, 4, "Spitting_Cobra_OnDeath")