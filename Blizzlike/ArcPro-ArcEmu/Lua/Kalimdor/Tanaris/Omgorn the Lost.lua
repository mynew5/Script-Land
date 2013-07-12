--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function OmgorntheLost_OnCombat(Unit, Event)
	Unit:RegisterEvent("OmgorntheLost_MortalStrike", 6000, 0)
	Unit:RegisterEvent("OmgorntheLost_Enrage", 12000, 0)
end

function OmgorntheLost_MortalStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(16856, Unit:GetMainTank()) 
end

function OmgorntheLost_Enrage(Unit, Event)
	if(Unit:GetHealthPct() < 25)then
		Unit:CastSpell(8599) 
	end
end

function OmgorntheLost_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function OmgorntheLost_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(8201, 1, "OmgorntheLost_OnCombat")
RegisterUnitEvent(8201, 2, "OmgorntheLost_OnLeaveCombat")
RegisterUnitEvent(8201, 4, "OmgorntheLost_OnDied")