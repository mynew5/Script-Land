--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Enslaved_ProtoDrake_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Enslaved_ProtoDrake_Flame_Breath", math.random(9000, 12000), 0)
	pUnit:RegisterEvent("Enslaved_ProtoDrake_Knock_Away", math.random(25000, 27000), 0)
	pUnit:RegisterEvent("Enslaved_ProtoDrake_Rend", 15000, 0)
end

function Enslaved_ProtoDrake_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Enslaved_ProtoDrake_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Enslaved_ProtoDrake_Flame_Breath(pUnit, Event)
	pUnit:FullCastSpell(50653)
end

function Enslaved_ProtoDrake_Knock_Away(pUnit, Event)
	pUnit:FullCastSpellOnTarget(49722, pUnit:GetMainTank())
end

function Enslaved_ProtoDrake_Rend(pUnit, Event)
	pUnit:FullCastSpellOnTarget(43931, pUnit:GetMainTank())
end

RegisterUnitEvent(24083, 1, "Enslaved_ProtoDrake_OnCombat")
RegisterUnitEvent(24083, 2, "Enslaved_ProtoDrake_OnLeaveCombat")
RegisterUnitEvent(24083, 4, "Enslaved_ProtoDrake_OnDeath")