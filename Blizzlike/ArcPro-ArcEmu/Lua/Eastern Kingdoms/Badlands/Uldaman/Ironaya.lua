--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: DARKI
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

local knocked = 0
local wstomp = 0

function Ironaya_OnCombat(Unit, Event)
	Unit:SendChatMessage(12, 0, "Nobody steals the secrets of the Creator!") 
	Unit:PlaySoundToSet(5851)	
	Unit:RegisterEvent("Ironaya_Knockaway", 1000, 0)	
	Unit:RegisterEvent("Ironaya_Arcing", 3000, 1)
end

function Ironaya_Knockaway(Unit, Event)
	if((Unit:GetHealthPct() < 50) and (knocked == 0)) then
		Unit:FullCastSpellOnTarget(22893, Unit:GetRandomPlayer())
		local knocked = 1
	end
end

function Ironaya_Arcing(Unit, Event)	
	Unit:CastSpell(39144)
end

function Ironaya_Wstomp(Unit, Event)	
	if((Unit:GetHealthPct() < 25) and (wstomp == 0)) then
		Unit:CastSpell(16727)
		local wstomp = 1
	end
end

function Ironaya_OnLeaveCombat(Unit, Event)	
	Unit:RemoveEvents()
end

function Ironaya_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(7228, 1, "Ironaya_OnCombat")
RegisterUnitEvent(7228, 2, "Ironaya_OnLeaveCombat")
RegisterUnitEvent(7228, 4, "Ironaya_OnDied")