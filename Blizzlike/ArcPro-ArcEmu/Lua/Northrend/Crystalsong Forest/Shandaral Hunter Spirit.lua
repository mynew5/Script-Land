--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ShandaralHunterSpirit_OnCombat(Unit, Event)
	Unit:RegisterEvent("ShandaralHunterSpirit_AimedShot", 7000, 0)
	Unit:RegisterEvent("ShandaralHunterSpirit_ImprovedWingClip", 10000, 0)
	Unit:RegisterEvent("ShandaralHunterSpirit_Shoot", 6000, 0)
end

function ShandaralHunterSpirit_AimedShot(Unit, Event) 
	Unit:FullCastSpellOnTarget(54615, Unit:GetMainTank()) 
end

function ShandaralHunterSpirit_ImprovedWingClip(Unit, Event) 
	Unit:FullCastSpellOnTarget(47168, Unit:GetMainTank()) 
end

function ShandaralHunterSpirit_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function ShandaralHunterSpirit_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ShandaralHunterSpirit_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(30864, 1, "ShandaralHunterSpirit_OnCombat")
RegisterUnitEvent(30864, 2, "ShandaralHunterSpirit_OnLeaveCombat")
RegisterUnitEvent(30864, 4, "ShandaralHunterSpirit_OnDied")