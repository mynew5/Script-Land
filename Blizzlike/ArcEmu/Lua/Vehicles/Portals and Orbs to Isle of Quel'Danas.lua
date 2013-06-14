--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

-- Portal
function PortalToQuelDanas_onUse1 (pUnit, Event, pMisc)
	pMisc:Teleport (530, 12806.004, -6911.1494, 41.1161)
end

RegisterGameObjectEvent(449944, 2, "PortalToQuelDanas_onUse1")

-- Orbs
function QuelDanasOrbOne(pGameObject, Event, pMisc)
    pMisc:Teleport(530, 12783.344727, -6880.589355, 23.791157)
end

function QuelDanasOrbTwo(pGameObject, Event, pMisc)
    pMisc:Teleport(530, 12791.011719, -6891.227539, 31.820141)
end

RegisterGameObjectEvent(187428, 2, "QuelDanasOrbOne")
RegisterGameObjectEvent(187431, 2, "QuelDanasOrbTwo")