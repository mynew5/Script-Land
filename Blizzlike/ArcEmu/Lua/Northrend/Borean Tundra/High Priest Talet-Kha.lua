--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HighPriestTaletKha_OnCombat(Unit, Event)
	Unit:RegisterEvent("HighPriestTaletKha_MindBlast", 6000, 0)
	Unit:RegisterEvent("HighPriestTaletKha_Renew", 13000, 0)
end

function HighPriestTaletKha_MindBlast(Unit, Event) 
	Unit:FullCastSpellOnTarget(15587, Unit:GetMainTank()) 
end

function HighPriestTaletKha_Renew(Unit, Event) 
	Unit:CastSpell(11640) 
end

function HighPriestTaletKha_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HighPriestTaletKha_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26073, 1, "HighPriestTaletKha_OnCombat")
RegisterUnitEvent(26073, 2, "HighPriestTaletKha_OnLeaveCombat")
RegisterUnitEvent(26073, 4, "HighPriestTaletKha_OnDied")