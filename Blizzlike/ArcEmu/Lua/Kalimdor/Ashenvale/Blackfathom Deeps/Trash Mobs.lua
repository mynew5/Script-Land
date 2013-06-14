--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--[[To do: Blindlight Murloc, Murkshallow Snapclaw, Skittering Crustacean, 
Snapping Crustacean, Blindlight Muckdweller, Blindlight Oracle, Barbed Crustacean, 
Deep Pool Threshfin, Barbed Crustacean, Murkshallow Softshell, Voidwalker Minion]]--

--Twilight Acolyte/Reaver/Aquamancer/Loreseeker/Elementalist/Shadowmage
function Twilight_OnEnterCombat(pUnit, event)
local chance = math.random(1,5)
	if(chance == 1) then
		pUnit:SendChatMessage(12, 0, "Aku'mai demands more sacrifices, now you must die!")
	elseif(chance == 2) then
		pUnit:SendChatMessage(12, 0, "Intruders! The Hammer shall fall upon you.")
	elseif(chance == 3) then
		pUnit:SendChatMessage(12, 0, "The Old Gods will be restored. You will not be allowed to interfere!")
	elseif(chance == 4) then
		pUnit:SendChatMessage(12, 0, "Your blood shall be the catalyst for the Old Gods' return!")
	else
	end
end

function Twilight_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end

function Twilight_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(4813, 1, "Twilight_OnEnterCombat")
RegisterUnitEvent(4813, 2, "Twilight_OnLeaveCombat")
RegisterUnitEvent(4813, 4, "Twilight_OnDeath")
RegisterUnitEvent(4814, 1, "Twilight_OnEnterCombat")
RegisterUnitEvent(4814, 2, "Twilight_OnLeaveCombat")
RegisterUnitEvent(4814, 4, "Twilight_OnDeath")
RegisterUnitEvent(4810, 1, "Twilight_OnEnterCombat")
RegisterUnitEvent(4810, 2, "Twilight_OnLeaveCombat")
RegisterUnitEvent(4810, 4, "Twilight_OnDeath")
RegisterUnitEvent(4812, 1, "Twilight_OnEnterCombat")
RegisterUnitEvent(4812, 2, "Twilight_OnLeaveCombat")
RegisterUnitEvent(4812, 4, "Twilight_OnDeath")
RegisterUnitEvent(4811, 1, "Twilight_OnEnterCombat")
RegisterUnitEvent(4811, 2, "Twilight_OnLeaveCombat")
RegisterUnitEvent(4811, 4, "Twilight_OnDeath")
RegisterUnitEvent(4809, 1, "Twilight_OnEnterCombat")
RegisterUnitEvent(4809, 2, "Twilight_OnLeaveCombat")
RegisterUnitEvent(4809, 4, "Twilight_OnDeath")

--Aku'mai Servant
function Servant_OnEnterCombat(pUnit, event)
	pUnit:FullCastSpellOnTarget(8398)
end

function Servant_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end

function Servant_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(4978, 1, "Servant_OnEnterCombat")
RegisterUnitEvent(4978, 2, "Servant_OnLeaveCombat")
RegisterUnitEvent(4978, 4, "Servant_OnDeath")

--Aku'mai Snapjaw
function Snapjaw_OnEnterCombat(pUnit, event)
	pUnit:FullCastSpellOnTarget(8391)
end

function Snapjaw_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end

function Snapjaw_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(4825, 1, "Snapjaw_OnEnterCombat")
RegisterUnitEvent(4825, 2, "Snapjaw_OnLeaveCombat")
RegisterUnitEvent(4825, 4, "Snapjaw_OnDeath")

--Blackfathom Myrmidon
function Myrmidon_OnEnterCombat(pUnit, event)
	pUnit:RegisterEvent("Strike", 7000, 0)
end

function Strike(pUnit, event)
	pUnit:FullCastSpellOnTarget(87081)
end

function Myrmidon_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end

function Myrmidon_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(4807, 1, "Myrmidon_OnEnterCombat")
RegisterUnitEvent(4807, 2, "Myrmidon_OnLeaveCombat")
RegisterUnitEvent(4807, 4, "Myrmidon_OnDeath")