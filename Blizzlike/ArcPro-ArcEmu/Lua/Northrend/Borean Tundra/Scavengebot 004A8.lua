--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Scavengebot004A8_OnCombat(Unit, Event)
	Unit:RegisterEvent("Scavengebot004A8_CuttingLaser", 7000, 0)
end

function Scavengebot004A8_CuttingLaser(Unit, Event) 
	Unit:FullCastSpellOnTarget(49945, Unit:GetMainTank()) 
end

function Scavengebot004A8_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Scavengebot004A8_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25752, 1, "Scavengebot004A8_OnCombat")
RegisterUnitEvent(25752, 2, "Scavengebot004A8_OnLeaveCombat")
RegisterUnitEvent(25752, 4, "Scavengebot004A8_OnDied")