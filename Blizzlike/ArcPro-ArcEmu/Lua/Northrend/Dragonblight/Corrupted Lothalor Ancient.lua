--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CorruptedLothalorAncient_OnCombat(Unit, Event)
	Unit:RegisterEvent("CorruptedLothalorAncient_ArcaneDischarge", 6000, 0)
	Unit:RegisterEvent("CorruptedLothalorAncient_ArcaneExplosion", 5000, 0)
end

function CorruptedLothalorAncient_ArcaneDischarge(Unit, Event) 
	Unit:CastSpell(51727) 
end

function CorruptedLothalorAncient_ArcaneExplosion(Unit, Event) 
	Unit:CastSpell(51725) 
end

function CorruptedLothalorAncient_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CorruptedLothalorAncient_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26333, 1, "CorruptedLothalorAncient_OnCombat")
RegisterUnitEvent(26333, 2, "CorruptedLothalorAncient_OnLeaveCombat")
RegisterUnitEvent(26333, 4, "CorruptedLothalorAncient_OnDied")