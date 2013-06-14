--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Recon; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Lohan_Died(Unit, event, player)
	Unit:RemoveEvents()
end

function Lohan(Unit, event, player)
	Unit:RegisterEvent("Lohan_Say", 49000, 0)
end

function Lohan_Say(Unit, event, player)
local chance = math.random(1,3)
	if(chance == 1) then
		Unit:SendChatMessage(12, 0, "Free drinks at the Blue Recluse!")
	elseif(chance == 2) then
		Unit:SendChatMessage(12, 0, "Ask me how to get a free drink at the Blue Recluse!")
	elseif(chance == 3) then
		Unit:SendChatMessage(12, 0, "Head on over to the Blue Recluse. Where everybody knows your name!")
	end
end

RegisterUnitEvent(3627, 18, "Lohan")
RegisterUnitEvent(3627, 4, "Lohan_Died")