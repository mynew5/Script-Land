--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: http://luaplusplus.org/; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DeeprunRatRoundup_OnComplete(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "Into the box me pretties! Thas it. One by one ye go.")
end

RegisterQuestEvent(6661, 1, "DeeprunRatRoundup_OnComplete")