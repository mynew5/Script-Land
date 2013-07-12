--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Hammeroftherighteous(event, pPlayer, SpellId, pSpellObject)
	if(SpellId == 53595) then
		local target = pPlayer:GetPrimaryCombatTarget()
		for _,v in pairs(target) do
			local friends = v:GetInRangeFriends()
			if(friends:GetDistance(pPlayer) >= 4) then
				pPlayer:FullCastSpellOnTarget(53592, friends)
			end
		end
	end
end

RegisterServerHook(10, "Hammeroftherighteous")