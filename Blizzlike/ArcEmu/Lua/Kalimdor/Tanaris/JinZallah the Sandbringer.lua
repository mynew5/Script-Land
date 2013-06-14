--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function JinZallahtheSandbringer_OnCombat(Unit, Event)
	Unit:RegisterEvent("JinZallahtheSandbringer_DustCloud", 15000, 0)
	Unit:RegisterEvent("JinZallahtheSandbringer_LightningBolt", 8000, 0)
	Unit:RegisterEvent("JinZallahtheSandbringer_SandStorms", 10000, 1)
end

function JinZallahtheSandbringer_DustCloud(Unit, Event) 
	Unit:CastSpell(7272) 
end

function JinZallahtheSandbringer_LightningBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(20824, Unit:GetMainTank()) 
end

function JinZallahtheSandbringer_SandStorms(Unit, Event) 
	Unit:CastSpell(10132) 
end

function JinZallahtheSandbringer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function JinZallahtheSandbringer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(8200, 1, "JinZallahtheSandbringer_OnCombat")
RegisterUnitEvent(8200, 2, "JinZallahtheSandbringer_OnLeaveCombat")
RegisterUnitEvent(8200, 4, "JinZallahtheSandbringer_OnDied")