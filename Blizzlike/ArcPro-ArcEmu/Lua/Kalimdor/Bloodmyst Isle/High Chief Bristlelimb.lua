--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HighChiefBristlelimb_OnCombat(Unit, Event)
	Unit:RegisterEvent("HighChiefBristlelimb_DemoralizingRoar", 2000, 1)
	Unit:RegisterEvent("HighChiefBristlelimb_Maul", 6000, 0)
end

function HighChiefBristlelimb_DemoralizingRoar(pUnit, Event) 
	pUnit:CastSpell(20753) 
end

function HighChiefBristlelimb_Maul(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(15793, pUnit:GetMainTank()) 
end

function HighChiefBristlelimb_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HighChiefBristlelimb_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17702, 1, "HighChiefBristlelimb_OnCombat")
RegisterUnitEvent(17702, 2, "HighChiefBristlelimb_OnLeaveCombat")
RegisterUnitEvent(17702, 4, "HighChiefBristlelimb_OnDied")