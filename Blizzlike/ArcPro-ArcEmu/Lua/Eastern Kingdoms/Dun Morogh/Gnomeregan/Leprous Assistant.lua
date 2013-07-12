--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function radioactive_ea_OnCombat(pUnit, Event)
local chance = math.random(1,4)
	if(chance == 1) then
		pUnit:SendChatMessage(12, 0, "A foul trogg if ever I saw one. Die!")
	elseif(chance == 2) then
		pUnit:SendChatMessage(12, 0, "No gnome will be left behind")
	elseif(chance == 3) then
		pUnit:SendChatMessage(12, 0, "The troggs...they never stop coming. Die trogg! Die!")
	elseif(chance == 4) then
		pUnit:SendChatMessage(12, 0, "This sickness clouds my vision, but I know you must be a trogg. Die foul invader!")
	end
	pUnit:RegisterEvent("Net", 7000, 0)
	pUnit:RegisterEvent("Ice_Blast", 14000, 0)
	pUnit:RegisterEvent("Dazed", 21000, 1)
end

function Net(pUnit, Event)
	pUnit:CastSpellOnTarget(12024, pUnit:GetRandomPlayer(0))
end

function Ice_Blast(pUnit, Event)
	pUnit:CastSpellOnTarget(11264, pUnit:GetRandomPlayer(0))
end 

function Dazed(pUnit, Event)
	pUnit:CastSpell(1604)
end

function radioactive_ea_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function radioactive_ea_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(7603, 1, "radioactive_ea_OnCombat")
RegisterUnitEvent(7603, 2, "radioactive_ea_OnLeaveCombat")
RegisterUnitEvent(7603, 4, "radioactive_ea_OnDied")