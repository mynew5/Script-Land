--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WarbringerGoredrak_OnCombat(Unit, Event)
	Unit:RegisterEvent("WarbringerGoredrak_ArcaneBlast", 8000, 0)
	Unit:RegisterEvent("WarbringerGoredrak_PowerSap", 10000, 0)
end

function WarbringerGoredrak_ArcaneBlast(Unit, Event) 
	Unit:FullCastSpellOnTarget(50545, Unit:GetMainTank()) 
end

function WarbringerGoredrak_PowerSap(Unit, Event) 
	Unit:FullCastSpellOnTarget(50534, Unit:GetMainTank()) 
end

function WarbringerGoredrak_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WarbringerGoredrak_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25712, 1, "WarbringerGoredrak_OnCombat")
RegisterUnitEvent(25712, 2, "WarbringerGoredrak_OnLeaveCombat")
RegisterUnitEvent(25712, 4, "WarbringerGoredrak_OnDied")