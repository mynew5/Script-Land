--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: AscendScripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CuratorInsivius_OnCombat(Unit, Event)
	Unit:RegisterEvent("CuratorInsivius_Charge", 1000, 1)
	Unit:RegisterEvent("CuratorInsivius_FrostNova", 10000, 0)
	Unit:RegisterEvent("CuratorInsivius_MortalStrike", 8000, 0)
end

function CuratorInsivius_Charge(Unit, Event) 
	Unit:FullCastSpellOnTarget(22120, Unit:GetMainTank()) 
end

function CuratorInsivius_FrostNova(Unit, Event) 
	Unit:CastSpell(11831) 
end

function CuratorInsivius_MortalStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(39171, Unit:GetMainTank()) 
end

function CuratorInsivius_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CuratorInsivius_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25448, 1, "CuratorInsivius_OnCombat")
RegisterUnitEvent(25448, 2, "CuratorInsivius_OnLeaveCombat")
RegisterUnitEvent(25448, 4, "CuratorInsivius_OnDied")