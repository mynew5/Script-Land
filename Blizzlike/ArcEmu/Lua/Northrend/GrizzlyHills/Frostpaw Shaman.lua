--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function FrostpawShaman_OnCombat(Unit, Event)
	Unit:RegisterEvent("FrostpawShaman_ChainLightning", 6000, 0)
	Unit:RegisterEvent("FrostpawShaman_LesserHealingWave", 13000, 0)
end

function FrostpawShaman_ChainLightning(Unit, Event) 
	Unit:FullCastSpellOnTarget(12058, Unit:GetMainTank()) 
end

function FrostpawShaman_LesserHealingWave(Unit, Event) 
	Unit:CastSpell(25420) 
end

function FrostpawShaman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FrostpawShaman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26428, 1, "FrostpawShaman_OnCombat")
RegisterUnitEvent(26428, 2, "FrostpawShaman_OnLeaveCombat")
RegisterUnitEvent(26428, 4, "FrostpawShaman_OnDied")