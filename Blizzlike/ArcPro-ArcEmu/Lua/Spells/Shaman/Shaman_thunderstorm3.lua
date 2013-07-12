--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function OnCastThunderstorm3(event, plr, spellid)
	if(spellid == 59158) then
		plr:CastSpell(11903)
	end
end

RegisterServerHook(10, "OnCastThunderstorm3")