--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Sulfuron_OnCombat(Unit,event)
	setvars(Unit,{Priests = {}})
	Unit:RegisterEvent("Sulfuron_Spells", 10000, 0)
	Unit:RegisterEvent("Sulfuron_Inspire", 15000, 0)
end

function Sulfuron_OnWipe(Unit,event)
	Unit:RemoveEvents()
	--setvars(Unit,true)
end

function Sulfuron_OnDied(Unit,event)
	Unit:RemoveEvents()
	--setvars(Unit,true)
end

function Sulfuron_Spells(Unit)
	local rand = math.random(1,3)
	if(rand == 1) then
		Unit:CastSpell(19780)
	elseif(rand == 2) then
		Unit:CastSpell(19978)
	elseif(rand == 3)  and (Unit:GetRandomPlayer(0) ~= nil) then
		Unit:CastSpellOnTargeT(19781, Unit:GetRandomPlayer(0))
	end
end

function Sulfuron_Inspire(Unit)
	local args = getvars(Unit)
	table.insert(args.Priests,Unit)
	for k,v in pairs(args.Priests) do
		if(v ~= nil) then
			Unit:CastSpellOnTarget(19779, v)
		end
	end
end

RegisterUnitEvent(12098, 1, "Sulfuron_OnCombat")
RegisterUnitEvent(12098, 2, "Sulfuron_OnWipe")
RegisterUnitEvent(12098, 4, "Sulfuron_OnDied")

function Sulfuron_PriestCombat(Unit,event)
	local args = getvars(Unit)
	table.insert(args.Priests,Unit)
	Unit:RegisterEvent("Sulfuron_PriestSpells", 10000, 0)
	Unit:RegisterEvent("Sulfuron_PriestImmunityCheck", 5000, 0)
	Unit:RegisterEvent("Sulfuron_PriestHeal", 15000, 0)
	setvars(Unit, args);
end

function Sulfuron_PriestWipe(Unit,event)
	Unit:RemoveEvents()
end

function Sulfuron_PriestDied(Unit,event)
	Unit:RemoveEvents()
end

function Sulfuron_PriestSpells(Unit,event)
	local rand = math.random(1,2)
	if((rand == 1) and (Unit:GetRandomPlayer(0) ~= nil)) then
		Unit:CastSpell(23952, Unit:GetRandomPlayer(0))
	elseif((rand == 2) and (Unit:GetRandomPlayer(0) ~= nil)) then
		Unit:CastSpell(20294, Unit:GetRandomPlayer(0))
	end
end

function Sulfuron_PriestImmunityCheck(Unit,event)
	if((Unit:HasAura(1714)== true) or (Unit:HasAura(11719) == true)) then
		Unit:RemoveAura(1714)
		Unit:RemoveAura(11719)
	end
	Unit:CastSpell(6513)
end

function Sulfuron_PriestHeal(Unit)
	local tbl = { Unit:GetInRangeFriends() }
	for k,v in pairs(tbl) do
		if(math.random(0,1) < 0.5) then
			Unit:FullCastSpellOnTarget(36144, v)
		end
		break
	end
end

RegisterUnitEvent(11662, 1, "Sulfuron_PriestCombat")
RegisterUnitEvent(11662, 2, "Sulfuron_PriestWipe")
RegisterUnitEvent(11662, 4, "Sulfuron_PriestDied")