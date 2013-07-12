--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Gizlock_OnCombat(Unit, Event)
	Unit:SendChatMessage(12, 0, "Mine! Mine! Mine! Gizlock is the ruler of this domain! You shall never reveal my presence!")
	Unit:RegisterEvent("Shoot", 7000, 0)
	Unit:RegisterEvent("Bomb", 14000, 0)
	Unit:RegisterEvent("Flash", 21000, 0)
	Unit:RegisterEvent("Gun", 28000, 0)
end

function Shoot(pUnit, Event) 
	pUnit:CastSpellOnTarget(16100) 
end

function Bomb(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9143, pUnit:GetMainTank()) 
end

function Flash(pUnit, Event) 
	pUnit:CastSpellOnTarget(29419, pUnit:GetMainTank()) 
end

function Gun(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(21833, pUnit:GetMainTank()) 
end

function Gizlock_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Gizlock_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(13601, 1, "Gizlock_OnCombat")
RegisterUnitEvent(13601, 2, "Gizlock_OnLeaveCombat")
RegisterUnitEvent(13601, 4, "Gizlock_OnDied")