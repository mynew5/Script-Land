--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--Berserk Owlbeast
function BerserkOwlbeast_OnCombat(Unit, Event)
	Unit:RegisterEvent("BerserkOwlbeast_Enrage", 1000, 1)
end

function BerserkOwlbeast_Enrage(Unit, Event) 
	if(Unit:GetHealthPct() < 25) then
		Unit:CastSpell(8599) 
	end
end

function BerserkOwlbeast_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BerserkOwlbeast_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7454, 1, "BerserkOwlbeast_OnCombat")
RegisterUnitEvent(7454, 2, "BerserkOwlbeast_OnLeaveCombat")
RegisterUnitEvent(7454, 4, "BerserkOwlbeast_OnDied")

--Anguished Highborne
function Highborne_OnCombat(Unit, Event)
	Unit:RegisterEvent("Highborne_Blast", 6000, 0)
end

function Highborne_Blast(Unit, Event) 
	Unit:FullCastSpellOnTarget(13860, Unit:GetMainTank()) 
end

function Highborne_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Highborne_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7524, 1, "Highborne_OnCombat")
RegisterUnitEvent(7524, 2, "Highborne_OnLeaveCombat")
RegisterUnitEvent(7524, 4, "Highborne_OnDied")