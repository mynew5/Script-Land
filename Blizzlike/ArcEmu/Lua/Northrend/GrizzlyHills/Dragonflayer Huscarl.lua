--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DragonflayerHuscarl_OnCombat(Unit, Event)
	Unit:RegisterEvent("DragonflayerHuscarl_Cleave", 8000, 0)
	Unit:RegisterEvent("DragonflayerHuscarl_DemoralizingShout", 3000, 1)
	Unit:RegisterEvent("DragonflayerHuscarl_Disarm", 10000, 0)
	Unit:RegisterEvent("DragonflayerHuscarl_Pummel", 15000, 0)
	Unit:RegisterEvent("DragonflayerHuscarl_Squish", 5500, 0)
	Unit:RegisterEvent("DragonflayerHuscarl_Whirlwind", 6500, 0)
end

function DragonflayerHuscarl_Cleave(Unit, Event) 
	Unit:CastSpell(40505) 
end

function DragonflayerHuscarl_DemoralizingShout(Unit, Event) 
	Unit:CastSpell(13730) 
end

function DragonflayerHuscarl_Disarm(Unit, Event) 
	Unit:FullCastSpellOnTarget(6713, Unit:GetMainTank()) 
end

function DragonflayerHuscarl_Pummel(Unit, Event) 
	Unit:FullCastSpellOnTarget(12555, Unit:GetMainTank()) 
end

function DragonflayerHuscarl_Squish(Unit, Event) 
	Unit:FullCastSpellOnTarget(52223, Unit:GetMainTank()) 
end

function DragonflayerHuscarl_Whirlwind(Unit, Event) 
	Unit:CastSpell(15578) 
end

function DragonflayerHuscarl_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DragonflayerHuscarl_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27260, 1, "DragonflayerHuscarl_OnCombat")
RegisterUnitEvent(27260, 2, "DragonflayerHuscarl_OnLeaveCombat")
RegisterUnitEvent(27260, 4, "DragonflayerHuscarl_OnDied")