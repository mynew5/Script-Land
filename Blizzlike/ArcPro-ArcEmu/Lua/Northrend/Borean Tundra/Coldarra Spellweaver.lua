--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ColdarraSpellweaver_OnCombat(Unit, Event)
	Unit:RegisterEvent("ColdarraSpellweaver_ArcaneMissiles", 8000, 0)
end

function ColdarraSpellweaver_ArcaneMissiles(Unit, Event) 
	Unit:FullCastSpellOnTarget(34447, Unit:GetMainTank()) 
end

function ColdarraSpellweaver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ColdarraSpellweaver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25722, 1, "ColdarraSpellweaver_OnCombat")
RegisterUnitEvent(25722, 2, "ColdarraSpellweaver_OnLeaveCombat")
RegisterUnitEvent(25722, 4, "ColdarraSpellweaver_OnDied")