--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Mager; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Ashkaz_ArakkoaBlast(Unit)
	if(Unit:IsCasting() == false) then
		Unit:FullCastSpellOnTarget(32907, Unit:GetClosestPlayer())
	elseif(Unit:IsCasting() == true) then
		Unit:CancelSpell(26098)
	end
end

function Ashkaz_LightningBolt(Unit)
	Unit:FullCastSpellOnTarget(26098)
end

function Ashkaz_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("Ashkaz_LightningBolt", math.random(4300,7300), 0)
	Unit:RegisterEvent("Ashkaz_ArakkoaBlast", math.random(8000,15000), 0)
	Unit:CastSpell(32924)
end

RegisterUnitEvent(18539, 1, "Ashkaz_OnEnterCombat")