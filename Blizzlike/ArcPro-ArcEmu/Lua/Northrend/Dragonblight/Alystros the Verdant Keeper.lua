--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AlystrostheVerdantKeeper_OnCombat(Unit, Event)
	Unit:RegisterEvent("AlystrostheVerdantKeeper_LapsingDream", 1000, 1)
	Unit:RegisterEvent("AlystrostheVerdantKeeper_TalonStrike", 5000, 0)
	Unit:RegisterEvent("AlystrostheVerdantKeeper_WingBeat", 8000, 0)
end

function AlystrostheVerdantKeeper_LapsingDream(Unit, Event) 
	Unit:FullCastSpellOnTarget(51922, Unit:GetMainTank()) 
end

function AlystrostheVerdantKeeper_TalonStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(51937, Unit:GetMainTank()) 
end

function AlystrostheVerdantKeeper_WingBeat(Unit, Event) 
	Unit:CastSpell(51938) 
end

function AlystrostheVerdantKeeper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AlystrostheVerdantKeeper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27249, 1, "AlystrostheVerdantKeeper_OnCombat")
RegisterUnitEvent(27249, 2, "AlystrostheVerdantKeeper_OnLeaveCombat")
RegisterUnitEvent(27249, 4, "AlystrostheVerdantKeeper_OnDied")