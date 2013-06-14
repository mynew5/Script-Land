--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Ascendscripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function KorgreshColdrage_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("FrostNova", 25000, 0)
	Unit:RegisterEvent("TrelanesFreezingTouch", 45000, 0)
end

function FrostNova(Unit, Event)
	Unit:FullCastSpellOnTarget(865, Unit:GetMainTank())
end

function TrelanesFreezingTouch(Unit, Event)
	Unit:FullCastSpellOnTarget(4320, Unit:GetMainTank())
end

function KorgreshColdrage_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function KorgreshColdrage_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2793, 1, "KorgreshColdrage_OnEnterCombat")
RegisterUnitEvent(2793, 2, "KorgreshColdrage_OnLeaveCombat")
RegisterUnitEvent(2793, 4, "KorgreshColdrage_OnDied")