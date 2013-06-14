--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Ramtusk_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "For Victory! For Agamaggan!")
--	pUnit:PlaySoundToSet()
	pUnit:RegisterEvent("Shout", 0, 0)
	pUnit:RegisterEvent("Stance", 7000, 0)
	pUnit:RegisterEvent("Clap", 14000, 0)
end
 
function Shout(pUnit, Event)
	pUnit:CastSpell(9128)
end
 
function Stance(pUnit, Event)
	pUnit:CastSpell(7165)
	pUnit:RegisterEvent("Stance", 7000, 0)
end
 
function Clap(pUnit, Event)
	pUnit:CastSpell(15548)
	pUnit:RegisterEvent("Clap", 14000, 0)
end
 
function Ramtusk_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function Ramtusk_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(4420, 1, "Ramtusk_OnCombat")
RegisterUnitEvent(4420, 2, "Ramtusk_OnLeaveCombat")
RegisterUnitEvent(4420, 4, "Ramtusk_OnDeath")