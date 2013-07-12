--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: Moon++
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function SunbladeKeeper_OnCombat(Unit, Event)
	Unit:RegisterAIUpdateEvent(6000)
end

function SunbladeKeeper_ShadowBolt(Unit, Event)
	if(Unit:GetRandomPlayer(7)) then
		Unit:FullCastSpellOnTarget(15232, Unit:GetRandomPlayer(7))
	end
end

function SunbladeKeeper_LeaveCombat(Unit, Event)
	Unit:RegisterAIUpdateEvent()
end

function SunbladeKeeper_Died(Unit, Event)
	Unit:RegisterAIUpdateEvent()
end

RegisterUnitEvent(24762, 1, "SunbladeKeeper_OnCombat")
RegisterUnitEvent(24762, 21, "SunbladeKeeper_ShadowBolt")
RegisterUnitEvent(24762, 2, "SunbladeKeeper_LeaveCombat")
RegisterUnitEvent(24762, 4, "SunbladeKeeper_Died")