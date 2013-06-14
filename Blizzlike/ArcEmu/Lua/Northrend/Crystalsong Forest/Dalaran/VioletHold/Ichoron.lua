--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[Intro
Yell: I... am fury... unrestrained!]]

function Ichoron_OnCombat(Unit, Event) 
	Unit:SendChatMessage(12, 0, "Stand aside, mortals!")
	Unit:RegisterEvent("Ichoron_Drained", 5000, 20)
	Unit:RegisterEvent("Ichoron_Frenzy1", 10000, 20)
	Unit:RegisterEvent("Ichoron_ProtectiveBubble", 15000, 20)
	Unit:RegisterEvent("Ichoron_Frenzy2", 20000, 20)
	Unit:RegisterEvent("Ichoron_WaterBlast1", 25000, 20)
	Unit:RegisterEvent("Ichoron_WaterBoltVolley1", 30000, 20)
	Unit:RegisterEvent("Ichoron_WaterBlast2", 35000, 20)
	Unit:RegisterEvent("Ichoron_WaterBoltVolley2", 40000, 20)
end

function Ichoron_Drained(Unit, Event) 
	Unit:SendChatMessage(14, 0, "I will not be contained! Ngyah!!")
	Unit:CastSpell(59820, Unit:GetRandomPlayer(4)) 
end

function Ichoron_Frenzy1(Unit, Event)
	Unit:CastSpell(27897, Unit:GetMainTank()) 
end

function Ichoron_ProtectiveBubble(Unit, Event) 
	Unit:SendChatMessage(14, 0, "Water can hold any form, take any shape... overcome any obstacle.")
	Unit:CastSpell(54306, Unit:GetRandomPlayer(4)) 
end

function Ichoron_Frenzy2(Unit, Event)
	Unit:SendChatMessage(14, 0, "I shall consume, decimate, devastate, and destroy! Yield now to the wrath of the pounding sea!")
	Unit:CastSpell(27897, Unit:GetRandomPlayer(6)) 
end

function Ichoron_WaterBlast1(Unit, Event) 
	Unit:CastSpell(54237, Unit:GetRandomPlayer(7)) 
end

function Ichoron_WaterBoltVolley1(Unit, Event) 
	Unit:CastSpell(59266, Unit:GetRandomPlayer(4)) 
end

function Ichoron_WaterBlast2(Unit, Event) 
	Unit:CastSpell(59520, Unit:GetMainTank()) 
end

function Ichoron_WaterBoltVolley2(Unit, Event) 
	Unit:CastSpell(59521, Unit:GetRandomPlayer(7)) 
end

function Ichoron_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents()
end

function Ichoron_OnDied(Unit, Event) 
	Unit:RemoveEvents() 
	Unit:SendChatMessage(14, 0, "I... recede.") 
end

function Ichoron_OnKilledTarget(Unit, Event)
local chance = math.random(1,3)
	if(chance == 1) then
		Unit:SendChatMessage(14, 0, "I am a force of nature!")
	elseif(chance == 2) then
		Unit:SendChatMessage(14, 0, "I shall pass!")
	else
		Unit:SendChatMessage(14, 0, "You can not stop the tide!")
	end
end

RegisterUnitEvent(29313, 1, "Ichoron_OnCombat")
RegisterUnitEvent(29313, 2, "Ichoron_OnLeaveCombat")
RegisterUnitEvent(29313, 3, "Ichoron_OnKilledTarget")
RegisterUnitEvent(29313, 4, "Ichoron_OnDied")