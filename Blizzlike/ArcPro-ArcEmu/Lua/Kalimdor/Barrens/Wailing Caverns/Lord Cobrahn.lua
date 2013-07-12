--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Cobrahn_OnCombat(Unit, Event)
	Unit:SendChatMessage(14, 0, "You will never wake the dreamer!")
--	Unit:PlaySoundToSet()
	Unit:RegisterEvent("Lightning", 7000, 0)
	Unit:RegisterEvent("Healing", 14000, 0)
	Unit:RegisterEvent("Poison", 21000, 0)
	Unit:RegisterEvent("Slumber", 28000, 0)
	Unit:RegisterEvent("Serpent", 35000, 0)
end

function Lightning(Unit, Event) 
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank()) 
end

function Healing(Unit, Event) 
	Unit:CastSpell(5188, Unit:GetMainTank()) 
end

function Poison(Unit, Event) 
	Unit:CastSpellOnTarget(744, Unit:GetMainTank()) 
end

function Slumber(Unit, Event) 
	Unit:FullCastSpellOnTarget(8040, Unit:GetMainTank()) 
end

function Serpent(Unit, Event) 
	Unit:CastSpell(7965) 
end

function Cobrahn_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Cobrahn_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3669, 1, "Cobrahn_OnCombat")
RegisterUnitEvent(3669, 2, "Cobrahn_OnLeaveCombat")
RegisterUnitEvent(3669, 4, "Cobrahn_OnDied")