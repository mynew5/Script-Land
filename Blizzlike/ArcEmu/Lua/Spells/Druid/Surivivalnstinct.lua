--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SurivalInstincts(event, player, SpellId, pSpellObject)
	if(SpellId == 61336) then
		local plr = player:GetHealth()
		local maxhp = player:GetMaxHealth()
		player:SetHealth(plr * 1.30, maxhp * 1.30)
		player:RegisterTimedEvent("ResetHP", 20000, 1)
	end
end

function ResetHP(player, event)
	player:SetHealth(plr, maxhp)
end

RegisterServerHook(10, "SurivalInstincts")
