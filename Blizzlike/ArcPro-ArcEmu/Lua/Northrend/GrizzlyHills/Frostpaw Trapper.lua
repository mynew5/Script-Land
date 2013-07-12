--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function FrostpawTrapper_OnCombat(Unit, Event)
	Unit:RegisterEvent("FrostpawTrapper_AimedShot", 9000, 0)
	Unit:RegisterEvent("FrostpawTrapper_Shoot", 6000, 0)
	Unit:RegisterEvent("FrostpawTrapper_WingClip", 12000, 0)
end

function FrostpawTrapper_AimedShot(Unit, Event) 
	Unit:FullCastSpellOnTarget(30614, Unit:GetMainTank()) 
end

function FrostpawTrapper_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function FrostpawTrapper_WingClip(Unit, Event) 
	Unit:FullCastSpellOnTarget(32908, Unit:GetMainTank()) 
end

function FrostpawTrapper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FrostpawTrapper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26434, 1, "FrostpawTrapper_OnCombat")
RegisterUnitEvent(26434, 2, "FrostpawTrapper_OnLeaveCombat")
RegisterUnitEvent(26434, 4, "FrostpawTrapper_OnDied")