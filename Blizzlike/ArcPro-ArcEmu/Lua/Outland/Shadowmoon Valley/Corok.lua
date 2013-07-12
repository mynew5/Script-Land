--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Corok_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("Corok_Spell1", 11000, 0)
	Unit:RegisterEvent("Corok_Spell2", 26000, 0)
end

function Corok_Spell1(Unit,Event)
	Unit:FullCastSpellOnTarget(12612, Unit:GetClosestPlayer())
end

function Corok_Spell2(Unit,Event)
	Unit:FullCastSpellOnTarget(15550, Unit:GetClosestPlayer())
end

function Corok_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function Corok_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(22011, 1, "Corok_OnEnterCombat")
RegisterUnitEvent(22011, 2, "Corok_OnLeaveCombat")
RegisterUnitEvent(22011, 4, "Corok_OnDied")