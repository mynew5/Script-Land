--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HBB_OnCombat(pUnit, Event)
local chance = math.random(1,2)
	if(chance == 1) then
		pUnit:SendChatMessage(14, 0, "Get away from those kegs!")
	elseif(chance == 2) then
		pUnit:SendChatMessage(12, 0, "You'll pay for that!")
	end
	pUnit:RegisterEvent("Drunkenrage", 7000, 0)
	pUnit:RegisterEvent("FlameBreath", 14000, 0)
end

function FlameBreath(pUnit, Event)
	pUnit:CastSpellOnTarget(9573)
end

function Drunkenrage(pUnit, Event)
	pUnit:CastSpellonTarget(14872)
end

function HBB_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function HBB_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(9537, 1, "HBB_OnCombat")
RegisterUnitEvent(9537, 2, "HBB_OnLeaveCombat")
RegisterUnitEvent(9537, 4, "HBB_OnDeath")