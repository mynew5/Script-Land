--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[Talen says: <name>, I am in need of your help once again.
Talen says: These statuettes must hold a hidden compartment....
Talen says: They're locked! NO!!]]

function Talen_onSpawn (pUnit, Event)
	pUnit:Emote(13)
end

function Talen_onCombat (pUnit, Event)
	pUnit:Emote(26)
end

RegisterUnitEvent(3846, 1, "Talen_onCombat")
RegisterUnitEvent(3846, 6, "Talen_onSpawn")