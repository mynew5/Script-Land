--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ShadowhoofAssassin_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("ShadowhoofAssassin_DebilitatingStrike", 15000, 0)
	Unit:RegisterEvent("ShadowhoofAssassin_SinisterStrike", 6000, 0)
end

function ShadowhoofAssassin_DebilitatingStrike(Unit,Event)
	Unit:FullCastSpellOnTarget(37577, Unit:GetClosestPlayer())
end

function ShadowhoofAssassin_SinisterStrike(Unit,Event)
	Unit:FullCastSpellOnTarget(14873, Unit:GetClosestPlayer())
end

function ShadowhoofAssassin_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function ShadowhoofAssassin_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(22858, 1, "ShadowhoofAssassin_OnEnterCombat")
RegisterUnitEvent(22858, 2, "ShadowhoofAssassin_OnLeaveCombat")
RegisterUnitEvent(22858, 4, "ShadowhoofAssassin_OnDied")