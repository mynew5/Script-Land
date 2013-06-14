--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Anacondra_OnCombat(Unit, Event)
	Unit:SendChatMessage(14, 0, "None can stand against the serpent lords!")
	Unit:RegisterEvent("Lighting", 7000, 0)
	Unit:RegisterEvent("Healing", 14000, 0)
	Unit:RegisterEvent("Sleep", 21000, 0)
	Unit:RegisterEvent("Thorns", 28000, 0)
end

function Lighting(Unit, Event) 
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank()) 
end

function Healing(Unit, Event) 
	Unit:CastSpell(5187) 
end

function Sleep(Unit, Event) 
	Unit:FullCastSpellOnTarget(700, Unit:GetMainTank()) 
end

function Thorns(Unit, Event) 
	Unit:CastSpellOnTarget(8148, Unit:GetMainTank()) 
end

function Anacondra_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Anacondra_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3671, 1, "Anacondra_OnCombat")
RegisterUnitEvent(3671, 2, "Anacondra_OnLeaveCombat")
RegisterUnitEvent(3671, 4, "Anacondra_OnDied")