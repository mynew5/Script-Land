--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SinoktheShadowrager_OnCombat(Unit, Event)
	Unit:RegisterEvent("SinoktheShadowrager_BlinkStrike", 6000, 0)
	Unit:RegisterEvent("SinoktheShadowrager_RagingShadows", 8000, 0)
end

function SinoktheShadowrager_BlinkStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(49961, Unit:GetMainTank()) 
end

function SinoktheShadowrager_RagingShadows(Unit, Event) 
	Unit:CastSpell(51622) 
end

function SinoktheShadowrager_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SinoktheShadowrager_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26771, 1, "SinoktheShadowrager_OnCombat")
RegisterUnitEvent(26771, 2, "SinoktheShadowrager_OnLeaveCombat")
RegisterUnitEvent(26771, 4, "SinoktheShadowrager_OnDied")