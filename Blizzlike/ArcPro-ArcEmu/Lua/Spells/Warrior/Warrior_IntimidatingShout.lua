--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: Mathix
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function IntimidatingShout_Spell_Fixe(event, plr, spellid)
	if(spellid == 65930) then
		local Enemy = plr:GetClosestEnemy()
		if(plr:GetDistanceYards(Enemy) < 15) then
			Enemy:AddAura(5782, 8000)
		end
	end
end

RegisterServerHook(10, "IntimidatingShout_Spell_Fixe")