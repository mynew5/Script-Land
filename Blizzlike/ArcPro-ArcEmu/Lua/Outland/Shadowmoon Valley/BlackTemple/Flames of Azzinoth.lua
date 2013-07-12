--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: DARKI; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function FlameOfAzzinoth_OnSpawn(pUnit,Event)
	pUnit:SetUInt64Value(UnitField.Unit_FIELD_FLAGS, 0)
end

function FlameOfAzzinoth_OnEnterCombat(pUnit,Event)
	pUnit:CastSpell(40637)
	pUnit:RegisterEvent("FlameOfAzzinoth_FlameBlast", 15000, 0)
end

function FlameOfAzzinoth_FlameBlast(pUnit,Event)
	if(type(pUnit:GetRandomPlayer(0)) == "userdata") then
		pUnit:FullCastSpellOnTarget(40631, pUnit:GetRandomPlayer(0))
	end
end

function FlameOfAzzinoth_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function FlameOfAzzinoth_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(22997, 1, "FlameOfAzzinoth_OnEnterCombat")
RegisterUnitEvent(22997, 2, "FlameOfAzzinoth_OnLeaveCombat")
RegisterUnitEvent(22997, 4, "FlameOfAzzinoth_OnDied")