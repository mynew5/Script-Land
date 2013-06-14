--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Thaddius_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "EAT YOUR BONES!")
	pUnit:RegisterEvent("Thaddius_PolarityShift", 30000, 0)
	pUnit:RegisterEvent("Thaddius_ChainLightning", 15000, 0)
end

function Thaddius_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Thaddius_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Thaddius_PolarityShift(pUnit, Event)
	pUnit:CastSpell(28089)
end

function Thaddius_ChainLightning(pUnit, Event)
	pUnit:FullCastSpellOnTarget(28293, pUnit:GetMainTank())
end

RegisterUnitEvent(15928, 1, "Thaddius_OnCombat")
RegisterUnitEvent(15928, 2, "Thaddius_OnLeaveCombat")
RegisterUnitEvent(15928, 4, "Thaddius_OnDeath")