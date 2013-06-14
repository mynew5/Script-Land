--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Nak_OnCombat(Unit, Event)
	Unit:RegisterEvent("Nak_LesserHealingWave", 15000, 0)
	Unit:RegisterEvent("Nak_LightningBolt", 8000, 0)
end

function Nak_LesserHealingWave(Unit, Event) 
	Unit:CastSpell(8004) 
end

function Nak_LightningBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank()) 
end

function Nak_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Nak_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3434, 1, "Nak_OnCombat")
RegisterUnitEvent(3434, 2, "Nak_OnLeaveCombat")
RegisterUnitEvent(3434, 4, "Nak_OnDied")