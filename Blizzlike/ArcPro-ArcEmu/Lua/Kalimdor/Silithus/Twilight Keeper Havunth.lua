--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TwilightKeeperHavunth_OnCombat(Unit, Event)
	Unit:RegisterEvent("TwilightKeeperHavunth_FireBlast", 6000, 0)
	Unit:RegisterEvent("TwilightKeeperHavunth_FireNova", 8000, 0)
end

function TwilightKeeperHavunth_FireBlast(Unit, Event) 
	Unit:FullCastSpellOnTarget(13339, Unit:GetMainTank()) 
end

function TwilightKeeperHavunth_FireNova(Unit, Event) 
	Unit:CastSpell(17366) 
end

function TwilightKeeperHavunth_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TwilightKeeperHavunth_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11804, 1, "TwilightKeeperHavunth_OnCombat")
RegisterUnitEvent(11804, 2, "TwilightKeeperHavunth_OnLeaveCombat")
RegisterUnitEvent(11804, 4, "TwilightKeeperHavunth_OnDied")