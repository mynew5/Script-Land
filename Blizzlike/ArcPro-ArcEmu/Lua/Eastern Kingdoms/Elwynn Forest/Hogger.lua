--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: Mager1794
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function HoggerOnCombat(Unit)
	if(Unit:GetClosestPlayer() ~= nil) then
		Unit:CastSpellOnTarget(6268, Unit:GetClosestPlayer())
		Unit:SendChatMessage(12, 0, "Hogger charges!!!");
	end
end

RegisterUnitEvent(448, 1, "HoggerOnCombat")