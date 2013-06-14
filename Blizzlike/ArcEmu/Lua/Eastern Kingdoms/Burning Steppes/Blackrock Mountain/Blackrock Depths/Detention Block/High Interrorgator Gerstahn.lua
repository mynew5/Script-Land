--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HIGS_OnCombat(pUnit, Event)
    pUnit:RegisterEvent("ManaBurn", 14000, 0)
    pUnit:RegisterEvent("ShadowShield", 7000, 0)
	pUnit:RegisterEvent("SWPain", 21000, 0)
	pUnit:RegisterEvent("PsychicScream", 28000, 0)
end
 
function ManaBurn(pUnit, Event)
    pUnit:CastSpell(14033)
end
 
function ShadowShield(pUnit, Event)
    Unit:CastSpell(12040)
end

function SWPain(pUnit, Event)
    pUnit:CastSpell(14032)
end

function PsychicScream(Unit, Event)
    pUnit:CastSpell(13704)
end
 
function HIGS_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end
 
function HIGS_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end
 
RegisterUnitEvent(9018, 1, "HIGS_OnCombat")
RegisterUnitEvent(9018, 2, "HIGS_OnLeaveCombat")
RegisterUnitEvent(9018, 4, "HIGS_OnDeath")