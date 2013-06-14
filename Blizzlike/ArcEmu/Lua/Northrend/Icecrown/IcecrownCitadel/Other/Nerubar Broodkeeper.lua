--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Holystone Productions; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local NerubarBroodkeeper = 36725

function NerubarBroodkeeper_OnCombat(pUnit, event)
	pUnit:RegisterEvent("Crypt_Scarabs", 10000, 1)
end

function Crypt_Scarabs(pUnit, event)
   pUnit:FullCastSpell(70965)
   pUnit:RegisterEvent("Dark_Mending", 8000, 1)
end

function Dark_Mending(pUnit, event)
	if(pUnit:GetRandomFriend() ~= nil) then
		pUnit:FullCastSpellOnTarget(71020, pUnit:GetRandomFriend())
		pUnit:RegisterEvent("Crypt_Scarabs", 8000, 1)
	end
end

function NerubarBroodkeeper_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(NerubarBroodkeeper, 1, "NerubarBroodkeeper_OnCombat")
RegisterUnitEvent(NerubarBroodkeeper, 2, "NerubarBroodkeeper_OnLeaveCombat")