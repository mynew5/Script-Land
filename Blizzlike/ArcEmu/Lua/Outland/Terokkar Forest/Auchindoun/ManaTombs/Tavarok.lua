--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: DARKI, Hungary; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Tavarok_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Tavarok_Earthquake", 10000, 0)
	pUnit:RegisterEvent("Tavarok_Crystal_Poison", 13000, 0)
	pUnit:RegisterEvent("Tavarok_Smash", 13000, 0)
end

function Tavarok_Earthquake(pUnit, Event)
	pUnit:CastSpell(33919)
	pUnit:SendChatMessage(12, 0, "Do you feel my Earthquake...")
end

function Tavarok_Crystal_Poison(pUnit, Event)
	pUnit:FullCastSpellOnTarget(32361, Unit:GetRandomPlayer(0))
	pUnit:SendChatMessage(12, 0, "Some poison...")
end

function Tavarok_Smash(pUnit, Event) --Heroic Only
	pUnit:CastSpellOnTarget(38761, pUnit:GetClosestPlayer(0))
end

function Tavarok_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()	
end

function Tavarok_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(18343, 1, "Tavarok_OnCombat")
RegisterUnitEvent(18343, 2, "Tavarok_OnLeaveCombat")
RegisterUnitEvent(18343, 4, "Tavarok_OnDied")