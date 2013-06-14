--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Holystone Productions; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function IntimidatingShout_Spell_Fixe(event, plr, spellid)
	if(spellid == 65930) then
		local Enemy = plr:GetClosestEnemy()
		if(plr:GetDistanceYards(Enemy) < 15) then
			Enemy:AddAura(5782, 8000)
		end
	end
end

RegisterServerHook(10, "IntimidatingShout_Spell_Fixe")