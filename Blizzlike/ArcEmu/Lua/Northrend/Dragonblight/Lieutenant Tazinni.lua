--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function LieutenantTazinni_OnCombat(Unit, Event)
	Unit:RegisterEvent("LieutenantTazinni_DragonsBreath", 7000, 0)
	Unit:RegisterEvent("LieutenantTazinni_FrostfireBolt", 8000, 0)
end

function LieutenantTazinni_DragonsBreath(Unit, Event) 
	Unit:CastSpell(35250) 
end

function LieutenantTazinni_FrostfireBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(51779, Unit:GetMainTank()) 
end

function LieutenantTazinni_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LieutenantTazinni_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26815, 1, "LieutenantTazinni_OnCombat")
RegisterUnitEvent(26815, 2, "LieutenantTazinni_OnLeaveCombat")
RegisterUnitEvent(26815, 4, "LieutenantTazinni_OnDied")