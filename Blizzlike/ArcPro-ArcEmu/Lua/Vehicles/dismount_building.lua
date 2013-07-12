--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation, Rochet2
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

local Range = 15

function Checker_OnSpawn(Unit)
	Unit:RegisterEvent(Checker_RangeCheck, 1000, 0)
end

function Checker_RangeCheck(Unit)
	local plrs = Unit:GetInRangePlayers()
	if(plrs ~= nil) then
		for _, v in pairs(plrs) do
			if((v:IsMounted()) and (Unit:GetDistance(v) <= Range)) then
				v:Dismount()
			end
		end
	end
end

RegisterUnitEvent(900004, 18, Checker_OnSpawn)