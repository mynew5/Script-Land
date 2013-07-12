--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Electrocutioner_6000_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Electric justice!")
	pUnit:RegisterEvent("Chain_Bolt", 7000, 0)
	pUnit:RegisterEvent("Megavolt", 14000, 0)
	pUnit:RegisterEvent("Shock", 21000, 0)
end

function Chain_Bolt(pUnit, Event)
	pUnit:FullCastSpellOnTarget(11085)
end

function Megavolt(pUnit, Event)
	pUnit:FullCastSpellOnTarget(11082)
end

function Shock(pUnit, Event)
	pUnit:CastSpellOnTarget(11084)
end

function Electrocutioner_6000_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Electrocutioner_6000_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(6235, 1, "Electrocutioner_6000_OnCombat")
RegisterUnitEvent(6235, 2, "Electrocutioner_6000_OnLeaveCombat")
RegisterUnitEvent(6235, 4, "Electrocutioner_6000_OnDied")