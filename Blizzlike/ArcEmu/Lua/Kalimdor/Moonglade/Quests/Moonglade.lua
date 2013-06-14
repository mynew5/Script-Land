--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Moonglade_OnAccept(pUnit, Event)
	pUnit:CastSpellOnTarget(19027, pUnit:GetClosestPlayer())
end

RegisterQuestEvent(5921, 2, "Moonglade_OnAccept")
RegisterQuestEvent(5922, 2, "Moonglade_OnAccept")