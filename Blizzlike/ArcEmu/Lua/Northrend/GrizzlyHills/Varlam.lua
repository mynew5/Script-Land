--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Varlam_OnCombat(Unit, Event)
	Unit:RegisterEvent("Varlam_Cleave", 9000, 0)
	Unit:RegisterEvent("Varlam_MortalStrike", 7000, 0)
end

function Varlam_Cleave(Unit, Event) 
	Unit:CastSpell(15496) 
end

function Varlam_MortalStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(32736, Unit:GetMainTank()) 
end

function Varlam_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Varlam_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27579, 1, "Varlam_OnCombat")
RegisterUnitEvent(27579, 2, "Varlam_OnLeaveCombat")
RegisterUnitEvent(27579, 4, "Varlam_OnDied")