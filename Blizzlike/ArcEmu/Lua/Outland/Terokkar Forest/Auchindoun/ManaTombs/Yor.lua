--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: DARKI; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Yor_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Yor_Fire", 10000, 0)
	pUnit:RegisterEvent("Yor_stomp", 13000, 0)
end

function Yor_Fire(pUnit, Event)
	pUnit:FullCastSpellOnTarget(38361, Unit:GetClosestPlayer(0))
end

function Yor_stomp(pUnit, Event)
	pUnit:CastSpell(36405)
end

function Yor_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()	
end

function Yor_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(22930, 1, "Yor_OnCombat")
RegisterUnitEvent(22930, 2, "Yor_OnLeaveCombat")
RegisterUnitEvent(22930, 3, "Yor_OnDied")