--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function InjuredWarsongMage_OnCombat(Unit, Event)
	Unit:RegisterEvent("InjuredWarsongMage_ArcaneExplosion", 6000, 0)
	Unit:RegisterEvent("InjuredWarsongMage_Blizzard", 10000, 0)
	Unit:RegisterEvent("InjuredWarsongMage_Pyroblast", 11000, 0)
end

function InjuredWarsongMage_ArcaneExplosion(Unit, Event) 
	Unit:CastSpell(34933) 
end

function InjuredWarsongMage_Blizzard(Unit, Event) 
	Unit:CastSpell(46195) 
end

function InjuredWarsongMage_Pyroblast(Unit, Event) 
	Unit:FullCastSpellOnTarget(17274, Unit:GetMainTank()) 
end

function InjuredWarsongMage_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function InjuredWarsongMage_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27107, 1, "InjuredWarsongMage_OnCombat")
RegisterUnitEvent(27107, 2, "InjuredWarsongMage_OnLeaveCombat")
RegisterUnitEvent(27107, 4, "InjuredWarsongMage_OnDied")