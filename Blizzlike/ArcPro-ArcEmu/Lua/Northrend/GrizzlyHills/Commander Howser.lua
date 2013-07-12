--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CommanderHowser_OnCombat(Unit, Event)
	Unit:RegisterEvent("CommanderHowser_BerserkerCharge", 6000, 0)
	Unit:RegisterEvent("CommanderHowser_Whirlwind", 8000, 0)
end

function CommanderHowser_BerserkerCharge(Unit, Event) 
	Unit:FullCastSpellOnTarget(16636, Unit:GetMainTank()) 
end

function CommanderHowser_Whirlwind(Unit, Event) 
	Unit:CastSpell(15589) 
end

function CommanderHowser_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CommanderHowser_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27759, 1, "CommanderHowser_OnCombat")
RegisterUnitEvent(27759, 2, "CommanderHowser_OnLeaveCombat")
RegisterUnitEvent(27759, 4, "CommanderHowser_OnDied")