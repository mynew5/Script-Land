--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function IntotheSoulgrinder_OnQuestComplete(pUnit, Event)
	pUnit:SpawnCreature(23053, 2794.978271, 5842.185547, 35.911819, 3.61522, 35, 540000)
end

RegisterQuestEvent(11000, 1, "IntotheSoulgrinder_OnQuestComplete")