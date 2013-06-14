--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Grocklar_OnCombat(Unit, Event)
	Unit:RegisterEvent("Grocklar_StoneFist", 3000, 1)
	Unit:RegisterEvent("Grocklar_StoneStomp", 8000, 0)
end

function Grocklar_StoneFist(Unit, Event) 
	Unit:CastSpell(49676) 
end

function Grocklar_StoneStomp(Unit, Event) 
	Unit:FullCastSpellOnTarget(49675, Unit:GetMainTank()) 
end

function Grocklar_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Grocklar_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(32422, 1, "Grocklar_OnCombat")
RegisterUnitEvent(32422, 2, "Grocklar_OnLeaveCombat")
RegisterUnitEvent(32422, 4, "Grocklar_OnDied")