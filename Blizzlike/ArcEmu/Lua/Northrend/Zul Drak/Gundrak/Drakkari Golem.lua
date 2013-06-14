--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Drakkari_Golem_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Drakkari_Golem_Body_of_Stone", math.random(45000,49000), 0)
	pUnit:RegisterEvent("Drakkari_Golem_Shockwave", math.random(17000,24000), 0)
	pUnit:RegisterEvent("Drakkari_Golem_Thunderclap", math.random(13000,16000), 0)
end

function Drakkari_Golem_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Drakkari_Golem_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Drakkari_Golem_Body_of_Stone(pUnit, Event)
	pUnit:FullCastSpell(55633)
end

function Drakkari_Golem_Shockwave(pUnit, Event)
	pUnit:FullCastSpell(55636)
end

function Drakkari_Golem_Thunderclap(pUnit, Event)
	pUnit:FullCastSpell(55635)
end

RegisterUnitEvent(29832, 1, "Drakkari_Golem_OnCombat")
RegisterUnitEvent(29832, 2, "Drakkari_Golem_OnLeaveCombat")
RegisterUnitEvent(29832, 4, "Drakkari_Golem_OnDeath")