--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HighGeneralAbbendis_OnCombat(Unit, Event)
	Unit:RegisterEvent("HighGeneralAbbendis_JudgementofOnslaught", 4000, 1)
	Unit:RegisterEvent("HighGeneralAbbendis_RagingConsecration", 6000, 1)
	Unit:RegisterEvent("HighGeneralAbbendis_SealofOnslaught", 8000, 1)
end

function HighGeneralAbbendis_JudgementofOnslaught(Unit, Event) 
	Unit:CastSpell(50905) 
end

function HighGeneralAbbendis_RagingConsecration(Unit, Event) 
	Unit:CastSpell(50915) 
end

function HighGeneralAbbendis_SealofOnslaught(Unit, Event) 
	Unit:CastSpell(50908) 
end

function HighGeneralAbbendis_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HighGeneralAbbendis_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27210, 1, "HighGeneralAbbendis_OnCombat")
RegisterUnitEvent(27210, 2, "HighGeneralAbbendis_OnLeaveCombat")
RegisterUnitEvent(27210, 4, "HighGeneralAbbendis_OnDied")