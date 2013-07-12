--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Mager; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AuchenaiDoomsayer_Heal(Unit)
	if(Unit:GetHealthPct() < 43) then
		Unit:CastSpell(11642)
	end
end

function AuchenaiDoomsayer_Mind(Unit)
local Spell = math.random(1,2)
	if(Spell == 1) then
		Unit:FullCastSpellOnTarget(3516)
	elseif(Spell == 2) then
		Unit:FullCastSpellOnTarget(16568)
	end
end

function AuchenaiDoomsayer_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("AuchenaiDoomsayer_MindBlast", math.random(2300,5600), 0)
	Unit:RegisterEvent("AuchenaiDoomsayer_Heal", 12000, 2)
end

RegisterUnitEvent(21285, 1, "AuchenaiDoomsayer_OnEnterCombat")