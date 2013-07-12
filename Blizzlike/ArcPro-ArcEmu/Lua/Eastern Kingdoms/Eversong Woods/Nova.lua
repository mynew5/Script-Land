--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: Ascendscripting
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Nova_OnSpawn(Unit, Event)
local RegText = math.random(1,4)
	Unit:RegisterEvent("Nova_SummonCat", 48000, 0)
	if(RegText == 1) then
		Unit:RegisterEvent("Nova_Text", 21000, 0)
	elseif(RegText == 2) then
		Unit:RegisterEvent("Nova_Text", 24000, 0)
	elseif(RegText == 3) then
		Unit:RegisterEvent("Nova_Text", 35000, 0)
	elseif(RegText == 4) then
		Unit:RegisterEvent("Nova_Text", 48000, 0)
	end
end

function Nova_Text(Unit, Event)
local Random = math.random(1,3)
	Unit:RegisterEvent("Nova_Talk", 2000, 1)
	if(Random == 1) then
		Unit:SendChatMessage(16, 0, "Nova shakes the dirt loose from the shell.")
	elseif(Random == 2) then
		Unit:SendChatMessage(16, 0, "Nova holds a sea shell up to her ear.")
	elseif(Random == 3) then
		Unit:SendChatMessage(16, 0, "Nova picks up a sea shell.")
	end
end

function Nova_Talk(Unit, Event)
local Random = math.random(1,3)
	Unit:RemoveEvents()
	Unit:RegisterEvent("Nova_OnSpawn", 2000, 0)
	if(Random == 1) then
		Unit:SendChatMessage(12, 1, "I think I can see the Sunwell from here!")
	elseif(Random == 2) then
		Unit:SendChatMessage(12, 1, "Oooh! Look, a shiny one!")
	elseif(Random == 3) then
		Unit:SendChatMessage(12, 1, "Can you really hear the ocean from one of these shells?")
	end
end

function Nova_SummonCat(Unit, Event)
	Unit:CastSpell(35052)
end

function Nova_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function Nova_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20244, 18, "Nova_OnSpawn")
RegisterUnitEvent(20244, 2, "Nova_OnLeaveCombat")
RegisterUnitEvent(20244, 3, "Nova_OnDied")