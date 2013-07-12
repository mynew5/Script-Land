--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Theradras_OnCombat(Unit, Event)
	Unit:RegisterEvent("Boulder", 7000, 0)
	Unit:RegisterEvent("Dust", 14000, 0)
	Unit:RegisterEvent("Knock", 21000, 0)
	Unit:RegisterEvent("Gaze", 28000, 0)
	Unit:RegisterEvent("Thrash", 35000, 0)
end

function Boulder(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(21832, Unit:GetRandomPlayer()) 
end

function Dust(pUnit, Event) 
	pUnit:CastSpell(21909) 
end

function Knock(pUnit, Event) 
	pUnit:CastSpellOnTarget(22592, pUnit:GetMainTank()) 
end

function Gaze(pUnit, Event) 
	pUnit:CastSpellOnTarget(21869, pUnit:GetMainTank()) 
end

function Thrash(pUnit, Event) 
	pUnit:CastSpell(3391) 
end

function Theradras_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Theradras_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12201, 1, "Theradras_OnCombat")
RegisterUnitEvent(12201, 2, "Theradras_OnLeaveCombat")
RegisterUnitEvent(12201, 4, "Theradras_OnDied")