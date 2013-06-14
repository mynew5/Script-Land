--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Stalker(Unit)
	Unit:RegisterEvent("Stalker_Charge", 7000, 0)
	Unit:RegisterEvent("Stalker_Light", 14000, 0)
	Unit:RegisterEvent("Stalker_Levitate", 21000, 0)
end

function Stalker_Charge(Unit)
	if(Unit:GetClosestPlayer() ~= nil) then
		Unit:FullCastSpellOnTarget(31715, Unit:GetClosestPlayer())
	end
end

function Stalker_Light(Unit)
	if(Unit:GetClosestPlayer() ~= nil) then
		Unit:FullCastSpellOnTarget(31330, Unit:GetClosestPlayer())
	end
end

function Stalker_Levitate(Unit)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:FullCastSpellOnTarget(31704, Unit:GetRandomPlayer())
	end
end

RegisterUnitEvent(17882, 1, "Stalker")