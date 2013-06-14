--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Rousch_FriendsTribute(pUnit, event)
    pUnit:Emote(113)
end

function Rousch_OnSpawn(pUnit, event)
    pUnit:SetStandState(8)
	pUnit:RegisterEvent("Rousch_FriendsTribute",5000, 0)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(16090, 6, "Rousch_OnSpawn")