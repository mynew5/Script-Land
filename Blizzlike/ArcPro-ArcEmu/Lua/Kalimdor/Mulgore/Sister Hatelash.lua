--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SisterHatelash_OnCombat(Unit, Event)
	Unit:RegisterEvent("SisterHatelash_LightningBarrier", 1000, 1)
	Unit:RegisterEvent("SisterHatelash_LightningBolt", 8000, 0)
end

function SisterHatelash_LightningBarrier(pUnit, Event) 
	pUnit:CastSpell(6960) 
end

function SisterHatelash_LightningBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9532, pUnit:GetClosestPlayer()) 
end

function SisterHatelash_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SisterHatelash_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5785, 1, "SisterHatelash_OnCombat")
RegisterUnitEvent(5785, 2, "SisterHatelash_OnLeaveCombat")
RegisterUnitEvent(5785, 4, "SisterHatelash_OnDied")