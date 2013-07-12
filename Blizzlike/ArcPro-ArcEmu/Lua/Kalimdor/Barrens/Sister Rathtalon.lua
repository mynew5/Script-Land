--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SisterRathtalon_OnCombat(Unit, Event)
	Unit:RegisterEvent("SisterRathtalon_EnvelopingWinds", 10000, 0)
	Unit:RegisterEvent("SisterRathtalon_GustofWind", 14000, 0)
	Unit:RegisterEvent("SisterRathtalon_LightningCloud", 3000, 1)
end

function SisterRathtalon_EnvelopingWinds(Unit, Event) 
	Unit:FullCastSpellOnTarget(6728, Unit:GetMainTank()) 
end

function SisterRathtalon_GustofWind(Unit, Event) 
	Unit:CastSpell(6982) 
end

function SisterRathtalon_LightningCloud(Unit, Event) 
	Unit:CastSpell(6535) 
end

function SisterRathtalon_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SisterRathtalon_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5830, 1, "SisterRathtalon_OnCombat")
RegisterUnitEvent(5830, 2, "SisterRathtalon_OnLeaveCombat")
RegisterUnitEvent(5830, 4, "SisterRathtalon_OnDied")