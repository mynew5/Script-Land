--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Mekgineer_OnCombat(pUnit, Event)
local chance = math.random(1,3)
	if(chance == 1) then
		pUnit:SendChatMessage(14, 0, "Explosions! MORE explosions! I got to have more explosions!")
	elseif(chance == 2) then
		pUnit:SendChatMessage(14, 0, "My machines are the future! They'll destroy you all!")
	elseif(chance == 3) then
		pUnit:SendChatMessage(14, 0, "Usurpers! Gnomeregan is mine!")
	end
	pUnit:RegisterEvent("Knock_Away", 7000, 0)
	pUnit:RegisterEvent("Knocks_Away", 14000, 0)
end

function Knock_Away(pUnit, Event)
	pUnit:CastSpellOnTarget(10101, pUnit:GetClosestPlayer(1))
end

function Knocks_Away(pUnit, Event)
	pUnit:CastSpellOnTarget(11130, pUnit:GetRandomPlayer(1))
end

function Mekgineer_OnLeaveCombat(pUnit)
	pUnit:RemoveEvents()
end

function Mekgineer_OnDied(pUnit)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(6228, 1, "Mekgineer_OnCombat")
RegisterUnitEvent(6228, 2, "Mekgineer_OnLeaveCombat")
RegisterUnitEvent(6228, 4, "Mekgineer_OnDied")