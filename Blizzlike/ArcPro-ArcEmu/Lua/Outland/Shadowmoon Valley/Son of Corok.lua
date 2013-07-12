--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SonOfCorok_OnEnterCombat(Unit,Event)
	Unit:FullCastSpellOnTarget(12612, Unit:GetClosestPlayer())
	Unit:RegisterEvent("SonOfCorok_Stomp", 15000, 0)
end

function SonOfCorok_Stomp(Unit,Event)
	Unit:FullCastSpellOnTarget(12612, Unit:GetClosestPlayer())
end

function SonOfCorok_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function SonOfCorok_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19824, 1, "SonOfCorok_OnEnterCombat")
RegisterUnitEvent(19824, 2, "SonOfCorok_OnLeaveCombat")
RegisterUnitEvent(19824, 4, "SonOfCorok_OnDied")