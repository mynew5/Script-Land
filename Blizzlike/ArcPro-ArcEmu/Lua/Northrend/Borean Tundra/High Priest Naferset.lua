--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HighPriestNaferset_OnCombat(Unit, Event)
	Unit:RegisterEvent("HighPriestNaferset_MindBlast", 6000, 0)
	Unit:RegisterEvent("HighPriestNaferset_Renew", 13000, 0)
end

function HighPriestNaferset_MindBlast(Unit, Event) 
	Unit:FullCastSpellOnTarget(15587, Unit:GetMainTank()) 
end

function HighPriestNaferset_Renew(Unit, Event) 
	Unit:CastSpell(11640) 
end

function HighPriestNaferset_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HighPriestNaferset_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26076, 1, "HighPriestNaferset_OnCombat")
RegisterUnitEvent(26076, 2, "HighPriestNaferset_OnLeaveCombat")
RegisterUnitEvent(26076, 4, "HighPriestNaferset_OnDied")