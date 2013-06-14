--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function RottingForestRagerMinion_Summon(pUnit, Event)
	pUnit:CastSpell(39130)
end

function InfestedRootwalkerMinion_Summon(pUnit, Event)
	pUnit:CastSpell(39130)
end

RegisterUnitEvent(22307, 4, "RottingForestRagerMinion_Summon")
RegisterUnitEvent(22095, 4, "InfestedRootwalkerMinion_Summon") 