--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--[[Maiden of Virtue yells: Cast out your corrupt thoughts.
Maiden of Virtue yells: Death comes. Will your conscience be clear?
Maiden of Virtue yells: This is for the best.
Maiden of Virtue yells: Your behavior will not be tolerated.
Maiden of Virtue yells: Your impurity must be cleansed.]]

function Maiden_Holy_Fire(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(29522, Unit:GetRandomPlayer())
end

function Maiden_Holy_Wrath(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(32445, Unit:GetClosestPlayer())
end

function Maiden_Repentance(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(29511, Unit:GetClosestPlayer())
end

function Maiden_Holy_Ground(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(29512, Unit:GetClosestPlayer())
end

function Maiden(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Maiden_Holy_Fire", 15000, 0)
	Unit:RegisterEvent("Maiden_Holy_Wrath", 20000, 0)
	Unit:RegisterEvent("Maiden_Repentance", 25000, 0)
	Unit:RegisterEvent("Maiden_Holy_Ground", 30000, 0)
end

function Maiden_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Maiden_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(16457, 2, "Maiden_OnLeaveCombat")
RegisterUnitEvent(16457, 4, "Maiden_OnDeath")
RegisterUnitEvent(16457, 1, "Maiden")