--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Dragonflayer_Overseer_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Dragonflayer_Overseer_Battle_Shout", math.random(22000,25000), 0)
	pUnit:RegisterEvent("Dragonflayer_Overseer_Charge", 10000, 0)
	pUnit:RegisterEvent("Dragonflayer_Overseer_Demoralizing_Shout", 30000, 0)
end

function Dragonflayer_Overseer_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Dragonflayer_Overseer_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Dragonflayer_Overseer_Battle_Shout(pUnit, Event)
	pUnit:FullCastSpell(38232)
end

function Dragonflayer_Overseer_Charge(pUnit, Event)
	pUnit:FullCastSpellOnTarget(35570, pUnit:GetRandomPlayer(0))
end

function Dragonflayer_Overseer_Demoralizing_Shout(pUnit, Event)
	pUnit:FullCastSpell(16244)
end

RegisterUnitEvent(24085, 1, "Dragonflayer_Overseer_OnCombat")
RegisterUnitEvent(24085, 2, "Dragonflayer_Overseer_OnLeaveCombat")
RegisterUnitEvent(24085, 4, "Dragonflayer_Overseer_OnDeath")