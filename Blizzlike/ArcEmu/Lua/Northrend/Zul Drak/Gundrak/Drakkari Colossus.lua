--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: DARKI; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DrakkariColossus_OnCombat(Unit, Event)
	Unit:SendChatMessage(14, 0, "You will die!")
	Unit:RegisterEvent("DrakkariColossus_Emerge",10000, 0)
	Unit:RegisterEvent("DrakkariColossus_MightyBlow",25000, 0)
end

function DrakkariColossus_Emerge(pUnit, Event)
	pUnit:CastSpellOnTarget(54850, pUnit:GetRandomPlayer(0))
end

function DrakkariColossus_MightyBlow(pUnit, Event)
	pUnit:FullCastSpellOnTarget(54719, pUnit:GetRandomPlayer(0))
end

function DrakkariColossus_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents() 
end

function DrakkariColossus_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(29307, 1, "DrakkariColossus_OnCombat")
RegisterUnitEvent(29307, 2, "DrakkariColossus_OnLeaveCombat")
RegisterUnitEvent(29307, 4, "DrakkariColossus_OnDied")