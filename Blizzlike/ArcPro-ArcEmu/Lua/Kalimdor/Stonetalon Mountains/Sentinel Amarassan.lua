--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SentinelAmarassan_OnCombat(Unit, Event)
	UnitRegisterEvent("SentinelAmarassan_Wrath", 5000, 2)
	UnitRegisterEvent("SentinelAmarassan_CatForm", 12000, 1)
	UnitRegisterEvent("SentinelAmarassan_TigersFury", 14000, 1)
end

function SentinelAmarassan_Wrath(Unit, Event) 
	UnitFullCastSpellOnTarget(9739, UnitGetMainTank()) 
end

function SentinelAmarassan_CatForm(Unit, Event) 
	UnitCastSpell(5759) 
end

function SentinelAmarassan_TigersFury(Unit, Event) 
	UnitCastSpell(5217) 
end

function SentinelAmarassan_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function SentinelAmarassan_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(5916, 1, "SentinelAmarassan_OnCombat")
RegisterUnitEvent(5916, 2, "SentinelAmarassan_OnLeaveCombat")
RegisterUnitEvent(5916, 4, "SentinelAmarassan_OnDied")