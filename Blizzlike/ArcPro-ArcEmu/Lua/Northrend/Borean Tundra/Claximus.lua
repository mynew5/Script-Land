--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Claximus_OnCombat(Unit, Event)
	Unit:RegisterEvent("Claximus_ArcaneBarrage", 8000, 0)
	Unit:RegisterEvent("Claximus_StabilizedMagic", 2000, 1)
end

function Claximus_ArcaneBarrage(Unit, Event) 
	Unit:FullCastSpellOnTarget(50273, Unit:GetMainTank()) 
end

function Claximus_StabilizedMagic(Unit, Event) 
	Unit:CastSpell(50275) 
end

function Claximus_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Claximus_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25209, 1, "Claximus_OnCombat")
RegisterUnitEvent(25209, 2, "Claximus_OnLeaveCombat")
RegisterUnitEvent(25209, 4, "Claximus_OnDied")