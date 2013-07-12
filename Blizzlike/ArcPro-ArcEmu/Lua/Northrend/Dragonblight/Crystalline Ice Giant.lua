--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CrystallineIceGiant_OnCombat(Unit, Event)
	Unit:RegisterEvent("CrystallineIceGiant_IceStalagmite", 8000, 0)
	Unit:RegisterEvent("CrystallineIceGiant_IceBoulder", 5500, 0)
end

function CrystallineIceGiant_IceStalagmite(Unit, Event) 
	Unit:FullCastSpellOnTarget(50597, Unit:GetMainTank()) 
end

function CrystallineIceGiant_IceBoulder(Unit, Event) 
	Unit:FullCastSpellOnTarget(50588, Unit:GetMainTank()) 
end

function CrystallineIceGiant_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CrystallineIceGiant_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26291, 1, "CrystallineIceGiant_OnCombat")
RegisterUnitEvent(26291, 2, "CrystallineIceGiant_OnLeaveCombat")
RegisterUnitEvent(26291, 4, "CrystallineIceGiant_OnDied")