--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TormentedDrakkari_OnCombat(Unit, Event)
	Unit:RegisterEvent("TormentedDrakkari_Cannibalize", 12000, 0)
	Unit:RegisterEvent("TormentedDrakkari_CrazedHunger", 6000, 1)
	Unit:RegisterEvent("TormentedDrakkari_Kick", 7000, 0)
	Unit:RegisterEvent("TormentedDrakkari_TormentedRoar", 8000, 0)
end

function TormentedDrakkari_Cannibalize(Unit, Event) 
	Unit:CastSpell(50642) 
end

function TormentedDrakkari_CrazedHunger(Unit, Event) 
	Unit:CastSpell(3151) 
end

function TormentedDrakkari_Kick(Unit, Event) 
	Unit:FullCastSpellOnTarget(43518, Unit:GetMainTank()) 
end

function TormentedDrakkari_TormentedRoar(Unit, Event) 
	Unit:CastSpell(50636) 
end

function TormentedDrakkari_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TormentedDrakkari_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26965, 1, "TormentedDrakkari_OnCombat")
RegisterUnitEvent(26965, 2, "TormentedDrakkari_OnLeaveCombat")
RegisterUnitEvent(26965, 4, "TormentedDrakkari_OnDied")