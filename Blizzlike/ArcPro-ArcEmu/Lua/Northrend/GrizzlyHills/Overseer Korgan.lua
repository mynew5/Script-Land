--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function OverseerKorgan_OnCombat(Unit, Event)
	Unit:RegisterEvent("OverseerKorgan_CallLightning", 6000, 0)
	Unit:RegisterEvent("OverseerKorgan_RevitalizingRune", 10000, 0)
end

function OverseerKorgan_CallLightning(Unit, Event) 
	Unit:FullCastSpellOnTarget(32018, Unit:GetMainTank()) 
end

function OverseerKorgan_RevitalizingRune(Unit, Event) 
	Unit:CastSpell(52714) 
end

function OverseerKorgan_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function OverseerKorgan_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26921, 1, "OverseerKorgan_OnCombat")
RegisterUnitEvent(26921, 2, "OverseerKorgan_OnLeaveCombat")
RegisterUnitEvent(26921, 4, "OverseerKorgan_OnDied")