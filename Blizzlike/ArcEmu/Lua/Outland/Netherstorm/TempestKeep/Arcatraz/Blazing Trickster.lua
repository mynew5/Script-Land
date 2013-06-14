--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[Blazing Trickster yells: I hope you all... die in pain!
Blazing Trickster yells: I'm gonna cook ya, an' then I'm gonna eat ya!]]

function Trickster(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("Trickster_FireBolt", 10000, 0)
	Unit:RegisterEvent("Trickster_FireShield", 15000, 0)
	Unit:RegisterEvent("Trickster_Charge", 21000, 0)
end

function Trickster_FireBoltt(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(36906, Unit:GetClosestPlayer())
end

function Trickster_FireShield(Unit)
	Unit:FullCastSpell(36907)
end

function Trickster_Charge(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(36058, Unit:GetClosestPlayer())
end

RegisterUnitEvent(20905, 1, "Trickster")