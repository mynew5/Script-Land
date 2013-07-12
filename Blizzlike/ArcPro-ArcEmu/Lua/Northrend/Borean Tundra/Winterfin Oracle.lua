--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WinterfinOracle_OnCombat(Unit, Event)
	Unit:RegisterEvent("WinterfinOracle_LightningBolt", 8000, 0)
	Unit:RegisterEvent("WinterfinOracle_UnstableMagic", 2000, 1)
end

function WinterfinOracle_LightningBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank()) 
end

function WinterfinOracle_UnstableMagic(Unit, Event) 
	Unit:CastSpell(50272) 
end

function WinterfinOracle_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WinterfinOracle_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25216, 1, "WinterfinOracle_OnCombat")
RegisterUnitEvent(25216, 2, "WinterfinOracle_OnLeaveCombat")
RegisterUnitEvent(25216, 4, "WinterfinOracle_OnDied")