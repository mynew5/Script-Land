--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function NerubarCorpseHarvester_OnCombat(Unit, Event)
	Unit:RegisterEvent("NerubarCorpseHarvester_VenomSpit", 8000, 0)
end

function NerubarCorpseHarvester_VenomSpit(Unit, Event) 
	Unit:FullCastSpellOnTarget(45577, Unit:GetMainTank()) 
end

function NerubarCorpseHarvester_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function NerubarCorpseHarvester_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25445, 1, "NerubarCorpseHarvester_OnCombat")
RegisterUnitEvent(25445, 2, "NerubarCorpseHarvester_OnLeaveCombat")
RegisterUnitEvent(25445, 4, "NerubarCorpseHarvester_OnDied")