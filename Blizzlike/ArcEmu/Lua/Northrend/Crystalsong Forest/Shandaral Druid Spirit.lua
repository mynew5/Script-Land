--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ShandaralDruidSpirit_OnCombat(Unit, Event)
	Unit:RegisterEvent("ShandaralDruidSpirit_Moonfire", 6000, 0)
	Unit:RegisterEvent("ShandaralDruidSpirit_Regrowth", 13000, 0)
end

function ShandaralDruidSpirit_Moonfire(Unit, Event) 
	Unit:FullCastSpellOnTarget(15798, Unit:GetMainTank()) 
end

function ShandaralDruidSpirit_Regrowth(Unit, Event) 
	Unit:CastSpell(16561) 
end

function ShandaralDruidSpirit_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ShandaralDruidSpirit_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(30863, 1, "ShandaralDruidSpirit_OnCombat")
RegisterUnitEvent(30863, 2, "ShandaralDruidSpirit_OnLeaveCombat")
RegisterUnitEvent(30863, 4, "ShandaralDruidSpirit_OnDied")