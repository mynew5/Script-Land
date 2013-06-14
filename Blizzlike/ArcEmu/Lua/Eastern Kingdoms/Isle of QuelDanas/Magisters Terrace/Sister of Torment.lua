--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Moon Project; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SunbladeSisterofTorment_OnCombat(Unit, Event)
	Unit:RegisterEvent("SunbladeSisterofTorment_DeadlyEmbrace", 10000, 0)
	Unit:RegisterEvent("SunbladeSisterofTorment_LashofPain", 7000, 0) 
end

--Deadly Embrace
function SunbladeSisterofTorment_DeadlyEmbrace(Unit, Event)
	if(Unit:GetRandomPlayer(1)) then
		Unit:FullCastSpellOnTarget(44547, Unit:GetRandomPlayer(1))
	end
end

--Lash of Pain
function SunbladeSisterofTorment_LashofPain(Unit, Event)
	local Flip = math.random(1,2)
	if((Flip == 1) and (Unit:GetClosestPlayer())) then
		Unit:CastSpellOnTarget(44640, Unit:GetClosestPlayer())
	else
	end
end

function SunbladeSisterofTorment_LeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function SunbladeSisterofTorment_Died(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(24697, 1, "SunbladeSisterofTorment_OnCombat")
RegisterUnitEvent(24697, 2, "SunbladeSisterofTorment_LeaveCombat")
RegisterUnitEvent(24697, 4, "SunbladeSisterofTorment_Died")