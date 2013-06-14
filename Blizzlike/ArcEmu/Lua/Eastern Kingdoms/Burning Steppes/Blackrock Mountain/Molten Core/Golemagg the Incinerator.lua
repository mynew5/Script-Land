--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: LUA++; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Golemagg_OnCombat(Unit,event)
	setvars(Unit,{Golemagg = Unit, Ragers= {}})
	Unit:RegisterEvent("Golemagg_Trust", 30000, 0)
	Unit:RegisterEvent("Golemagg_PyroBlast", 15000, 0)
	Unit:RegisterEvent("Golemagg_EarthQuake", 1000, 1)
	Unit:RegisterEvent("Golemagg_AttractRager", 1000, 1)
end

function Golemagg_Trust(Unit,event)
	local args = getvars(Unit)
	for k,v in pairs(args.Ragers) do
		if(v ~= nil) then
			v:FullCastSpell(20553)
		end
	end
end

function Golemagg_PyroBlast(Unit,event)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:FullCastSpellOnTarget(20228, Unit:GetRandomPlayer(0))
	end
end

function Golemagg_EarthQuake(Unit,event)
	if(Unit:GetHealthPct() <= 10) then
		Unit:CastSpell(19798)
	else
		Unit:RegisterEvent("Golemagg_EarthQuake", 500, 1)
	end
end

function Golemagg_AttractRager(Unit,event)
	if(Unit:GetHealthPct() <= 10) then
		local args = getvars(Unit)
		local tbl = Unit:GetInRangePlayers()
		for k,playerUnit in pairs(tbl) do
			for _,RagersUnit in pairs(args.Ragers) do
				if(playerUnit:GetDistance(RagersUnit) <= 20) then
					RagersUnit:ModThreat(playerUnit, 5000)
				end
			end
		end
	end
end

function Golemagg_OnDied(Unit,event)
	Unit:RemoveEvents()
	local args = getvars(Unit)
	if(args.Ragers ~= nil) then
		for k,v in pairs(args.Ragers) do
			v:Kill(v)
		end
	end
end

function Golemagg_OnWipe(Unit,event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(11988, 1, "Golemagg_OnCombat")
RegisterUnitEvent(11988, 2, "Golemagg_OnWipe")
RegisterUnitEvent(11988, 4, "Golemagg_OnDied")

function CoreRager_OnCombat(Unit,event)
	local args = getvars(Unit)
	table.insert(args.Ragers,Unit)
	Unit:RegisterEvent("CoreRager_Mangle", 10000, 0)
	Unit:RegisterEvent("CoreRager_RefuseDeath", 5000, 1)
	setvars(Unit, args); -- still need to write the changes back
end

function CoreRager_OnWipe(Unit,event)
	Unit:RemoveEvents()
end

function CoreRager_OnDied(Unit,event)
	Unit:RemoveEvents()
end

function CoreRager_Mangle(Unit,event)
	if(Unit:GetMainTank() ~= nil) then
		Unit:CastSpellOnTarget(19820, Unit:GetMainTank())
	end
end

function CoreRager_RefuseDeath(Unit,event)
	if(Unit:GetHealthPct() <= 50) then
		local args = getvars(Unit)
		if(args.Golemagg:IsAlive() == true) then
			Unit:Heal(Unit,0,Unit:GetUInt32Value(UNIT_FIELD_MAXHEALTH))
			Unit:SendChatMessage(16, 0, Unit:GetName().."refuses to die while it's master is in trouble.")
		end
	else
		Unit:RegisterEvent("CoreRager_RefuseDeath", 5000, 1)
	end
end

RegisterUnitEvent(11672, 1, "CoreRager_OnCombat")
RegisterUnitEvent(11672, 2, "CoreRager_OnWipe")
RegisterUnitEvent(11672, 4, "CoreRager_OnDied")