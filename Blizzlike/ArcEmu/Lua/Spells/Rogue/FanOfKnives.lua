--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Mathix, Foereaper; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function FanOfKnivesFix(event, plr, spellid)
	if(spellid == 51723) then
		local Enemies = plr:GetInRangeEnemies()
		for _, v in ipairs(Enemies) do
			if(plr:GetDistanceYards(v) <= 8) then
				plr:DealDamage(v, math.random(400,500), 51723)
			end
		end
	end
end
 
RegisterServerHook(10, "FanOfKnivesFix")