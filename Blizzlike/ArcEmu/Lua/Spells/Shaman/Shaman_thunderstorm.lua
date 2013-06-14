--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function OnCastThunderstorm1(event, plr, spellid)
	if(spellid == 51490) then
		plr:CastSpell(438)
	end
end

RegisterServerHook(10, "OnCastThunderstorm1")