--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Patchwerk_PoisonBoltVolley(pUnit, Event)
    pUnit:FullCastSpell(32309)
end

function Patchwerk_Berserk(pUnit, Event)
    pUnit:SendChatMessage(16, 0, "Patchwerk goes into a berserker rage!")
    pUnit:CastSpell(26662)
    pUnit:RegisterEvent("Patchwerk_PoisonBoltVolley", 4000, 0)
end

function Patchwerk_Enrage(pUnit, Event)
    local vars = getvars(pUnit)
    if((pUnit:GetHealthPct() <= 5) and (vars.phase == nil)) then
		pUnit:SendChatMessage(16, 0, "Patchwerk becomes enraged!")
		pUnit:CastSpell(28131)
		setvars(pUnit, {phase=1})
    end
end

function Patchwerk_HatefulStrike(pUnit, Event)
    local tbl = pUnit:GetInRangePlayers()
    for k,v in pairs(tbl) do
     	if(v:GetDistance(pUnit) <= 10) then
			if(v:GetHealth() > v:GetHealth()) then
				pUnit:FullCastSpellOnTarget(28308, v)
			end
		end
    end
end

function Patchwerk_OnEnterCombat(pUnit, Event)
    setvars(pUnit, {phase=nil})
    pUnit:SendChatMessage(14, 0, "Patchwerk want to play.")
    pUnit:RegisterEvent("Patchwerk_Berserk", 420000, 1)
    pUnit:RegisterEvent("Patchwerk_Enrage", 1000, 0)
    pUnit:RegisterEvent("Patchwerk_HatefulStrike", 1200, 0)
end

function Patchwerk_OnWipe(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(16028, 2, "Patchwerk_OnWipe")
RegisterUnitEvent(16028, 1, "Patchwerk_OnEnterCombat")