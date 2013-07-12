--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[Warp Splinter yells: Children, come to me!
Warp Splinter yells: Maybe this is not-- No, we fight! Come to my aid!
Warp Splinter yells: So... confused. Do not... belong here.
Warp Splinter yells: What am I doing? Why do I...
Warp Splinter yells: Who disturbs this sanctuary?
Warp Splinter yells: You must die! But wait: this does not-- No, no... you must die!]]

function Splinter(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("Splinter_Heal", 1000, 1)
	Unit:RegisterEvent("Splinter_War_Stomp", 21000, 0)
	Unit:RegisterEvent("Splinter_Arcane_Volley", 31000, 0)
end

function Splinter_Heal(Unit)
	if((Unit:GetHealthPct() < 25) and (Didthat == 0)) then
		Unit:FullCastSpell(39321)
		Didthat = 1
	else
	end
end

function Splinter_War_Stomp(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(36835, Unit:GetClosestPlayer())
end

function Splinter_Arcane_Volley(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(29885, Unit:GetClosestPlayer())
end

RegisterUnitEvent(17977, 1, "Splinter")