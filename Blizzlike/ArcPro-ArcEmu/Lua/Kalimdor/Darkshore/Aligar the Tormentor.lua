--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AligartheTormentor_OnCombat(Unit, Event)
	Unit:RegisterEvent("AligartheTormentor_BattleStance", 2000, 1)
	Unit:RegisterEvent("AligartheTormentor_Hamstring", 9000, 0)
	Unit:RegisterEvent("AligartheTormentor_HeroicStrike", 7000, 0)
end

function AligartheTormentor_BattleStance(pUnit, Event) 
	pUnit:CastSpell(7165) 
end

function AligartheTormentor_Hamstring(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9080, 	pUnit:GetMainTank()) 
end

function AligartheTormentor_HeroicStrike(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(25712, 	pUnit:GetMainTank()) 
end

function AligartheTormentor_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AligartheTormentor_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3898, 1, "AligartheTormentor_OnCombat")
RegisterUnitEvent(3898, 2, "AligartheTormentor_OnLeaveCombat")
RegisterUnitEvent(3898, 4, "AligartheTormentor_OnDied")