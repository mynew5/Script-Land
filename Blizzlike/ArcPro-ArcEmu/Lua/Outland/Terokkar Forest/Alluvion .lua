--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Mager; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Aluvion_FrostNova(Unit)
	if(Unit:IsCasting() == false) then
		Unit:CastSpell(15063)
	elseif(Unit:IsCasting() == true) then
		Unit:CancelSpell(38669)
	end
end

function Aluvion_WaterBolt(Unit)
	if(Unit:IsCasting() == false) then
		Unit:FullCastSpellOnTarget(38669)
	elseif(Unit:IsCasting() == true) then
		Unit:CancelSpell(38669)
	end
end

function Aluvion_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("Aluvion_FrostNova", math.random(5300,7200), 0)
	Unit:RegisterEvent("Aluvion_WaterBolt", math.random(2600,5700), 0)
	Unit:FullCastSpellOnTarget(38669)
end

RegisterUnitEvent(21730, 1, "Aluvion_OnEnterCombat")