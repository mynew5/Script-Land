-------------------------------------------------------------------
-- This script is created by zdroid9770; please do not edit this --
-- script and claim it as your own, as of All rights are claimed --
-- by me.--
-- Copyright© zdroid9770					 --
-------------------------------------------------------------------

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