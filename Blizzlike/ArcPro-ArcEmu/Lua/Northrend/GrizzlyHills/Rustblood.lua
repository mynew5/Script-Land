--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Rustblood_OnCombat(Unit, Event)
	Unit:RegisterEvent("Rustblood_Cleave", 8000, 0)
	Unit:RegisterEvent("Rustblood_HeadSmash", 10000, 0)
	Unit:RegisterEvent("Rustblood_Knockback", 11000, 0)
	Unit:RegisterEvent("Rustblood_LightningBolt", 6000, 0)
end

function Rustblood_Cleave(Unit, Event) 
	Unit:CastSpell(42746) 
end

function Rustblood_HeadSmash(Unit, Event) 
	Unit:FullCastSpellOnTarget(14102, Unit:GetMainTank()) 
end

function Rustblood_Knockback(Unit, Event) 
	Unit:FullCastSpellOnTarget(49398, Unit:GetMainTank()) 
end

function Rustblood_LightningBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(49454, Unit:GetMainTank()) 
end

function Rustblood_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Rustblood_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27717, 1, "Rustblood_OnCombat")
RegisterUnitEvent(27717, 2, "Rustblood_OnLeaveCombat")
RegisterUnitEvent(27717, 4, "Rustblood_OnDied")