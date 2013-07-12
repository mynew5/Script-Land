--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WarsongMarksman_OnCombat(Unit, Event)
	Unit:RegisterEvent("WarsongMarksman_Enrage", 8000, 0)
	Unit:RegisterEvent("WarsongMarksman_Shoot", 6000, 0)
end

function WarsongMarksman_Enrage(Unit, Event) 
	Unit:CastSpell(8599) 
end

function WarsongMarksman_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(45578, Unit:GetMainTank()) 
end

function WarsongMarksman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WarsongMarksman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25244, 1, "WarsongMarksman_OnCombat")
RegisterUnitEvent(25244, 2, "WarsongMarksman_OnLeaveCombat")
RegisterUnitEvent(25244, 4, "WarsongMarksman_OnDied")