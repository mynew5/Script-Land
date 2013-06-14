--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Player_OnEnterWorld(event, plr)
	if(plr:HasAura(69127) == true) then
		plr:RemoveAura(69127)
	end
	if(plr:GetMapId() == 631) then
		if(plr:HasAura(69127) == false) then
			SetDBCSpellVar(69127, "c_is_flags", 0x01000)
			plr:CastSpell(69127)
		end
	end
end

RegisterServerHook(4, "Player_OnEnterWorld")