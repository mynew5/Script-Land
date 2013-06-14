--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Plaguehorror_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Plaguehorror_Pustulant", 18000, 0)
	pUnit:RegisterEvent("Plaguehorror_Toxicwaste", 1000, 1)
end

function Plaguehorror_Pustulant(pUnit, Event)
	pUnit:CastSpellOnTarget(69581, pUnit:GetRandomPlayer(0))
end

function Plaguehorror_Toxicwaste(pUnit, Event)
	pUnit:CastSpellOnTarget(70274, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Plaguehorror_Toxicwaste2", 10000, 0)
end

function Plaguehorror_Toxicwaste2(pUnit, Event)
	pUnit:CastSpellOnTarget(70274, pUnit:GetRandomPlayer(0))
end

function Plaguehorror_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Plaguehorror_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(36879, 1, "Plaguehorror_OnCombat")
RegisterUnitEvent(36879, 2, "Plaguehorror_OnLeaveCombat")
RegisterUnitEvent(36879, 4, "Plaguehorror_OnDeath")