--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[Zereketh the Unbound yells: Darkness... consumes all.
Zereketh the Unbound yells: Life energy to... consume.
Zereketh the Unbound yells: No... more... life.
Zereketh the Unbound yells: The shadow... will engulf you.
Zereketh the Unbound yells: The Void... beckons.
Zereketh the Unbound yells: This vessel is empty.]]

function Zereketh(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("Zereketh_Void_Zone", 10000, 0)
	Unit:RegisterEvent("Zereketh_Corruption", 15000, 0)
	Unit:RegisterEvent("Zereketh_Shadow_Nova", 23000, 0)
end

function Zereketh_Void_Zone(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(30533, Unit:GetRandomPlayer())
end

function Zereketh_Corruption(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(32863, Unit:GetRandomPlayer())
end

function Zereketh_Shadow_Nova(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(36127, Unit:GetClosestPlayer())
end

RegisterUnitEvent(20870, 1, "Zereketh")