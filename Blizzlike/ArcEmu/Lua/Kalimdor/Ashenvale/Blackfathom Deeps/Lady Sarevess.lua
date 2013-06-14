--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function LadySarevess_OnCombat(pUnit, event)
	pUnit:SendChatMessage(14, 0, "You should not be here! Slay them!")
	pUnit:PlaySoundToSet(5801)
	pUnit:RegisterEvent("ForkedLightning", 7000, 0)
	pUnit:RegisterEvent("Shoot", 14000, 0)
	pUnit:RegisterEvent("Slow", 21000, 0)
end

function ForkedLightning(pUnit, Event)
	pUnit:CastSpell(8435) 
	pUnit:RegisterEvent("ForkedLightning", 7000, 0)
end

function Shoot(pUnit, Event)
 	pUnit:FullCastSpellOnTarget(6660, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Shoot", 14000, 0)
end

function Slow(pUnit, Event)
  	pUnit:FullCastSpellOnTarget(246, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Slow", 21000, 0)
end

function LadySarevess_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end

function LadySarevess_OnKilledPlayer(pUnit, event)
	pUnit:SendChatMessage(14, 0, "Paltry kill.")
end

function LadySarevess_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(4831, 1, "LadySarevess_OnCombat")
RegisterUnitEvent(4831, 2, "LadySarevess_OnLeaveCombat")
RegisterUnitEvent(4831, 3, "LadySarevess_OnKilledPlayer")
RegisterUnitEvent(4831, 4, "LadySarevess_OnDeath")