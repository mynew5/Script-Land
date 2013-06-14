--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function baker_Died(Unit, event, player)
	Unit:RemoveEvents()
end

function baker(Unit, event, player)
	Unit:RegisterEvent("baker_Say",28000, 0)
end

function baker_Say(Unit, event, player)
local chance = math.random(1,3)
	if(chance == 1) then
		Unit:SendChatMessage(12, 0, "Fresh bread, baked this very morning!")
	elseif(chance == 2) then
		Unit:SendChatMessage(12, 0, "Come get your fresh bread!")
	else
		Unit:SendChatMessage(12, 0, "Fresh bread for sale!")
	end
end

RegisterUnitEvent(3518, 18, "baker")
RegisterUnitEvent(3518, 4, "baker_Died")