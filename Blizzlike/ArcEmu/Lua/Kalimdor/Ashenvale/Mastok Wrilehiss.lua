--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function MastokWrilehiss_OnCombat(Unit, Event)
	Unit:RegisterEvent("MastokWrilehiss_Cleave", 8000, 0)
	Unit:RegisterEvent("MastokWrilehiss_Enrage", 12000, 0)
	Unit:RegisterEvent("MastokWrilehiss_PiercingHowl", 10000, 0)
end

function MastokWrilehiss_Cleave(pUnit, Event) 
	pUnit:CastSpell(15284) 
end

function MastokWrilehiss_Enrage(pUnit, Event) 
	pUnit:CastSpell(8599) 
end

function MastokWrilehiss_PiercingHowl(pUnit, Event) 
	pUnit:CastSpell(23600) 
end

function MastokWrilehiss_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MastokWrilehiss_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12737, 1, "MastokWrilehiss_OnCombat")
RegisterUnitEvent(12737, 2, "MastokWrilehiss_OnLeaveCombat")
RegisterUnitEvent(12737, 4, "MastokWrilehiss_OnDied")