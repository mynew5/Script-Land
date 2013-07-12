--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function IronThaneArgrum_OnCombat(Unit, Event)
	Unit:RegisterEvent("IronThaneArgrum_CallLightning", 6000, 0)
	Unit:RegisterEvent("IronThaneArgrum_LightningShield", 4000, 0)
end

function IronThaneArgrum_CallLightning(Unit, Event) 
	Unit:FullCastSpellOnTarget(32018, Unit:GetMainTank()) 
end

function IronThaneArgrum_LightningShield(Unit, Event) 
	Unit:CastSpell(52651) 
end

function IronThaneArgrum_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function IronThaneArgrum_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26348, 1, "IronThaneArgrum_OnCombat")
RegisterUnitEvent(26348, 2, "IronThaneArgrum_OnLeaveCombat")
RegisterUnitEvent(26348, 4, "IronThaneArgrum_OnDied")