--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Serpentis_OnCombat(Unit, Event)
local chance = math.random(1,2)
	if (chance == 1) then
		Unit:SendChatMessage(14, 0, "I am the serpent king, I can do anything.")
--		Unit:PlaySoundToSet()
	elseif (chance == 2) then
		Unit:SendChatMessage(14, 0, "Intruders have assaulted our lair. Be on your guard!")
--		Unit:PlaySoundToSet()
	end
	Unit:RegisterEvent("Lightning", 8000, 0)
	Unit:RegisterEvent("Healing", 8000, 0)
	Unit:RegisterEvent("Sleep", 8000, 0)
end

function Lightning(Unit, Event) 
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank()) 
end

function Healing(Unit, Event) 
	Unit:FullCastSpell(23381) 
end

function Sleep(Unit, Event) 
	Unit:FullCastSpellOnTarget(700, Unit:GetMainTank()) 
end

function Serpentis_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Serpentis_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3673, 1, "Serpentis_OnCombat")
RegisterUnitEvent(3673, 2, "Serpentis_OnLeaveCombat")
RegisterUnitEvent(3673, 4, "Serpentis_OnDied")