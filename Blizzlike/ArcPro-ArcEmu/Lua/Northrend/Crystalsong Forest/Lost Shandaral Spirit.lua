--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function LostShandaralSpirit_OnCombat(Unit, Event)
	Unit:RegisterEvent("LostShandaralSpirit_Moonfire", 6000, 0)
	Unit:RegisterEvent("LostShandaralSpirit_Regrowth", 13000, 0)
end

function LostShandaralSpirit_Moonfire(Unit, Event) 
	Unit:FullCastSpellOnTarget(15798, Unit:GetMainTank()) 
end

function LostShandaralSpirit_Regrowth(Unit, Event) 
	Unit:CastSpell(16561) 
end

function LostShandaralSpirit_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LostShandaralSpirit_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(31231, 1, "LostShandaralSpirit_OnCombat")
RegisterUnitEvent(31231, 2, "LostShandaralSpirit_OnLeaveCombat")
RegisterUnitEvent(31231, 4, "LostShandaralSpirit_OnDied")