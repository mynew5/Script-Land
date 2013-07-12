--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Ursoc_OnCombat(Unit, Event)
	Unit:RegisterEvent("Ursoc_CrunchArmor", 6000, 0)
	Unit:RegisterEvent("Ursoc_OldGodsInfluence", 10000, 1)
	Unit:RegisterEvent("Ursoc_Summon BloodoftheOldGod", 5000, 1)
end

function Ursoc_CrunchArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(52581, Unit:GetMainTank()) 
end

function Ursoc_OldGodsInfluence(Unit, Event) 
	Unit:FullCastSpellOnTarget(52583, Unit:GetMainTank()) 
end

function Ursoc_SummonBloodoftheOldGod(Unit, Event) 
	Unit:CastSpell(52560) 
end

function Ursoc_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Ursoc_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26633, 1, "Ursoc_OnCombat")
RegisterUnitEvent(26633, 2, "Ursoc_OnLeaveCombat")
RegisterUnitEvent(26633, 4, "Ursoc_OnDied")