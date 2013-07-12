--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CrazedInduleSurvivor_OnCombat(Unit, Event)
	Unit:RegisterEvent("CrazedInduleSurvivor_Crazed", 4000, 1)
	Unit:RegisterEvent("CrazedInduleSurvivor_MortalStrike", 7000, 0)
end

function CrazedInduleSurvivor_Crazed(Unit, Event) 
	Unit:CastSpell(48139) 
end

function CrazedInduleSurvivor_MortalStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(39171, Unit:GetMainTank()) 
end

function CrazedInduleSurvivor_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CrazedInduleSurvivor_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(32409, 1, "CrazedInduleSurvivor_OnCombat")
RegisterUnitEvent(32409, 2, "CrazedInduleSurvivor_OnLeaveCombat")
RegisterUnitEvent(32409, 4, "CrazedInduleSurvivor_OnDied")