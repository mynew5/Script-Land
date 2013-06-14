--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Tukemuth_OnCombat(Unit, Event)
	Unit:RegisterEvent("Tukemuth_Trample", 10000, 0)
	Unit:RegisterEvent("Tukemuth_TuskStrike", 8000, 0)
end

function Tukemuth_Trample(Unit, Event) 
	Unit:CastSpell(57066) 
end

function Tukemuth_TuskStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(50410, Unit:GetMainTank()) 
end

function Tukemuth_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Tukemuth_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(32400, 1, "Tukemuth_OnCombat")
RegisterUnitEvent(32400, 2, "Tukemuth_OnLeaveCombat")
RegisterUnitEvent(32400, 4, "Tukemuth_OnDied")