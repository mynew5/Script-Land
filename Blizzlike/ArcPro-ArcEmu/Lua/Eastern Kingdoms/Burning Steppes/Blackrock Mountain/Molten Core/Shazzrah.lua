--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: LUA++
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Shazzrah_OnCombat(Unit,event)
	--Unit:RegisterEvent("Shazzrah_Blink", math.random(43000,45000), 0)
	Unit:RegisterEvent("Shazzrah_CounterSpell", math.random(20000,25000), 0)
	Unit:RegisterEvent("Shazzrah_ArcaneExplosion", math.random(9000,12000),0)
	Unit:RegisterEvent("Shazzrah_MagicGrounding", math.random(20000,30000), 0)
	Unit:RegisterEvent("Shazzrah_Curse", 30000, 0)
end

function Shazzrah_OnWipe(Unit,event)
	Unit:RemoveEvents()
end

function Shazzrah_OnDied(Unit,event)
	Unit:RemoveEvents()
end

function Shazzrah_ArcaneExplosion(Unit,event)
	Unit:FullCastSpell(19712)
end

function Shazzrah_MagicGrounding(Unit,event)
	Unit:CastSpell(19714)
end

function Shazzrah_Curse(Unit,event)
	local tbl = Unit:GetInRangePlayers()
	for k,v in pairs(tbl) do
		if(Unit:GetDistance(v) < 35) then
			Unit:FullCastSpellOnTarget(19713, v)
		end
	end
end

function Shazzrah_CounterSpell(Unit,event)
	Unit:CastSpell(19715)
end

--[[function Shazzrah_Blink(Unit,event)
	local plr = Unit:GetRandomPlayer(0)
	--Unit:SetFacing(plr)
	Unit:CastSpell(21655)
	Unit:Teleport(Unit:GetMapId(), plr:GetX(), plr:GetY(), plr:GetZ())
	Unit:WipeThreatList()
	Unit:ModThreat(Unit:GetRandomPlayer(0), 1000)
	Shazzrah_ArcaneExplosion(Unit,event)
end]]

RegisterUnitEvent(12264, 1, "Shazzrah_OnCombat")
RegisterUnitEvent(12264, 2, "Shazzrah_OnWipe")
RegisterUnitEvent(12264, 4, "Shazzrah_OnDied")