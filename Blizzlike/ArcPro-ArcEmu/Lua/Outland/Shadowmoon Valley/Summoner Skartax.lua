--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SummonerSkartax_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("SummonerSkartax_Incinerate", 5000, 0)
	Unit:RegisterEvent("SummonerSkartax_ShadowBolt", 9000, 0)
end

function SummonerSkartax_Incinerate(Unit,Event)
	Unit:FullCastSpellOnTarget(38401, Unit:GetClosestPlayer())
end

function SummonerSkartax_ShadowBolt(Unit,Event)
	Unit:FullCastSpellOnTarget(12471, Unit:GetClosestPlayer())
end

function SummonerSkartax_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function SummonerSkartax_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21207, 1, "SummonerSkartax_OnEnterCombat")
RegisterUnitEvent(21207, 2, "SummonerSkartax_OnLeaveCombat")
RegisterUnitEvent(21207, 4, "SummonerSkartax_OnDied")