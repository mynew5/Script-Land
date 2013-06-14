--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Mathix; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function PlayerDeathTouch(event, plr, spellid)
	if(spellid == 5) then
		if(plr:GetGmRank() <= 1) then
			plr:SoftDisconnect()
		end
	end
end

RegisterServerHook(5, "PlayerDeathTouch")