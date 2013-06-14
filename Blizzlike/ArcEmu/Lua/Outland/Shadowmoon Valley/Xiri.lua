--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Xiri_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("Xiri_BlindingLight", 24000, 0)
end

function Xiri_OnSpawn(Unit,Event)
	Unit:RegisterEvent("Xiri_LightOfTheNaaru1", 20000, 0)
	Unit:RegisterEvent("Xiri_LightOfTheNaaru2", 20000, 0)
	Unit:RegisterEvent("Xiri_LightOfTheNaaru3", 20000, 0)
end

function Xiri_BlindingLight(Unit,Event)
	Unit:FullCastSpellOnTarget(33805)
end

function Xiri_LightOfTheNaaru1(Unit,Event)
	Unit:CastSpell(39828)
end

function Xiri_LightOfTheNaaru2(Unit,Event)
	Unit:CastSpell(39831)
end

function Xiri_LightOfTheNaaru3(Unit,Event)
	Unit:CastSpell(39832)
end

function Xiri_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function Xiri_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(18528, 1, "Xiri_OnEnterCombat")
RegisterUnitEvent(18528, 2, "Xiri_OnLeaveCombat")
RegisterUnitEvent(18528, 4, "Xiri_OnDied")
RegisterUnitEvent(18528, 18, "Xiri_OnSpawn")