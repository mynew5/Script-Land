--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Naltaszar_OnCombat(Unit, Event)
	UnitRegisterEvent("Naltaszar_ChainBurn", 10000, 0)
	UnitRegisterEvent("Naltaszar_ChainLightning", 6000, 0)
end

function Naltaszar_ChainBurn(Unit, Event) 
	UnitFullCastSpellOnTarget(8211, UnitGetRandomPlayer(4)) 
end

function Naltaszar_ChainLightning(Unit, Event) 
	UnitFullCastSpellOnTarget(15305, UnitGetMainTank()) 
end

function Naltaszar_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function Naltaszar_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(4066, 1, "Naltaszar_OnCombat")
RegisterUnitEvent(4066, 2, "Naltaszar_OnLeaveCombat")
RegisterUnitEvent(4066, 4, "Naltaszar_OnDied")