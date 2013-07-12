--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Sunfury_Arch_Mage_OnCombat(Unit, Event)
	Unit:RegisterEvent("Sunfury_Arch_Mage_Nova", 10000, 0)
	Unit:RegisterEvent("Sunfury_Arch_Mage_Fiery_Intellect", 1000, (1))
	Unit:RegisterEvent("Sunfury_Arch_Mage_Fireball", 4000, 0)
end

function Sunfury_Arch_Mage_Nova(Unit, Event)
	Unit:CastSpell(11831)
end

function Sunfury_Arch_Mage_Fiery_Intellect(Unit, Event)
	Unit:CastSpell(35917)
end

function Sunfury_Arch_Mage_Fireball(Unit, Event)
	Unit:FullCastSpellOnTarget(20823, Unit:MainTank())
end

function Sunfury_Arch_Mage_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Sunfury_Arch_Mage_OnDeath(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20135, 1, "Sunfury_Arch_Mage_OnCombat")
RegisterUnitEvent(20135, 2, "Sunfury_Arch_Mage_OnLeaveCombat")
RegisterUnitEvent(20135, 4, "Sunfury_Arch_Mage_OnDeath")