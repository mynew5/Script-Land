--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Pythas_OnCombat(Unit, Event)
	Unit:SendChatMessage(14, 0, "The coils of death... Will crush you.")
--	Unit:PlaySoundToSet()
	Unit:RegisterEvent("Clap", 7000, 0)
	Unit:RegisterEvent("Healing", 14000, 0)
	Unit:RegisterEvent("Lightning", 21000, 0)
	Unit:RegisterEvent("Sleep", 28000, 0)
end

function Clap(Unit, Event) 
	Unit:CastSpell(8147) 
end

function Healing(Unit, Event) 
	Unit:CastSpell(5187) 
end

function Lightning(Unit, Event) 
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank()) 
end

function Sleep(Unit, Event) 
	Unit:FullCastSpellOnTarget(700, Unit:GetMainTank()) 
end

function Pythas_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Pythas_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3670, 1, "Pythas_OnCombat")
RegisterUnitEvent(3670, 2, "Pythas_OnLeaveCombat")
RegisterUnitEvent(3670, 4, "Pythas_OnDied")