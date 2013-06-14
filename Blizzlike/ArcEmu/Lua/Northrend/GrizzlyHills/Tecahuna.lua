--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Tecahuna_OnCombat(Unit, Event)
	Unit:RegisterEvent("Tecahuna_TecahunaVenomSpit", 9000, 0)
end

function Tecahuna_TecahunaVenomSpit(Unit, Event) 
	Unit:FullCastSpellOnTarget(47629, Unit:GetMainTank()) 
end

function Tecahuna_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Tecahuna_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26865, 1, "Tecahuna_OnCombat")
RegisterUnitEvent(26865, 2, "Tecahuna_OnLeaveCombat")
RegisterUnitEvent(26865, 4, "Tecahuna_OnDied")