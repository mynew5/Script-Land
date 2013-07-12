--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Grimgrizzle_OnCombat(Unit, Event)
	Unit:RegisterEvent("Grimgrizzle_ShootGun", 6000, 0)
end

function Grimgrizzle_ShootGun(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(61353, pUnit:GetMainTank()) 
end

function Grimgrizzle_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Grimgrizzle_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(32710, 1, "Grimgrizzle_OnCombat")
RegisterUnitEvent(32710, 2, "Grimgrizzle_OnLeaveCombat")
RegisterUnitEvent(32710, 4, "Grimgrizzle_OnDied")


--[[Dalaran -- Horde Guards
Dalaran -- Alliance Guards]]
function Check(pUnit, spell)
	local P = pUnit:GetInRangeEnemies()
	if(P) then
		for _,v in ipairs(P) do
			if(v:IsPlayer() and not v:IsGm() and v:GetAreaId() == 4553 and not v:HasAura(70973) and not v:HasAura(70971) and pUnit:GetDistanceYards(v) <= 8) then
				v:CastSpell(spell)
			end
		end
	end
end

RegisterUnitEvent(29254, 18, "Check") -- A
RegisterUnitEvent(29255, 18, "Check") -- H