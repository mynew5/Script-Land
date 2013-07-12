--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: Mathix, Runemaster
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function LifestealEnchantFix(effectIndex, spell)
	local procnumber = math.random(1,10)
	if(procnumber == 1) then
		local player = spell:GetCaster()
		local maxhealth = player:GetHealth()
		local lifestealenemy = player:GetSelection()
		player:SetHealth(maxhealth+30)
		player:DealDamage(lifestealenemy, 30, 27104)
	end
end

RegisterDummySpell(27104, "LifestealEnchantFix")