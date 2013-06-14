--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Mager1794; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HoggerOnCombat(Unit)
	if(Unit:GetClosestPlayer() ~= nil) then
		Unit:CastSpellOnTarget(6268, Unit:GetClosestPlayer())
		Unit:SendChatMessage(12, 0, "Hogger charges!!!");
	end
end

RegisterUnitEvent(448, 1, "HoggerOnCombat")