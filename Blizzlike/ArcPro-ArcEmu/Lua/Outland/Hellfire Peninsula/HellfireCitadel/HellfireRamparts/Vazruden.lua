--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[The actual boss loot can be found inside a http://www.wowhead.com/object=185168, which spawns as soon as both Vazruden and Nazan have been defeated.
Vazruden yells: Is there no one left to test me?
Vazruden yells: It is over! Finished!
Vazruden yells: My lord will be... the end of you all!
Vazruden yells: You are nothing! I answer a higher call....
Vazruden yells: Your time is running out!]]

function Vazruden(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("Vazruden_Hamstring", 9000, 0)
	Unit:RegisterEvent("Vazruden_Stun", 13000, 0)
	Unit:RegisterEvent("Vazruden_Revenge", 17000, 0)
	Unit:RegisterEvent("Vazruden_Knockback", 25000, 0)
end

function Vazruden_Hamstring(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(26141, Unit:GetClosestPlayer())
end

function Vazruden_Stun(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(20170, Unit:GetClosestPlayer())
end

function Vazruden_Revenge(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(11603, Unit:GetClosestPlayer())
end

function Vazruden_Knockback(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(30056, Unit:GetClosestPlayer())
end

RegisterUnitEvent(17537,1,"Vazruden")