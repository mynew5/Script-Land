--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Axtroz_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Breath", 10000, 0)
	pUnit:RegisterEvent("Rend", 15000, 0)
end

function Breath(pUnit, Event)
	if(pUnit:GetMainTank() ~= nil) then
		pUnit:FullCastSpellOnTarget(20712, pUnit:GetMainTank())
	end
end

function Rend(pUnit, Event)
	if(pUnit:GetMainTank() ~= nil) then
		pUnit:FullCastSpellOnTarget(20712, pUnit:GetMainTank())
	end
end

function Axtroz_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Axtroz_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(12899, 1, "Axtroz_OnCombat")
RegisterUnitEvent(12899, 2, "Axtroz_OnLeaveCombat")
RegisterUnitEvent(12899, 4, "Axtroz_OnDeath")
--[[
function BalgarastheFoul_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("FrostN", 10000, 0)
	pUnit:RegisterEvent("Volley", 15000, 0)
	pUnit:RegisterEvent("Volatile', 20000, 0)
end
]]--
function BlackSlime_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Sludge", 300000, 0)
end

function Sludge(pUnit, Event)
	if(pUnit:GetMainTarget() ~= nil) then
		pUnit:FullCastSpellOnTarget(3335, pUnit:GetMainTarget())
	end
end

function BlackSlime_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function BlackSlime_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(1030, 1, "BlackSlime_OnCombat")
RegisterUnitEvent(1030, 2, "BlackSlime_OnLeaveCombat")
RegisterUnitEvent(1030, 4, "BlackSlime_OnDeath")

function MosshideGnoll_OnCombat(pUnit, Event)
local text = math.random(1,2)
	if(text == 1) then
		pUnit:SendChatMessage(12, 0, "Grrrr... fresh meat!")
	
	elseif(text == 2) then
		pUnit:SendChatMessage(12, 0, "More bones to gnaw on...")
	end
end

function MosshideGnoll_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function MosshideGnoll_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(1007, 1, "MosshideGnoll_OnCombat")
RegisterUnitEvent(1007, 2, "MosshideGnoll_OnLeaveCombat")
RegisterUnitEvent(1007, 4, "MosshideGnoll_OnDeath")

function MosshideMongrel_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Decay", 10000, 0)
end

function Decay(pUnit, Event)
	if(pUnit:GetMainTank() ~= nil) then
		pUnit:CastSpellOnTarget(8016, pUnit:GetMainTank())
	end
end

function MosshideMongrel_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function MosshideMongrel_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(1008, 1, "MosshideMongrel_OnCombat")
RegisterUnitEvent(1008, 2, "MosshideMongrel_OnLeaveCombat")
RegisterUnitEvent(1008, 4, "MosshideMongrel_OnDeath")