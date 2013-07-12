--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TheDukeofCynders_OnCombat(Unit, Event)
	Unit:RegisterEvent("TheDukeofCynders_BlastWave", 8000, 0)
	Unit:RegisterEvent("TheDukeofCynders_FireBlast", 6000, 0)
	Unit:RegisterEvent("TheDukeofCynders_Flamestrike", 2000, 2)
end

function TheDukeofCynders_BlastWave(Unit, Event) 
	Unit:CastSpell(22424) 
end

function TheDukeofCynders_FireBlast(Unit, Event) 
	Unit:FullCastSpellOnTarget(25028, Unit:GetMainTank()) 
end

function TheDukeofCynders_Flamestrike(Unit, Event) 
	Unit:CastSpell(18399) 
end

function TheDukeofCynders_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TheDukeofCynders_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15206, 1, "TheDukeofCynders_OnCombat")
RegisterUnitEvent(15206, 2, "TheDukeofCynders_OnLeaveCombat")
RegisterUnitEvent(15206, 4, "TheDukeofCynders_OnDied")