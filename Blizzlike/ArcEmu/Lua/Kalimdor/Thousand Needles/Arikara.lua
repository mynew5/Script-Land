--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Arikara_OnCombat(Unit, Event)
	Unit:RegisterEvent("Arikara_CurseofVengeance", 10000, 3)
	Unit:RegisterEvent("Arikara_Enrage", 120000, 0)
end

function Arikara_CurseofVengeance(Unit, Event) 
	Unit:FullCastSpellOnTarget(17213, Unit:GetMainTank()) 
end

function Arikara_Enrage(Unit, Event)
	if(Unit:GetHealthPct() < 25) then
		Unit:CastSpell(8599) 
	end
end

function Arikara_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Arikara_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10882, 1, "Arikara_OnCombat")
RegisterUnitEvent(10882, 2, "Arikara_OnLeaveCombat")
RegisterUnitEvent(10882, 4, "Arikara_OnDied")