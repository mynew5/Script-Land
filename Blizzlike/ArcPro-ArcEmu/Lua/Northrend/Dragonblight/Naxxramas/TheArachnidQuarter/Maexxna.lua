--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Maexna_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Gaaahr!")
	pUnit:RegisterEvent("Maexna_WebWrap", 40000, 0)
	pUnit:RegisterEvent("Maexna_WebSpray", 60000, 0)
	pUnit:RegisterEvent("Maexna_PoisonShock", 15000, 0)
	pUnit:RegisterEvent("Maexna_NecroticPoison", 25000, 0)
	pUnit:RegisterEvent("Maexna_Phase1", 100, 0)
end

function Maexna_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Maexna_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Maexna_WebWrap(pUnit, Event)
	pUnit:FullCastSpellOnTarget(28622, pUnit:GetRandomPlayer(0))
end

function Maexna_WebSpray(pUnit, Event)
	pUnit:FullCastSpellOnTarget(29484, pUnit:GetRandomPlayer(0))
end

function Maexna_PoisonShock(pUnit, Event)
	pUnit:CastSpell(28741)
end

function Maexna_NecroticPoison(pUnit, Event)
	pUnit:FullCastSpellOnTarget(28776, pUnit:GetRandomPlayer(0))
end

function Maexna_Frenzy(pUnit, Event)
	pUnit:CastSpell(28747)
end

function Maexna_Phase1(pUnit, Event)
	if(pUnit:GetHealthPct() <= 30) then
		pUnit:RemoveEvents()
		pUnit:RegisterEvent("Maexna_Frenzy", 1000, 0)
	end
end

RegisterUnitEvent(15952, 1, "Maexna_OnCombat")
RegisterUnitEvent(15952, 2, "Maexna_OnLeaveCombat")
RegisterUnitEvent(15952, 4, "Maexna_OnDeath")