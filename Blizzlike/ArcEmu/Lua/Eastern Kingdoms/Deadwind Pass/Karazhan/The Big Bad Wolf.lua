--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--[[The Big Bad Wolf yells: Mmmm... delicious.
The Big Bad Wolf yells: Run away little girl, run away!
The Big Bad Wolf yells: The better to own you with!]]

function Wolf_Burning_Terrifying_Howl(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(8715, Unit:GetClosestPlayer())
end

function Wolf_Wide_Swipe(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(6749, Unit:GetClosestPlayer())
end

function Wolf_Riding_Hood(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30756, Unit:GetRandomPlayer())
end

function Wolf_OnCombat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Wolf_Burning_Terrifying_Howl", 25000, 0)
	Unit:RegisterEvent("Wolf_Wide_Swipe", 27000, 0)
	Unit:RegisterEvent("Wolf_Riding_Hood", 35000, 0)
end

function Wolf_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Wolf_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(17521, 1, "Wolf_OnCombat")
RegisterUnitEvent(17521, 2, "Wolf_OnLeaveCombat")
RegisterUnitEvent(17521, 4, "Wolf_OnDeath")