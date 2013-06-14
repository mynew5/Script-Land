--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Performer/Performa; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BroGaz_OnEnterCombat(Unit, Event)
    Unit:FullCastSpell(12468)
	Unit:RegisterEvent("BroGaz_Heal", 5000, 0)
end

function BroGaz_Heal(Unit, Event)
    if(Unit:GetHealthPct() < 30) then
		Unit:FullCastSpell(15586)
    end
end

function BroGaz_OnLeaveCombat(Unit)
    Unit:RemoveEvents()
end

function BroGaz_Death(Unit)
    Unit:RemoveEvents()
end

RegisterUnitEvent(18684, 1, "BroGaz_OnEnterCombat")
RegisterUnitEvent(18684, 2, "BroGaz_OnLeaveCombat")
RegisterUnitEvent(18684, 3, "BroGaz_Death")