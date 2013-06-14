--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GLA_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "Intruders in the Manufactory? My constructs will destroy you!")
	pUnit:RegisterEvent("LightningShield", 7000, 0)
	pUnit:RegisterEvent("ChainLightning", 14000, 0)
	pUnit:RegisterEvent("Shock", 21000, 0)
end

function LightningShield(pUnit, Event)
	pUnit:CastSpell(15507)
end

function ChainLightning(pUnit, Event)
	pUnit:FullCastSpell(15305)
end

function Shock(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15605)
end

function GLA_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function GLA_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(8983, 1, "GLA_OnCombat")
RegisterUnitEvent(8983, 2, "GLA_OnLeaveCombat")
RegisterUnitEvent(8983, 4, "GLA_OnDeath")