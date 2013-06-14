--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Sunfury_Arcanist_OnCombat(Unit, Event)
	Unit:RegisterEvent("Sunfury_Arcanist_Arcane_Missiles", 6000, 0)
	Unit:RegisterEvent("Sunfury_Arcanist_Bloodcrystal_Surge", 10000, 0)
end

function Sunfury_Arcanist_Arcane_Missiles(Unit, Event)
	Unit:FullCastSpellOnTarget(34447, 	Unit:MainTank())
end

function Sunfury_Arcanist_Bloodcrystal_Surge(Unit, Event)
	Unit:CastSpell(35778)
end

function Sunfury_Arcanist_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Sunfury_Arcanist_OnDeath(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20134, 1, "Sunfury_Arcanist_OnCombat")
RegisterUnitEvent(20134, 2, "Sunfury_Arcanist_OnLeaveCombat")
RegisterUnitEvent(20134, 4, "Sunfury_Arcanist_OnDeath")