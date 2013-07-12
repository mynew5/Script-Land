--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function VilewingChimaera_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("VilewingChimaera_FroststormBreath", 5000, 0)
	Unit:RegisterEvent("VilewingChimaera_VenomSpit", 15000, 0)
end

function VilewingChimaera_FroststormBreath(Unit,Event)
	Unit:FullCastSpellOnTarget(55491, Unit:GetClosestPlayer())
end

function VilewingChimaera_VenomSpit(Unit,Event)
	Unit:FullCastSpellOnTarget(16552, Unit:GetClosestPlayer())
end

function VilewingChimaera_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function VilewingChimaera_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21879, 1, "VilewingChimaera_OnEnterCombat")
RegisterUnitEvent(21879, 2, "VilewingChimaera_OnLeaveCombat")
RegisterUnitEvent(21879, 4, "VilewingChimaera_OnDied")