--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: DARKI; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function EcktheFerocious_OnCombat(Unit, Event)
	Unit:SendChatMessage(14, 0, "Grrrrrr")
	Unit:RegisterEvent("EcktheFerocious_EckBerserk", 20000, 0)
	Unit:RegisterEvent("EcktheFerocious_EckBite", 45000, 0)
	Unit:RegisterEvent("EcktheFerocious_EckSpit", 65000, 0)
	Unit:RegisterEvent("EcktheFerocious_EckSpring", 95000, 0)
end

function EcktheFerocious_EckBerserk(pUnit, Event)
	pUnit:CastSpellOnTarget(55816, pUnit:GetRandomPlayer(0))
end

function EcktheFerocious_EckBite(pUnit, Event)
	pUnit:FullCastSpellOnTarget(55813, pUnit:GetRandomPlayer(0))
end

function EcktheFerocious_EckSpit(pUnit, Event)
	pUnit:CastSpellOnTarget(55814, pUnit:GetRandomPlayer(0))
end

function EcktheFerocious_EckSpring(pUnit, Event)
	pUnit:FullCastSpellOnTarget(55815, pUnit:GetRandomPlayer(0))
end

function EcktheFerocious_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents() 
end

function EcktheFerocious_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(29932, 1, "EcktheFerocious_OnCombat")
RegisterUnitEvent(29932, 2, "EcktheFerocious_OnLeaveCombat")
RegisterUnitEvent(29932, 4, "EcktheFerocious_OnDied")