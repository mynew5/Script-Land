--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ScaleswornElite_OnCombat(Unit, Event)
	Unit:RegisterEvent("ScaleswornElite_ArcaneSurge", 15000, 0)
	Unit:RegisterEvent("ScaleswornElite_IceShard", 10000, 0)
end

function ScaleswornElite_ArcaneSurge(Unit, Event) 
	Unit:FullCastSpellOnTarget(61272, Unit:GetMainTank()) 
end

function ScaleswornElite_IceShard(Unit, Event) 
	Unit:FullCastSpellOnTarget(61269, Unit:GetMainTank()) 
end

function ScaleswornElite_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ScaleswornElite_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(32534, 1, "ScaleswornElite_OnCombat")
RegisterUnitEvent(32534, 2, "ScaleswornElite_OnLeaveCombat")
RegisterUnitEvent(32534, 4, "ScaleswornElite_OnDied")