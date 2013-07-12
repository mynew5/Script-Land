--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GlimmerBayOrca_OnCombat(Unit, Event)
	Unit:RegisterEvent("GlimmerBayOrca_FlipperThwack", 8000, 0)
end

function GlimmerBayOrca_FlipperThwack(Unit, Event) 
	Unit:FullCastSpellOnTarget(50169, Unit:GetMainTank()) 
end

function GlimmerBayOrca_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GlimmerBayOrca_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25204, 1, "GlimmerBayOrca_OnCombat")
RegisterUnitEvent(25204, 2, "GlimmerBayOrca_OnLeaveCombat")
RegisterUnitEvent(25204, 4, "GlimmerBayOrca_OnDied")