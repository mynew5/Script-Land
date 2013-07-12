--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function InquisitorCaleras_OnCombat(Unit, Event)
	Unit:RegisterEvent("InquisitorCaleras_FrostNova", 10000, 0)
	Unit:RegisterEvent("InquisitorCaleras_Frostbolt", 8000, 0)
end

function InquisitorCaleras_FrostNova(Unit, Event) 
	Unit:CastSpell(32192) 
end

function InquisitorCaleras_Frostbolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(15043, Unit:GetMainTank()) 
end

function InquisitorCaleras_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function InquisitorCaleras_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25720, 1, "InquisitorCaleras_OnCombat")
RegisterUnitEvent(25720, 2, "InquisitorCaleras_OnLeaveCombat")
RegisterUnitEvent(25720, 4, "InquisitorCaleras_OnDied")