--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: Mathix
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function IntimidationFix(event, player, spellid)
	if(spellid == 19577) then
		local pet = player:tostring(player)
		local pettarget = pet:GetSelection()
		if(pettarget:IsFriendly() == false) then
			pet:CastSpellOnTarget(19577, pettarget)
		end
	end
end

RegisterServerHook(10, "IntimidationFix")