--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function OnslaughtCommanderIustus_OnCombat(Unit, Event)
	Unit:RegisterEvent("OnslaughtCommanderIustus_Bloodthirst", 6000, 0)
	Unit:RegisterEvent("OnslaughtCommanderIustus_Whirlwind", 7000, 0)
end

function OnslaughtCommanderIustus_Bloodthirst(Unit, Event) 
	Unit:FullCastSpellOnTarget(35949, Unit:GetMainTank()) 
end

function OnslaughtCommanderIustus_Whirlwind(Unit, Event) 
	Unit:CastSpell(48281) 
end

function OnslaughtCommanderIustus_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function OnslaughtCommanderIustus_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27334, 1, "OnslaughtCommanderIustus_OnCombat")
RegisterUnitEvent(27334, 2, "OnslaughtCommanderIustus_OnLeaveCombat")
RegisterUnitEvent(27334, 4, "OnslaughtCommanderIustus_OnDied")