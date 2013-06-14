--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function PX_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Violence! Property damage! None shall pass!!")
	pUnit:RegisterEvent("FireballVolley", 7000, 0)
	pUnit:RegisterEvent("ThunderClap", 14000, 0)
	pUnit:RegisterEvent("MightyBlow", 21000, 0)
end

function FireballVolley(pUnit, Event)
	pUnit:CastSpell(15285)
end

function MightyBlow(pUnit, Event)
	pUnit:FullCastSpellonTarget(14099)
end

function ThunderClap(pUnit, Event)
	pUnit:FullCastSpellonTarget(15588)
end

function PX_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function PX_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(9502, 1, "PX_OnCombat")
RegisterUnitEvent(9502, 2, "PX_OnLeaveCombat")
RegisterUnitEvent(9502, 4, "PX_OnDeath")