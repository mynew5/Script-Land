--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Holystone Productions; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DeathboundWard_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Disrupting_Shout", 10000, 1)
end

function Disrupting_Shout(pUnit, Event)
	pUnit:FullCastSpell(71022)
	pUnit:RegisterEvent("Saber_Lash_InComing", 8000, 1)
end

function Saber_Lash_InComing(pUnit, Event)
	pUnit:RegisterEvent("Saber_Lash", 1000, 1)
end

function Saber_Lash(pUnit, Event)
	pUnit:CastSpellOnTarget(71021, pUnit:GetClosestPlayer())
	pUnit:RegisterEvent("Disrupting_Shout", 9000, 1)
end

function DeathboundWard_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(37007, 1, "DeathboundWard_OnCombat")
RegisterUnitEvent(37007, 2, "DeathboundWard_OnLeaveCombat")