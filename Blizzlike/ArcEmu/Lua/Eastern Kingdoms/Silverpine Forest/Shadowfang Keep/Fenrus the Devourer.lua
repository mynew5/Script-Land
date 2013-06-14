--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: DARKI; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Puppy_OnCombat(Unit, Player, Event)
	Unit:RegisterEvent("Puppy_Chill", 7000, 0)
	Unit:RegisterEvent("Puppy_Volly", 14000, 0)
	Unit:RegisterEvent("Puppy_Armor", 21000, 0)
	Unit:RegisterEvent("Puppy_IceNova", 35000, 0)
end

function Puppy_Chill(Unit, Player, Event)
	Unit:CastSpell(21098)
end

function Puppy_Volly(Unit, Player, Event)
	Unit:CastSpell(38837)
end

function Puppy_Armor(Unit, Player, Event)
	Unit:CastSpell(27134)
end

function Puppy_IceNova(Unit, Player, Event)
	Unit:CastSpell(31250)
end

function Puppy_OnLeaveCombat(Unit, Player, Event)
	Unit:RemoveEvents()
end

function Puppy_OnKilledTarget(Unit, Player, Event)
	Unit:CastSpell(37669)
end

function Puppy_OnDied(Unit, Player, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(4274, 1, "Puppy_OnCombat")
RegisterUnitEvent(4274, 2, "Puppy_OnLeaveCombat")
RegisterUnitEvent(4274, 3, "Puppy_OnKilledTarget")
RegisterUnitEvent(4274, 4, "Puppy_OnDied") 