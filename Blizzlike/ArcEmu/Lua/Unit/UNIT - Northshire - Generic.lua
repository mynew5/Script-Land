--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Kobold_onAgro (pUnit, Event)
	pUnit:SendChatMessage (11, 0, "You no take candle!")
end

RegisterUnitEvent (6, 1, "Kobold_onAgro")