--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function UDH_OnCombat(pUnit, Event)
local npcsay = math.random(1,3)
	if(npcsay == 1) then
		pUnit:SendChatMessage(14, 0, "You have summoned me, fool! Now DIE!")
	elseif(npcsay == 2) then
		pUnit:SendChatMessage(12, 0, "I'll crush you!")
	elseif(npcsay == 3) then
		pUnit:SendChatMessage(12, 0, "Me smash! You Die!")
	end
	pUnit:RegisterEvent("IntimidatingRoar", 7000, 0)
	pUnit:RegisterEvent("Rend", 14000, 0)
	pUnit:RegisterEvent("Strike", 21000, 0)
end

function IntimidatinRoar(pUnit, Event)
	pUnit:CastSpellOnTarget(16508)
end

function Rend(pUnit, Event)
	pUnit:CastSpellOnTarget(16509)
end

function Strike(pUnit, Event)
	pUnit:CastSpellOnTarget(15580)
end

function UDH_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function UDH_OnDeath(pUnit, Event)
	pUnit:removeEvents()
end

RegisterUnitEvent(10584, 1, "UDH_OnCombat")
RegisterUnitEvent(10584, 2, "UDH_OnLeaveCombat")
RegisterUnitEvent(10584, 4, "UDH_OnDeath")