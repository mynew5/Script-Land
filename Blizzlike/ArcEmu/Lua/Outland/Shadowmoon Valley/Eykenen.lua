--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Eykenen_OnEnterCombat(Unit,Event)
	Unit:CastSpell(32734)
	Unit:RegisterEvent("Eykenen_EarthShield", 43000, 0)
	Unit:RegisterEvent("Eykenen_EarthShock", 10000, 0)
end

function Eykenen_EarthShield(Unit,Event)
	Unit:CastSpell(32734)
end

function Eykenen_EarthShock(Unit,Event)
	Unit:FullCastSpellOnTarget(13281, Unit:GetClosestPlayer())
end

function Eykenen_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function Eykenen_OnDeath(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21709, 1, "Eykenen_OnEnterCombat")
RegisterUnitEvent(21709, 1, "Eykenen_OnLeaveCombat")
RegisterUnitEvent(21709, 1, "Eykenen_OnDeath")