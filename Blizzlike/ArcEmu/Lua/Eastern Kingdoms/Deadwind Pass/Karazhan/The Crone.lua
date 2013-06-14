--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--[[The Crone yells: How could you? What a cruel, cruel world...
The Crone yells: It will all be over soon!
The Crone yells: Woe to each and every one of you, my pretties!]]

function Crone_Summon_Cyclone(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(38337, Unit:GetRandomPlayer())
end

function Crone_Chain_Lightning(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(32337, Unit:GetClosestPlayer())
end

function Crone_OnCombat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Crone_Summon_Cyclone", 10000, 0)
	Unit:RegisterEvent("Crone_Chain_Lightning", 17000, 0)
end

function Crone_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Crone_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(18168, 1, "Crone_OnCombat")
RegisterUnitEvent(18168, 2, "Crone_OnLeaveCombat")
RegisterUnitEvent(18168, 4, "Crone_OnDeath")