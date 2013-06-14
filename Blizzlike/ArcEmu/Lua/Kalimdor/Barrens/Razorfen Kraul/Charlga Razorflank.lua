--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Charlga_OnCombat(pUnit, event)
local chance = math.random(1,3)
	if (chance == 1) then
		pUnit:SendChatMessage(14, 0, "Troublesome whelps. I'll teach you to interfere!")
--		pUnit:PlaySoundToSet()
	elseif (chance == 2) then
		pUnit:SendChatMessage(14, 0, "You outsiders will pay for encroahing on our land!")
--		pUnit:PlaySoundToSet()
	elseif (chance == 3) then
		pUnit:SendChatMessage(14, 0, "Bah! My power rules here!")
--		pUnit:PlaySoundToSet()
	end
	pUnit:RegisterEvent("Chain", 7000, 0)
	pUnit:RegisterEvent("Mana", 14000, 0)
	pUnit:RegisterEvent("Purity", 21000, 0)
	pUnit:RegisterEvent("Renew", 28000, 0)
end

function Chain(pUnit, Event)
	pUnit:FullCastSpellOnTarget(8292, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Chain", 7000, 0)
end

function Mana(pUnit, Event)
	pUnit:CastSpell(8358)
	pUnit:RegisterEvent("Mana", 14000, 0)
end

function Purity(pUnit, Event)
	pUnit:CastSpell(8361)
	pUnit:RegisterEvent("Purity", 21000, 0)
end

function Renew(pUnit, Event)
	pUnit:CastSpell(25058)
	pUnit:RegisterEvent("Renew", 28000, 0)
end

function Charlga_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end

function Charlga_OnKilledPlayer(pUnit, event)
	pUnit:SendChatMessage(14, 0, "Who's next?")
--	pUnit:PlaySoundToSet()
end

function Charlga_OnDeath(pUnit, event)
	pUnit:SendChatMessage(14, 0, "Our new allies will avenge us!")
--	pUnit:PlaySoundToSet()
	pUnit:RemoveEvents()
end

RegisterUnitEvent(4421, 1, "Charlga_OnCombat")
RegisterUnitEvent(4421, 2, "Charlga_OnLeaveCombat")
RegisterUnitEvent(4421, 3, "Charlga_OnKilledPlayer")
RegisterUnitEvent(4421, 4, "Charlga_OnDeath")