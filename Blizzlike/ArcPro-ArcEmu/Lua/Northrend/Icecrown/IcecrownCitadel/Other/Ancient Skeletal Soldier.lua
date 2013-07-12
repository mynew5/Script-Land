--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Holystone Productions; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local AncientSkeletalSoldier = 37012

function AncientSkeletalSoldier_OnCombat(pUnit, event)
  pUnit:RegisterEvent("Shield_Bash", 13000, 0)
end

function Shield_Bash(pUnit, event)
	if(pUnit:GetRandomPlayer(0) ~= nil) then
		pUnit:FullCastSpellOnTarget(70964, pUnit:GetRandomPlayer(0))
	end
end

function AncientSkeletalSoldier_OnLeaveCombat(pUnit, event)
   pUnit:RemoveEvents()
end

RegisterUnitEvent(AncientSkeletalSoldier, 1, "AncientSkeletalSoldier_OnCombat")
RegisterUnitEvent(AncientSkeletalSoldier, 2, "AncientSkeletalSoldier_OnLeaveCombat")