--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Moon Project; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SunbladeMageGuard_OnCombat(Unit, Event)
	Unit:RegisterAIUpdateEvent(7000)
end

function SunbladeMageGuard_GlaiveThrow(Unit)
	local FlipGlaive = math.random(1, 2)
	if((FlipGlaive == 1) and (Unit:GetRandomPlayer(7))) then
		Unit:CastSpellOnTarget(44478, Unit:GetRandomPlayer(7))
	else
		Unit:CastSpellOnTarget(46028, Unit:GetRandomPlayer(7))
	end
end

function SunbladeMageGuard_LeaveCombat(Unit, Event)
	Unit:RemoveAIUpdateEvent()
end

function SunbladeMageGuard_Died(Unit, Event)
	Unit:RemoveAIUpdateEvent()
end

RegisterUnitEvent(24683, 1, "SunbladeMageGuard_OnCombat")
RegisterUnitEvent(24683, 21, "SunbladeMageGuard_GlaiveThrow")
RegisterUnitEvent(24683, 2, "SunbladeMageGuard_LeaveCombat")
RegisterUnitEvent(24683, 4, "SunbladeMageGuard_Died")