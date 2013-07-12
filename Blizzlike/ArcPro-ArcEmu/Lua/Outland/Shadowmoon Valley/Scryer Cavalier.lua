--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ScryerCavalier_OnEnterCombat(Unit,Event)
	Unit:CastSpell(30931)
	Unit:registerEvent("ScryerCavalier_Spellbreaker", 24000, 0)
end

function ScryerCavalier_Spellbreaker(Unit,Event)
	Unit:FullCastSpellOnTarget(35871, Unit:GetClosestPlayer())
end

function ScryerCavalier_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function ScryerCavalier_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(22967, 1, "ScryerCavalier_OnEnterCombat")
RegisterUnitEvent(22967, 2, "ScryerCavalier_OnLeaveCombat")
RegisterUnitEvent(22967, 4, "ScryerCavalier_OnDied")