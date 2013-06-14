--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Moon Project; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SunbladeWarlock_OnCombat(Unit, Event)
	Unit:CastSpell(44517)
	Unit:RegisterEvent("SunbladeWarlock_Incinerate", 5000, 0)
	Unit:RegisterEvent("SunbladeWarlock_Immolate", 3500, 0)
end

function SunbladeWarlock_Incinerate(Unit, Event)
	Unit:FullCastSpellOnTarget(46043, Unit:GetClosestPlayer())
end

function SunbladeWarlock_Immolate(Unit, Event)
	local Flip = math.random(3)
	if((Flip == 1) and (Unit:GetMainTank())) then
		Unit:FullCastSpellOnTarget(46042, Unit:GetMainTank())
	end
end

function SunbladeWarlock_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function SunbladeWarlock_Died(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(24686, 1, "SunbladeWarlock_OnCombat")
RegisterUnitEvent(24686, 2, "SunbladeWarlock_LeaveCombat")
RegisterUnitEvent(24686, 4, "SunbladeWarlock_Died")