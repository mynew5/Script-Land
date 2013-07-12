--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function JanelaStouthammer_OnCombat(Unit, Event)
	Unit:RegisterEvent("JanelaStouthammer_CrusaderStrike", 8000, 0)
	Unit:RegisterEvent("JanelaStouthammer_HolyLight", 12000, 0)
end

function JanelaStouthammer_CrusaderStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(14518, Unit:GetMainTank()) 
end

function JanelaStouthammer_HolyLight(Unit, Event) 
	Unit:CastSpell(25263) 
end

function JanelaStouthammer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function JanelaStouthammer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15443, 1, "JanelaStouthammer_OnCombat")
RegisterUnitEvent(15443, 2, "JanelaStouthammer_OnLeaveCombat")
RegisterUnitEvent(15443, 4, "JanelaStouthammer_OnDied")