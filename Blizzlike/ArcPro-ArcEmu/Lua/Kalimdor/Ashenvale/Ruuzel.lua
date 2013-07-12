--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Ruuzel_OnCombat(Unit, Event)
	Unit:RegisterEvent("Ruuzel_HeroicStrike", 6000, 0)
end

function Ruuzel_HeroicStrike(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(25712, pUnit:GetMainTank()) 
end

function Ruuzel_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Ruuzel_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3943, 1, "Ruuzel_OnCombat")
RegisterUnitEvent(3943, 2, "Ruuzel_OnLeaveCombat")
RegisterUnitEvent(3943, 4, "Ruuzel_OnDied")