--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Arcanimus_OnCombat(Unit, Event)
	Unit:RegisterEvent("Arcanimus_ArcaneExplosion", 6000, 0)
end

function Arcanimus_ArcaneExplosion(Unit, Event) 
	Unit:CastSpell(51820) 
end

function Arcanimus_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Arcanimus_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26370, 1, "Arcanimus_OnCombat")
RegisterUnitEvent(26370, 2, "Arcanimus_OnLeaveCombat")
RegisterUnitEvent(26370, 4, "Arcanimus_OnDied")