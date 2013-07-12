--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: 2D
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--[[Baroness Dorothea Millstipe says: Where has the master gone?
Baroness Dorothea Millstipe says: Why can we not talk to the master?]]

function BaronessDorotheaMillstipe_OnCombat(Unit, Event)
	Unit:RegisterEvent("BaronessDorotheaMillstipe_Pain", 7000, 0)
	Unit:RegisterEvent("BaronessDorotheaMillstipe_MindFlay", 14000, 0)
	Unit:RegisterEvent("BaronessDorotheaMillstipe_ManaBurn", 21000, 0)
	Unit:RegisterEvent("BaronessDorotheaMillstipe_Repeat", 28000, 0)
end

function BaronessDorotheaMillstipe_Pain(pUnit, Event)
	pUnit:FullCastSpellOnTarget(34441, pUnit:GetMainTank())
end

function BaronessDorotheaMillstipe_MindFlay(pUnit, Event)
	if(pUnit:GetRandomPlayer(0) ~= nil) then
		pUnit:FullCastSpellOnTarget(37276, pUnit:GetRandomPlayer(0))
	end
end

function BaronessDorotheaMillstipe_ManaBurn(pUnit, Event)
	if(pUnit:GetRandomPlayer(0) ~= nil) then
		pUnit:FullCastSpellOnTarget(37159, pUnit:GetRandomPlayer(0))
	end
end

function BaronessDorotheaMillstipe_Repeat(Unit, Event)
	Unit:RegisterEvent("BaronessDorotheaMillstipe_Pain", 8000, 0)
	Unit:RegisterEvent("BaronessDorotheaMillstipe_MindFlay", 15000, 0)
	Unit:RegisterEvent("BaronessDorotheaMillstipe_ManaBurn", 20000, 0)
end

function BaronessDorotheaMillstipe_Pain(pUnit, Event)
	pUnit:FullCastSpellOnTarget(34441, pUnit:GetMainTank())
end

function BaronessDorotheaMillstipe_MindFlay(pUnit, Event)
	if(pUnit:GetRandomPlayer(0) ~= nil) then
		pUnit:FullCastSpellOnTarget(37276, pUnit:GetRandomPlayer(0))
	end
end

function BaronessDorotheaMillstipe_ManaBurn(pUnit, Event)
	if(pUnit:GetRandomPlayer(0) ~= nil) then
		pUnit:FullCastSpellOnTarget(37159, pUnit:GetRandomPlayer(0))
	end
end

function BaronessDorotheaMillstipe_OnDied(Unit)
	Unit:RemoveEvents()
end

function BaronessDorotheaMillstipe_OnLeaveCombat(Unit)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19875, 1, "BaronessDorotheaMillstipe_OnCombat")
RegisterUnitEvent(19875, 2, "BaronessDorotheaMillstipe_Repeat")
RegisterUnitEvent(19875, 3, "BaronessDorotheaMillstipe_OnLeaveCombat")
RegisterUnitEvent(19875, 4, "BaronessDorotheaMillstipe_OnDied")