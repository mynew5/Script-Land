--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function LandingCrawler_OnCombat(Unit, Event)
	Unit:RegisterEvent("LandingCrawler_ClawGrasp", 10000, 0)
end

function LandingCrawler_ClawGrasp(Unit, Event) 
	Unit:FullCastSpellOnTarget(49978, Unit:GetMainTank()) 
end

function LandingCrawler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LandingCrawler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25481, 1, "LandingCrawler_OnCombat")
RegisterUnitEvent(25481, 2, "LandingCrawler_OnLeaveCombat")
RegisterUnitEvent(25481, 4, "LandingCrawler_OnDied")