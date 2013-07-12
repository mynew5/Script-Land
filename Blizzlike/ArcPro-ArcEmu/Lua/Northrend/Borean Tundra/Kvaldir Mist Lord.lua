--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function KvaldirMistLord_OnCombat(Unit, Event)
	Unit:RegisterEvent("KvaldirMistLord_WaveCrash", 8000, 0)
end

function KvaldirMistLord_WaveCrash(Unit, Event) 
	Unit:FullCastSpellOnTarget(49922, Unit:GetMainTank()) 
end

function KvaldirMistLord_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KvaldirMistLord_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25496, 1, "KvaldirMistLord_OnCombat")
RegisterUnitEvent(25496, 2, "KvaldirMistLord_OnLeaveCombat")
RegisterUnitEvent(25496, 4, "KvaldirMistLord_OnDied")