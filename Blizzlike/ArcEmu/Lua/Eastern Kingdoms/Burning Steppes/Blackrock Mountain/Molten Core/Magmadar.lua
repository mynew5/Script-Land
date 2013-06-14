--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: LUA++; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function MagMadar_OnCombat(Unit, Event)
	Unit:RegisterEvent("MagMadarSpells", math.random(7000,10000), 0)
	Unit:RegisterEvent("MagMadarPanic", 30000, 0)
end

function MagMadar_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function MagMadar_OnWipe(Unit, Event)
	Unit:RemoveEvents()
end

function MagMadarSpells(Unit, Event)
	local rand = math.random(1,3)
	local plr = Unit:GetRandomPlayer(0)
	if(rand == 1) then
		Unit:FullCastSpell(19451)
	elseif(rand == 2) then
		Unit:FullCastSpell(19272)
	elseif((rand == 3) and (plr ~= nil)) then
		Unit:SpawnGameObject(177704, plr:GetX(), plr:GetY(), plr:GetZ(), plr:GetO(),10000)
	end
end

RegisterUnitEvent(11982, 1, "MagMadar_OnCombat")
RegisterUnitEvent(11982, 2, "MagMadar_OnWipe")
RegisterUnitEvent(11982, 4, "MagMadar_OnDied")

function LavaBombActivate(Unit, event, pMiscUnit)
	pMiscUnit:CastSpellOnTarget(19428, pMiscUnit)
end

function MagMadarPanic(Unit)
    local tbl = Unit:GetInRangePlayers()
	for k,v in pairs(tbl) do
		if(Unit:GetDistance(v) <= 30) then
			Unit:FullCastSpellOnTarget(19408, v)
		end
	end
end

RegisterGameObjectEvent(177704, 4, "LavaBombActivate")