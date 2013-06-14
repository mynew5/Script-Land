--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Ignis_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Insolent whelps! Your blood will temper the weapons used to reclaim this world!")
end

function Ignis_OnDied(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "I. Have. Failed.")
end

function Ignis_OnKilledPlayer(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "More scraps for the scrapheap!")
	pUnit:SendChatMessage(14, 0, "Your bones will serve as kindling!")
end

function Phase_1(pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:RegisterEvent("FlameJets", 2700, 0)
	pUnit:RegisterEvent("Scorch", 15000, 0)
	pUnit:RegisterEvent("SlagPot", 6000, 0)
	pUnit:RegisterEvent("Phase_2", 1000, 0)
end

function Phase_2(pUnit, Event)
	if(pUnit:GetHealthPct() <= 40) then
		pUnit:RegisterEvent("IronConstruct", 60000, 0)
	end
end

function FlameJets(pUnit, Event)
	pUnit:CastSpellOnTarget(62680, pUnit:GetRandomPlayer(0))
end

function Scorch(pUnit, Event)
	pUnit:FullCastSpellOnTarget(62546, pUnit:GetRandomPlayer(0))
	pUnit:SendChatMessage(14, 0, "Let the inferno consume you!")
	pUnit:SendChatMessage(14, 0, "BURN! Burn in the makers fire!")
end

function SlagPot(pUnit, Event)
	pUnit:FullCastSpellOnTarget(62717, pUnit:GetRandomPlayer(0))
	pUnit:SendChatMessage(14, 0, "I will burn away your impurities!")
end

function IronConstruct(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Arise, soldiers of the Iron Crucible! The Makers' will be done!")
	pUnit:SpawnCreature(33121, pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), pUnit:GetO(), 14, 0)
end

RegisterUnitEvent(33118, 1, "Ignis_OnCombat")
RegisterUnitEvent(33118, 3, "Ignis_OnKilledPlayer")
RegisterUnitEvent(33118, 4, "Ignis_OnDied")