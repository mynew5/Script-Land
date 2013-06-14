--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Dreadwarden_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("Dreadwarden_Spell1", 34000, 0)
	Unit:RegisterEvent("Dreadwarden_Spell2", 21000, 0)
end

function Dreadwarden_Spell1(Unit,Event)
	Unit:FullCastSpellOnTarget(11443, Unit:GetClosestPlayer())
end

function Dreadwarden_Spell2(Unit,Event)
	Unit:FullCastSpellOnTarget(32736, Unit:GetClosestPlayer())
end

function Dreadwarden_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function Dreadwarden_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19744, 1, "Dreadwarden_OnEnterCombat")
RegisterUnitEvent(19744, 2, "Dreadwarden_OnLeaveCombat")
RegisterUnitEvent(19744, 4, "Dreadwarden_OnDied")