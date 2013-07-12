--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HighShamanBloodpaw_OnCombat(Unit, Event)
	Unit:RegisterEvent("HighShamanBloodpaw_Bloodlust", 11000, 0)
	Unit:RegisterEvent("HighShamanBloodpaw_ChainLightning", 10000, 0)
	Unit:RegisterEvent("HighShamanBloodpaw_FrostShock", 6000, 0)
	Unit:RegisterEvent("HighShamanBloodpaw_LightningBolt", 8000, 0)
end

function HighShamanBloodpaw_Bloodlust(Unit, Event) 
	Unit:CastSpell(28902) 
end

function HighShamanBloodpaw_ChainLightning(Unit, Event) 
	Unit:FullCastSpellOnTarget(22355, Unit:GetMainTank()) 
end

function HighShamanBloodpaw_FrostShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(19133, Unit:GetMainTank()) 
end

function HighShamanBloodpaw_LightningBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(22414, Unit:GetMainTank()) 
end

function HighShamanBloodpaw_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HighShamanBloodpaw_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27762, 1, "HighShamanBloodpaw_OnCombat")
RegisterUnitEvent(27762, 2, "HighShamanBloodpaw_OnLeaveCombat")
RegisterUnitEvent(27762, 4, "HighShamanBloodpaw_OnDied")