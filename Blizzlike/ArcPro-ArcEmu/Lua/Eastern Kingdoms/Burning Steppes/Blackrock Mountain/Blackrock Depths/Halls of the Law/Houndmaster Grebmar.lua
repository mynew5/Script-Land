--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function HoundMGM_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "Ahh, a new chew toy for my dogs!")
    pUnit:RegisterEvent("Bloodlust", 7000, 0)
    pUnit:RegisterEvent("DS", 14000, 0)
	pUnit:RegisterEvent("Pummel", 21000, 0)
end
 
function Bloodlust(pUnit, Event)
    pUnit:FullCastSpell(21049)
end
 
function DS(pUnit, Event)
    pUnit:CastSpell(13730)
end

function Pummel(pUnit, Event)
    pUnit:CastSpellOnTarget(15615)
end
 
function HoundMGM_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end
 
function HoundMGM_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end
 
RegisterUnitEvent(9319, 1, "HoundMGM_OnCombat")
RegisterUnitEvent(9319, 2, "HoundMGM_OnLeaveCombat")
RegisterUnitEvent(9319, 3, "HoundMGM_OnDeath")