--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Flames_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Flames_Dance", 1000, 0)
    Unit:RegisterEvent("Flames_Seduction", 180000, 0)
    Unit:RegisterEvent("Flames_Summon", 1000, (1))
end

function Flames_Dance(Unit, Event)
    Unit:CastSpell(45427)
end

function Flames_Seduction(Unit, Event)
    Unit:FullCastSpellOnTarget(47057, Unit:GetClosestPlayer())
end

function Flames_Summon(Unit, Event)
    Unit:CastSpell(45423)
end

function Flames_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Flames_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(25305, 1, "Flames_OnEnterCombat")
RegisterUnitEvent(25305, 2, "Flames_OnLeaveCombat")
RegisterUnitEvent(25305, 4, "Flames_OnDied")