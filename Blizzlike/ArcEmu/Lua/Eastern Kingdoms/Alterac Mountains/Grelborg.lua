--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function grelborg_rof(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(11990, pUnit:GetClosestPlayer())
	end
end

function grelborg_flameward(pUnit, Event)
	pUnit:CastSpell(4979)
end

function grelborg_bloodlust(pUnit, Event)
	pUnit:CastSpell(6742)
end

function grelborg_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("grelborg_rof", 25000, 0)
	pUnit:RegisterEvent("grelborg_flameward", 10000, 0)
	pUnit:RegisterEvent("grelborg_bloodlust", 20000, 1)
end

function grelborg_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2417, 1, "grelborg_OnCombat")
RegisterUnitEvent(2417, 2, "grelborg_OnLeaveCombat")