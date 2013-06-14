--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CaptainIskandar_OnCombat(Unit, Event)
	Unit:RegisterEvent("CaptainIskandar_Cleave", 6000, 0)
	Unit:RegisterEvent("CaptainIskandar_MortalStrike", 8000, 0)
	Unit:RegisterEvent("CaptainIskandar_Whirlwind", 7000, 0)
end

function CaptainIskandar_Cleave(Unit, Event) 
	Unit:CastSpell(42724) 
end

function CaptainIskandar_MortalStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(15708, Unit:GetMainTank()) 
end

function CaptainIskandar_Whirlwind(Unit, Event) 
	Unit:CastSpell(38619) 
end

function CaptainIskandar_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CaptainIskandar_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27657, 1, "CaptainIskandar_OnCombat")
RegisterUnitEvent(27657, 2, "CaptainIskandar_OnLeaveCombat")
RegisterUnitEvent(27657, 4, "CaptainIskandar_OnDied")