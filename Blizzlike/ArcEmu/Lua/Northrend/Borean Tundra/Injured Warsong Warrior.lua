--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function InjuredWarsongWarrior_OnCombat(Unit, Event)
	Unit:RegisterEvent("InjuredWarsongWarrior_Cleave", 6000, 0)
	Unit:RegisterEvent("InjuredWarsongWarrior_HeroicStrike", 7000, 0)
end

function InjuredWarsongWarrior_Cleave(Unit, Event) 
	Unit:CastSpell(39047) 
end

function InjuredWarsongWarrior_HeroicStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(45026, Unit:GetMainTank()) 
end

function InjuredWarsongWarrior_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function InjuredWarsongWarrior_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27106, 1, "InjuredWarsongWarrior_OnCombat")
RegisterUnitEvent(27106, 2, "InjuredWarsongWarrior_OnLeaveCombat")
RegisterUnitEvent(27106, 4, "InjuredWarsongWarrior_OnDied")