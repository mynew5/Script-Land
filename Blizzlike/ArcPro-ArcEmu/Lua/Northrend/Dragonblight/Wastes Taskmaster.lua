--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WastesTaskmaster_OnCombat(Unit, Event)
	Unit:RegisterEvent("WastesTaskmaster_ShadowNova", 5000, 0)
	Unit:RegisterEvent("WastesTaskmaster_ShadowShock", 6000, 0)
end

function WastesTaskmaster_ShadowNova(Unit, Event) 
	Unit:CastSpell(32712) 
end

function WastesTaskmaster_ShadowShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(16583, Unit:GetMainTank()) 
end

function WastesTaskmaster_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WastesTaskmaster_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26493, 1, "WastesTaskmaster_OnCombat")
RegisterUnitEvent(26493, 2, "WastesTaskmaster_OnLeaveCombat")
RegisterUnitEvent(26493, 4, "WastesTaskmaster_OnDied")