--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: LUA++; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[
Battleguard Sartura yells: I sentence you to death!
Battleguard Sartura yells: I serve to the last!
Battleguard Sartura yells: You will be judged for defiling these sacred grounds! The laws of the Ancients will not be challenged! Trespassers will be annihilated!
]]--

function Sartura_Knockback(pUnit, event)
	pUnit:CastSpellOnTarget(10689, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Sartura_Knockback2", math.random(25000,60000), 1)
end

function Sartura_Knockback2(pUnit, event)
	pUnit:CastSpellOnTarget(10689, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Sartura_Knockback", math.random(25000,60000), 1)
end

function Sartura_Whirlwind(Unit)
	Unit:CastSpell(46270)
end

function Sartura_Phase2(Unit, event)
	if(Unit:GetHealthPct() < 20) then
		Unit:RemoveEvents()
		Unit:CastSpell(28747)
		Unit:RegisterEvent("Sartura_Enrage", 1000, 0)
	end
end

function Sartura_Enrage(Unit)
	local vars = getvars(Unit);
	vars.EnrageTimer = vars.EnrageTimer + 1;
	if(vars.EnrageTimer == 600) then
		vars.EnrageTimer = 0;
		setvars(Unit, vars);
		Unit:CastSpell(34624)
	end
	setvars(Unit, vars);
end

function Sartura_OnCombat(Unit, event)
	setvars(Unit, {EnrageTimer = 1});
	Unit:PlaySoundToSet(8646)
	Unit:SendChatMessage(12, 0, "You will be judged for defiling these sacred grounds! The laws of the Ancients will not be challenged! Trespassers will be annihilated!")
	Unit:RegisterEvent("Sartura_Whirlwind", 30000, 0)
	Unit:RegisterEvent("Sartura_Phase2", 1000, 0)
	Unit:RegisterEvent("Sartura_Knockback", math.random(25000,60000), 1)
	Unit:RegisterEvent("Sartura_Enrage", 1000, 0)
end

function Sartura_OnLeaveCombat(Unit, event)
	Unit:RemoveEvents()
end

function Sartura_OnKilledTarget(Unit, event)
	Unit:PlaySoundToSet(8647)
	Unit:SendChatMessage(12, 0, "I sentence you to death!")
end

function Sartura_OnDied(Unit, event)
	Unit:PlaySoundToSet(8648)
	Unit:SendChatMessage(12, 0, "I serve to the last!")
	Unit:RemoveEvents()
end

RegisterUnitEvent(15516, 1, "Sartura_OnCombat")
RegisterUnitEvent(15516, 2, "Sartura_OnLeaveCombat")
RegisterUnitEvent(15516, 3, "Sartura_OnKilledTarget")
RegisterUnitEvent(15516, 4, "Sartura_OnDied")