--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DrakkariWitchDoctor_OnCombat(Unit, Event)
	Unit:RegisterEvent("DrakkariWitchDoctor_SuperiorHealingWard", 4000, 1)
	Unit:RegisterEvent("DrakkariWitchDoctor_VoodooDoll", 7000, 0)
end

function DrakkariWitchDoctor_SuperiorHealingWard(Unit, Event) 
	Unit:CastSpell(32194) 
end

function DrakkariWitchDoctor_VoodooDoll(Unit, Event) 
	Unit:FullCastSpellOnTarget(52695, Unit:GetMainTank()) 
end

function DrakkariWitchDoctor_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DrakkariWitchDoctor_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27555, 1, "DrakkariWitchDoctor_OnCombat")
RegisterUnitEvent(27555, 2, "DrakkariWitchDoctor_OnLeaveCombat")
RegisterUnitEvent(27555, 4, "DrakkariWitchDoctor_OnDied")