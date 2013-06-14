--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function VenomspiteDeathguard_OnCombat(Unit, Event)
	Unit:RegisterEvent("VenomspiteDeathguard_Revenge", 5000, 0)
	Unit:RegisterEvent("VenomspiteDeathguard_ShieldBlock", 6000, 0)
end

function VenomspiteDeathguard_Revenge(Unit, Event) 
	Unit:FullCastSpellOnTarget(12170, Unit:GetMainTank()) 
end

function VenomspiteDeathguard_ShieldBlock(Unit, Event) 
	Unit:CastSpell(12169) 
end

function VenomspiteDeathguard_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function VenomspiteDeathguard_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27035, 1, "VenomspiteDeathguard_OnCombat")
RegisterUnitEvent(27035, 2, "VenomspiteDeathguard_OnLeaveCombat")
RegisterUnitEvent(27035, 4, "VenomspiteDeathguard_OnDied")