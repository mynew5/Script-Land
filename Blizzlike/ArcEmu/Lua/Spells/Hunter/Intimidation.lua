--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Mathix; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

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