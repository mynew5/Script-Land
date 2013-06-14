--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Ascendscripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function RuulOnestone_OnEnterCombat(Unit, Event)
	Unit:CastSpell(6742)
	Unit:RegisterEvent("LightningBolt", 5000, 0)
end

function LightningBolt(Unit, Event)
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank())
end

function RuulOnestone_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function RuulOnestone_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2602, 1, "RuulOnestone_OnEnterCombat")
RegisterUnitEvent(2602, 2, "RuulOnestone_OnLeaveCombat")
RegisterUnitEvent(2602, 4, "RuulOnestone_OnDied")