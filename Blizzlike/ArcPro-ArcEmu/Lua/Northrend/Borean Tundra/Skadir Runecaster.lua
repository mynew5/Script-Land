--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SkadirRunecaster_OnCombat(Unit, Event)
	Unit:RegisterEvent("SkadirRunecaster_LightningBolt", 8000, 0)
	Unit:RegisterEvent("SkadirRunecaster_RuneofRetribution", 2000, 2)
end

function SkadirRunecaster_LightningBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank()) 
end

function SkadirRunecaster_RuneofRetribution(Unit, Event) 
	Unit:CastSpell(49871, Unit:GetMainTank()) 
end

function SkadirRunecaster_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SkadirRunecaster_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25520, 1, "SkadirRunecaster_OnCombat")
RegisterUnitEvent(25520, 2, "SkadirRunecaster_OnLeaveCombat")
RegisterUnitEvent(25520, 4, "SkadirRunecaster_OnDied")