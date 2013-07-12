--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: Mathix
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--Manaburn
function OnCastManaBurn(Event, player, spellid)
	if(spellid == 14033) then
		local target = player:GetRandomPlayer(4)
		local distance = player:GetDistance(target)
		--[[if(distance <= 30) then
			local manaburnvalue = math.random(71,78)
			local playermana = target:GetMaxMana()
			local manataken = playermana:manaburnvalue()
			player:SetMana(manataken)
		end]]
	end
end

RegisterServerHook(10, "OnCastManaBurn")

--Psychic Scream
function OnCastPsychicScream(Event, player, spellid)
	if(spellid == 13704) then
		local targets = player:GetInRangePlayers()
		local distance = player:GetDistance(targets)
		if(distance <= 8) then
			targets:AddAura(13704, 4000)
		end
	end
end

RegisterServerHook(10, "OnCastPsychicScream")

--Shadow Shield
function OnCastShadowShield(Event, player, spellid)
	player:AddAura(12040, 30000)
	local damageabsorb = 200
end

function AbsorbShadowShield(Unit, Event, attacker, amount)
	if(Unit:HasAura(12040)) then
		local damageabsorb = damageabsorb-amount
		if(damageabsorb <= 0) then
			Unit:RemoveAura(12040)
		elseif(damageabsorb >=1) then
			local maxhp = Unit:GetMaxHealth()
			Unit:SetHealth(maxhp+amount)
		end
	end
end

RegisterServerHook(10, "OnCastShadowShield")
RegisterUnitEvent(9018, 23, "AbsorbShadowShield")