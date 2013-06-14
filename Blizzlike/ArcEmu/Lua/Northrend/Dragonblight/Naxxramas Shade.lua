--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function NaxxramasShade_OnCombat(Unit, Event)
	Unit:RegisterEvent("NaxxramasShade_BlinkStrike", 6000, 0)
	Unit:RegisterEvent("NaxxramasShade_DarkStrike", 5500, 0)
end

function NaxxramasShade_BlinkStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(49961, Unit:GetMainTank()) 
end

function NaxxramasShade_DarkStrike(Unit, Event) 
	Unit:CastSpell(38926) 
end

function NaxxramasShade_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function NaxxramasShade_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27824, 1, "NaxxramasShade_OnCombat")
RegisterUnitEvent(27824, 2, "NaxxramasShade_OnLeaveCombat")
RegisterUnitEvent(27824, 4, "NaxxramasShade_OnDied")